package com.team.webproject.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team.webproject.dto.MembersDTO;
import com.team.webproject.dto.PaymentDTO;
import com.team.webproject.dto.PerformanceDTO;
import com.team.webproject.dto.TicketDTO;
import com.team.webproject.mapper.LoginMapper;
import com.team.webproject.mapper.PaymentMapper;
import com.team.webproject.mapper.PerformanceMapper;

@Service
public class PaymentServiceImpl implements PaymentService {
	
	@Autowired
	PerformanceMapper performanceMapper;
	
	@Autowired
	PaymentMapper paymentMapper;
	
	@Autowired
	LoginMapper loginMapper;
	
	// 쿠폰 조회
	
	// 유저 아이디 조회
	@Override
	public MembersDTO getSingleUser(String user_id) {
		return loginMapper.getSingleUser(user_id);
	}
	
	// 선택한 공연정보 조회
	@Override
	public PerformanceDTO getPerformance(String performance_code) {
		return performanceMapper.getPerformance(performance_code);
	}
	
	// 선택한 Ticket 리스트 만들어서 리턴
	@Override
	public List<TicketDTO> getOrders(TicketDTO ticket, String[] bookingTypes, int[] bookingPrices, int[] bookingQtys) {
		List<TicketDTO> ticketList = new ArrayList<>();
		
		if (ticket.getBooking_time() != null) {
			String[] times = ticket.getBooking_time().split(",");
			ticket.setBooking_time(times[0]);
		}
		
		for (int i = 0; i < bookingTypes.length; ++i) {			
			if (bookingQtys[i] != 0) {
				String bookingType = bookingTypes[i];
		        int bookingPrice = bookingPrices[i];
		        int bookingQty = bookingQtys[i];
	
		        TicketDTO neworder = new TicketDTO();
		        neworder.setBooker_code(ticket.getBooker_code());
		        neworder.setPerformance_code(ticket.getPerformance_code());
		        neworder.setBooking_date(ticket.getBooking_date());
		        if (ticket.getBooking_time() != null) {neworder.setBooking_time(ticket.getBooking_time());}
		        if (ticket.getPayment_code_fk() != null) {neworder.setPayment_code_fk(ticket.getPayment_code_fk());}
		        neworder.setBooking_type(bookingType);
		        neworder.setBooking_price(bookingPrice);
		        neworder.setBooking_qty(bookingQty);
		        
		        ticketList.add(neworder);
			}
		}
		
		return ticketList;
	}
	
	// 구매한 총 좌석 수 조회
	int getTotalQty(List<TicketDTO> tickets) {
		int total = 0;
		
		for (TicketDTO ticket : tickets) {
			total += ticket.getBooking_qty();
		}
		
		return total;
	}
	
	// DB에 저장
	@Override
	@Transactional
	public void UpdateDB(PaymentDTO payment, List<TicketDTO> tickets, String performance_code) {
		
		paymentMapper.insertPayment(payment);
		
		for (TicketDTO ticket : tickets) {
			paymentMapper.insertTicket(ticket);	
		}
		
		paymentMapper.updatePerformaceQty(performance_code, getTotalQty(tickets));

	}
	

}
