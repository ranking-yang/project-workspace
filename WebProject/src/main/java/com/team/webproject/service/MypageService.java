package com.team.webproject.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team.webproject.dto.MembersDTO;
import com.team.webproject.dto.PerformanceDTO;
import com.team.webproject.dto.TicketDetailDTO;
import com.team.webproject.dto.TicketOptionDTO;
import com.team.webproject.dto.TicketOptionQtyDTO;
import com.team.webproject.dto.TicketRefundDTO;


public interface MypageService {
	
	List<TicketDetailDTO> getMemberTickets(Integer user_code);
	
	List<TicketDetailDTO> getMemberTickets_available(Integer user_code);
	
	List<TicketDetailDTO> getMemberTickets_done(Integer user_code);
	
	List<TicketDetailDTO> getMemberTickets_old(Integer user_code);
	
	TicketDetailDTO getTicketDetail(String payment_code);
	
	List<TicketOptionQtyDTO> getTicketOptions(String payment_code);
	
	List<TicketOptionDTO> getTicketNum(String payment_code);
	
	boolean refundTicket(Integer user_code, String payment_code);
	
	List<TicketRefundDTO> getRefundTickets(Integer user_code);
	
	TicketRefundDTO getRefundTicketDetail(String payment_code);
	
	List<PerformanceDTO> getUserWishlist(int member_code);
	
	// 회원정보 수정전, 본인이 맞는지 확인하는 절차
	boolean checkPassword(String member_id, String member_pwd);
	// 회원정보 수정창에서 이미 인증된 회원인지 확인하는 절차
	boolean hasCookie(String member_id, HttpServletRequest req);
	// 인증된 회원에게 쿠키를 부여하는 절차
	void setVerifiedCookie(String member_id, HttpServletResponse resp);
	// 회원정보 수정절차
	int modifyMemberInfo(MembersDTO member);

}
