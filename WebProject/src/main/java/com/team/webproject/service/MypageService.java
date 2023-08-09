package com.team.webproject.service;

import java.util.List;

import com.team.webproject.dto.MypageTicketDTO;
import com.team.webproject.dto.PerformanceDTO;

public interface MypageService {
	
	List<MypageTicketDTO> getMemberTickets(String user_id);
	List<PerformanceDTO> getUserWishlist(int member_code);

}
