package com.team.webproject.mapper;

import java.util.List;

import com.team.webproject.dto.TicketDTO;

public interface TicketMapper {
	
	List<TicketDTO> getMemberTicket(Integer booker_code);

}
