package com.team.webproject.mapper;

import java.util.List;

import com.team.webproject.dto.MypageTicketDTO;

public interface TicketMapper {
	
	List<MypageTicketDTO> getMemberTicket(Integer booker_code);

}
