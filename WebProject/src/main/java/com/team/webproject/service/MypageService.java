package com.team.webproject.service;

import java.util.List;

import com.team.webproject.dto.TicketListDTO;

public interface MypageService {
	
	List<TicketListDTO> getAllTickets(String booker_code);

}
