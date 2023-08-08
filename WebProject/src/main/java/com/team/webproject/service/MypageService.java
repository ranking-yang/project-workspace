package com.team.webproject.service;

import java.util.List;

import com.team.webproject.dto.MypageTicketDTO;

public interface MypageService {
	
	List<MypageTicketDTO> getMemberTickets(String user_id);

}
