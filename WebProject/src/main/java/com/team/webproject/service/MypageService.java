package com.team.webproject.service;

import java.util.List;

import com.team.webproject.dto.TicketRefundDTO;
import com.team.webproject.dto.PerformanceDTO;
import com.team.webproject.dto.TicketDetailDTO;
import com.team.webproject.dto.TicketOptionDTO;
import com.team.webproject.dto.TicketOptionQtyDTO;


public interface MypageService {
	
	List<TicketDetailDTO> getMemberTickets(String user_id);
	
	TicketDetailDTO getTicketDetail(String payment_code);
	
	List<TicketOptionQtyDTO> getTicketOptions(String payment_code);
	
	List<TicketOptionDTO> getTicketNum(String payment_code);
	
	boolean refundTicket(String payment_code);
	
	List<TicketRefundDTO> getRefundTickets(String user_id);
	
	TicketRefundDTO getRefundTicketDetail(String payment_code);
	
	List<PerformanceDTO> getUserWishlist(int member_code);


}
