package com.team.webproject.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.webproject.dto.MembersDTO;
import com.team.webproject.dto.TicketDTO;
import com.team.webproject.dto.TicketListDTO;
import com.team.webproject.mapper.LoginMapper;
import com.team.webproject.mapper.PaymentMapper;
import com.team.webproject.mapper.PerformanceMapper;
import com.team.webproject.mapper.TicketMapper;

@Service
public class MypageServiceImpl implements MypageService {
	
	@Autowired
	PerformanceMapper performanceMapper;
	
	@Autowired
	PaymentMapper paymentMapper;
	
	@Autowired
	TicketMapper ticketMapper;
	
	// 나중에 DTO 해결되면 지우기
	@Autowired
	LoginMapper loginMapper;

	
	@Override
	public List<TicketListDTO> getAllTickets(String member_id) {
		List<TicketListDTO> member_tickets = new ArrayList<TicketListDTO>();	
		
		MembersDTO member = loginMapper.checklogin(member_id);		
		List<TicketDTO> tickets = ticketMapper.getMemberTicket(member.getMember_code());
		
		// tickets 리스트에서 하나씩 뽑아서 저장
		// 단, payment_code가 같으면 advance_ticket_code, booking_type_qty 배열에만 추가
		for (TicketDTO ticket : tickets) {
			TicketListDTO ticketList = new TicketListDTO();
			
			
			
		}	
				
		
		return member_tickets;
	}
	
	
	
	
}
