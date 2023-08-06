package com.team.webproject.service;

import java.util.List;

import com.team.webproject.dto.TicketsListDTO;

public interface MypageService {
	
	List<TicketsListDTO> getMemberTickets(String user_id);

}
