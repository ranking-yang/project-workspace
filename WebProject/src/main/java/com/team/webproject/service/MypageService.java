package com.team.webproject.service;

import java.util.List;

import com.team.webproject.dto.MypageRefundDTO;
import com.team.webproject.dto.MypageTicketDTO;
import com.team.webproject.dto.MypageTicketDetailDTO;
import com.team.webproject.dto.PerformanceDTO;
import com.team.webproject.dto.TicketOptionDTO;
import com.team.webproject.dto.TicketOptionQtyDTO;


public interface MypageService {
	
	List<MypageTicketDTO> getMemberTickets(String user_id);
	
	MypageTicketDetailDTO getTicketDetail(String payment_code);
	
	List<TicketOptionQtyDTO> getTicketOptions(String payment_code);
	
	List<TicketOptionDTO> getTicketNum(String payment_code);
	
	boolean refundTicket(String payment_code);
	
	List<MypageRefundDTO> getRefundTickets(String user_id);
	
	List<PerformanceDTO> getUserWishlist(int member_code);


}
