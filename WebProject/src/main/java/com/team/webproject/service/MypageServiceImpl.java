package com.team.webproject.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.webproject.dto.MembersDTO;
import com.team.webproject.dto.MypageTicketDTO;
import com.team.webproject.dto.PerformanceDTO;
import com.team.webproject.dto.WishlistDTO;
import com.team.webproject.mapper.LoginMapper;
import com.team.webproject.mapper.PerformanceMapper;
import com.team.webproject.mapper.TicketMapper;
import com.team.webproject.mapper.WishlistMapper;

@Service
public class MypageServiceImpl implements MypageService {

	@Autowired
	TicketMapper ticketMapper;
	// DTO 해결되면 지우기
	@Autowired
	LoginMapper loginMapper;
	@Autowired
	WishlistMapper wishMapper;
	@Autowired
	PerformanceMapper performanceMapper;
	
	@Override
	public List<MypageTicketDTO> getMemberTickets(String user_id) {
		MembersDTO member = loginMapper.checklogin(user_id);		
		return ticketMapper.getMemberTicket(member.getMember_code());
	}

	@Override
	public List<PerformanceDTO> getUserWishlist(int member_code) {
		List<WishlistDTO> userWishlist = wishMapper.getUserWishlist(member_code);
		
		
		List<String> userWishPerformanceCodes = userWishlist.stream()
	            .map(wish -> wish.getPerformance_code())
	            .collect(Collectors.toList());

		List<PerformanceDTO> userWishPerformances = new ArrayList<>();

		userWishPerformanceCodes.forEach(performance_code -> {
		    PerformanceDTO performance = performanceMapper.getPerformance(performance_code);
		    userWishPerformances.add(performance);

		});

	    return userWishPerformances;
	}

}
