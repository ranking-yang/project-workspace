package com.team.webproject.mapper;

import java.util.List;
import java.util.Map;

import com.team.webproject.dto.MypageRefundDTO;
import com.team.webproject.dto.MypageTicketDTO;
import com.team.webproject.dto.MypageTicketDetailDTO;
import com.team.webproject.dto.TicketOptionDTO;
import com.team.webproject.dto.TicketOptionQtyDTO;

public interface TicketMapper {
	
	List<MypageTicketDTO> getMemberTickets(Integer booker_code);
	
	MypageTicketDetailDTO getTicketDetail(String payment_code);
	
	List<MypageRefundDTO> getRefundTickets(Integer booker_code);
	
	List<TicketOptionQtyDTO> getTicketOptionQty(String payment_code);
	
	List<TicketOptionDTO> getTicketNum(String payment_code);
	
	int updateRefundTicketState(String payment_code);
	
}
