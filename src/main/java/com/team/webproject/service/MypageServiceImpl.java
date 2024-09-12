package com.team.webproject.service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team.webproject.common.Principal;
import com.team.webproject.dto.MembersDTO;
import com.team.webproject.dto.OAuthPropertiesDTO;
import com.team.webproject.dto.PerformanceDTO;
import com.team.webproject.dto.TicketDetailDTO;
import com.team.webproject.dto.TicketOptionDTO;
import com.team.webproject.dto.TicketOptionQtyDTO;
import com.team.webproject.dto.TicketRefundDTO;
import com.team.webproject.dto.WishlistDTO;
import com.team.webproject.mapper.CouponMapper;
import com.team.webproject.mapper.LoginMapper;
import com.team.webproject.mapper.PaymentMapper;
import com.team.webproject.mapper.PerformanceMapper;
import com.team.webproject.mapper.TicketMapper;
import com.team.webproject.mapper.WishlistMapper;

@Service
public class MypageServiceImpl implements MypageService {

	@Autowired
	TicketMapper ticketMapper;
	@Autowired
	CouponMapper couponMapper;
	@Autowired
	PaymentMapper paymentMapper;
	// DTO 해결되면 지우기
	@Autowired
	LoginMapper loginMapper;
	@Autowired
	WishlistMapper wishMapper;
	@Autowired
	PerformanceMapper performanceMapper;
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	@Autowired
	OAuthPropertiesDTO oauth;

	// 티켓 리스트 조회
	@Override
	public List<TicketDetailDTO> getMemberTickets(Integer user_code) {
		return ticketMapper.getMemberTickets(user_code);
	}

	@Override
	public List<TicketDetailDTO> getMemberTickets_available(Integer user_code) {
		return ticketMapper.getMemberTickets_available(user_code);
	}

	@Override
	public List<TicketDetailDTO> getMemberTickets_done(Integer user_code) {
		return ticketMapper.getMemberTickets_done(user_code);
	}

	@Override
	public List<TicketDetailDTO> getMemberTickets_old(Integer user_code) {
		return ticketMapper.getMemberTickets_old(user_code);
	}

	// 티켓 상세 관련
	@Override
	public TicketDetailDTO getTicketDetail(String payment_code) {
		if (paymentMapper.getCoupontNum(payment_code) != null) {
			return ticketMapper.getTicketDetail_hasCoupon(payment_code);
		} else {
			return ticketMapper.getTicketDetail(payment_code);
		}
	}

	// 티켓 상세 관련
	@Override
	public List<TicketOptionQtyDTO> getTicketOptions(String payment_code) {
		return ticketMapper.getTicketOptionQty(payment_code);
	}

	// 티켓 상세 관련
	@Override
	public List<TicketOptionDTO> getTicketNum(String payment_code) {
		return ticketMapper.getTicketNum(payment_code);
	}

	// 티켓 환불 DB 업데이트 (요청만)
	@Override
	@Transactional
	public boolean refundTicket(Integer user_code, String payment_code) {
		if (paymentMapper.chkPayment_code(payment_code) == null) {
			int result1 = paymentMapper.insertRefundTicket(payment_code);
			int result2 = ticketMapper.updateRefundTicketState(payment_code);
			int result3 = couponMapper.updateCouponReturn(user_code, payment_code); // 쿠폰 돌려주기 (state 0으로 변경)
			return result1 + result2 + result3 > 0;
		} else {
			return false;
		}
	}

	// 환불 티켓 리스트 조회
	@Override
	public List<TicketRefundDTO> getRefundTickets(Integer user_code) {
		return ticketMapper.getRefundTickets(user_code);
	}

	// 환불 티켓 디테일 조회
	@Override
	public TicketRefundDTO getRefundTicketDetail(String payment_code) {
		if (paymentMapper.getCoupontNum(payment_code) != null) {
			return ticketMapper.getRefundTicketDetail_hasCoupon(payment_code);
		} else {
			return ticketMapper.getRefundTicketDetail(payment_code);
		}
	}

	@Override
	public List<PerformanceDTO> getUserWishlist(int member_code) {
		List<WishlistDTO> userWishlist = wishMapper.getUserWishlist(member_code);

		List<String> userWishPerformanceCodes = userWishlist.stream().map(wish -> wish.getPerformance_code())
				.collect(Collectors.toList());

		List<PerformanceDTO> userWishPerformances = new ArrayList<>();

		userWishPerformanceCodes.forEach(performance_code -> {
			PerformanceDTO performance = performanceMapper.getPerformance(performance_code);
			userWishPerformances.add(performance);

		});

		return userWishPerformances;
	}

	@Override
	public boolean checkPassword(String member_id, String member_pwd) {

		MembersDTO member = loginMapper.checklogin(member_id);

		return passwordEncoder.matches(member_pwd, member.getMember_pwd());
	}

	@Override
	public boolean hasCookie(String member_id, HttpServletRequest req) {

		boolean isVerified = false;

		Cookie[] cookies = req.getCookies();

		if (cookies == null)
			return false;

		for (Cookie cookie : cookies) {
			String memberId = cookie.getName();
			String verified = cookie.getValue();

			isVerified |= memberId.equals(member_id) && verified.equals("verified");
		}

		return isVerified;
	}

	@Override
	public void setVerifiedCookie(String member_id, HttpServletResponse resp) {

		Cookie cookie = new Cookie(member_id, "verified");

		cookie.setMaxAge(60 * 60);
		cookie.setPath("/mypage/");

		resp.addCookie(cookie);
	}

	@Override
	public int modifyMemberInfo(MembersDTO member) {

		String memberId = member.getMember_id();

		if (memberId.startsWith("naver_") || memberId.startsWith("kakao_")) {
			member.setMember_pwd(passwordEncoder.encode(oauth.getPassword()));
		}

		String phoneWithHypen = member.getMember_phone();
		String phone = "";

		if (phoneWithHypen != null) {
			for (int i = 0; i < phoneWithHypen.length(); ++i) {
				if (phoneWithHypen.charAt(i) == '-') {
					continue;
				} else {
					phone += phoneWithHypen.charAt(i);
				}
			}
		} else {
			phone = null;
		}

		Principal.getUser().setMember_birth(member.getMember_birth());
		Principal.getUser().setMember_email(member.getMember_email());
		Principal.getUser().setMember_name(member.getMember_name());
		Principal.getUser().setMember_phone(phone);
		Principal.getUser().setMember_pwd(passwordEncoder.encode(member.getMember_pwd()));

		member.setMember_phone(phone);
		member.setMember_pwd(passwordEncoder.encode(member.getMember_pwd()));

		return loginMapper.updateMember(member);
	}

}
