package com.team.webproject.service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team.webproject.dto.MembersDTO;
import com.team.webproject.dto.MypageRefundDTO;
import com.team.webproject.dto.MypageTicketDTO;
import com.team.webproject.dto.MypageTicketDetailDTO;
import com.team.webproject.dto.PerformanceDTO;
import com.team.webproject.dto.TicketOptionDTO;
import com.team.webproject.dto.TicketOptionQtyDTO;
import com.team.webproject.dto.WishlistDTO;
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
	PaymentMapper paymentMapper;
	// DTO 해결되면 지우기
	@Autowired
	LoginMapper loginMapper;
	@Autowired
	WishlistMapper wishMapper;
	@Autowired
	PerformanceMapper performanceMapper;
	
	// 티켓 리스트 조회
	@Override
	public List<MypageTicketDTO> getMemberTickets(String user_id) {
		MembersDTO member = loginMapper.checklogin(user_id);		
		return ticketMapper.getMemberTickets(member.getMember_code());
	}
	
	// 티켓 상세 관련
	@Override
	public MypageTicketDetailDTO getTicketDetail(String payment_code) {		
		return ticketMapper.getTicketDetail(payment_code);
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
	
	// 티켓 환불 DB 업데이트
	@Override
	@Transactional
	public boolean refundTicket(String payment_code) {		
		int result1 = paymentMapper.insertRefundTicket(payment_code);
		int result2 = ticketMapper.updateRefundTicketState(payment_code);		
		return result1 + result2 > 0;	
	}
	
	// 환불 티켓 리스트 조회
	@Override
	public List<MypageRefundDTO> getRefundTickets(String user_id) {
		MembersDTO member = loginMapper.checklogin(user_id);		
		return ticketMapper.getRefundTickets(member.getMember_code());
	}

	@Override
	public List<PerformanceDTO> getUserWishlist(int member_code) {
		List<WishlistDTO> userWishlist = wishMapper.getUserWishlist(member_code);
		
		
		List<String> userWishPerformanceCodes = userWishlist.stream()
	            .map(wish -> wish.getPerformance_code())
	            .collect(Collectors.toList());

		List<PerformanceDTO> userWishPerformances = new ArrayList<>();

		userWishPerformanceCodes.forEach(performance_code -> {
		    PerformanceDTO performance = performanceMapper.getPerformance(performance_code);
		    userWishPerformances.add(performance);

		});

	    return userWishPerformances;
	}

}
