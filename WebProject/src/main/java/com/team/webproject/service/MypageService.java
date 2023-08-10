package com.team.webproject.service;

import java.sql.Date;
import java.util.List;

import com.team.webproject.dto.TicketRefundDTO;
import com.team.webproject.dto.PerformanceDTO;
import com.team.webproject.dto.TicketDetailDTO;
import com.team.webproject.dto.TicketOptionDTO;
import com.team.webproject.dto.TicketOptionQtyDTO;


public interface MypageService {
	
	List<TicketDetailDTO> getMemberTickets(Integer user_code);
	
	TicketDetailDTO getTicketDetail(String payment_code);
	
	List<TicketOptionQtyDTO> getTicketOptions(String payment_code);
	
	List<TicketOptionDTO> getTicketNum(String payment_code);
	
	boolean refundTicket(String payment_code);
	
	List<TicketRefundDTO> getRefundTickets(Integer user_code);
	
	TicketRefundDTO getRefundTicketDetail(String payment_code);
	
	List<PerformanceDTO> getUserWishlist(int member_code);
	
	Date chkEndDate(String performance_code);


}
