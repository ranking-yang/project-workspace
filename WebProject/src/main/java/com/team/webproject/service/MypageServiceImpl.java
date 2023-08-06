package com.team.webproject.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.webproject.dto.MembersDTO;
import com.team.webproject.dto.TicketDTO;
import com.team.webproject.dto.TicketsListDTO;
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
	// DTO 해결되면 지우기
	@Autowired
	LoginMapper loginMapper;
	
	@Override
	public List<TicketsListDTO> getMemberTickets(String user_id) {		
		MembersDTO member = loginMapper.checklogin(user_id);
		List<TicketDTO> tickets = ticketMapper.getMemberTicket(member.getMember_code());
		
		Map<String, TicketsListDTO> ticketMap = new HashMap<>();
		
		for (TicketDTO ticket : tickets) {
			// 티켓을 하나씩 꺼내서 payment_code가 같으면 다른거만 추가하기
			TicketsListDTO listTicketDTO = ticketMap.get(ticket.getPayment_code_fk());

			if (listTicketDTO == null) {
				listTicketDTO = new TicketsListDTO();
				
				listTicketDTO.setBooker_code(ticket.getBooker_code());
				listTicketDTO.setBooking_date(ticket.getBooking_date());
				if (ticket.getBooking_time() != null) { listTicketDTO.setBooking_time(ticket.getBooking_time()); };
				
				listTicketDTO.getAdvance_ticket_code().add(ticket.getAdvance_ticket_code());
				listTicketDTO.getBooking_type_qty().put(ticket.getBooking_type(), 1);
				
				listTicketDTO.setPayment(paymentMapper.getUserPayment(ticket.getPayment_code_fk()));
				listTicketDTO.setPerformance(performanceMapper.getPerformance(ticket.getPerformance_code()));
				

				ticketMap.put(ticket.getPayment_code_fk(), listTicketDTO);
				
			} else {
				listTicketDTO.getAdvance_ticket_code().add(ticket.getAdvance_ticket_code());
				
				Integer currentQty = listTicketDTO.getBooking_type_qty().get(ticket.getBooking_type());
				
				if (currentQty == null) {
					listTicketDTO.getBooking_type_qty().put(ticket.getBooking_type(), 1);
				} else {
					listTicketDTO.getBooking_type_qty().put(ticket.getBooking_type(), ++currentQty);
				}				
			}
		}
		
		return new ArrayList<>(ticketMap.values());
	}

}
