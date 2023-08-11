package com.team.webproject.mapper;

import java.util.List;

import com.team.webproject.dto.TicketRefundDTO;
import com.team.webproject.dto.TicketDetailDTO;
import com.team.webproject.dto.TicketOptionDTO;
import com.team.webproject.dto.TicketOptionQtyDTO;

public interface TicketMapper {
	
	List<TicketDetailDTO> getMemberTickets(Integer booker_code);
	
	List<TicketDetailDTO> getMemberTickets_available(Integer booker_code);
	
	List<TicketDetailDTO> getMemberTickets_done(Integer booker_code);
	
	List<TicketDetailDTO> getMemberTickets_old(Integer booker_code);
	
	TicketDetailDTO getTicketDetail(String payment_code);
	
	List<TicketRefundDTO> getRefundTickets(Integer booker_code);
	
	TicketRefundDTO getRefundTicketDetail (String payment_code);
	
	List<TicketOptionQtyDTO> getTicketOptionQty(String payment_code);
	
	List<TicketOptionDTO> getTicketNum(String payment_code);
	
	int updateRefundTicketState(String payment_code);
	
}
