package com.team.webproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.webproject.dto.MembersDTO;
import com.team.webproject.dto.MypageTicketDTO;
import com.team.webproject.mapper.LoginMapper;
import com.team.webproject.mapper.TicketMapper;

@Service
public class MypageServiceImpl implements MypageService {

	@Autowired
	TicketMapper ticketMapper;
	// DTO 해결되면 지우기
	@Autowired
	LoginMapper loginMapper;
	
	@Override
	public List<MypageTicketDTO> getMemberTickets(String user_id) {
		MembersDTO member = loginMapper.checklogin(user_id);		
		return ticketMapper.getMemberTicket(member.getMember_code());
	}

}
