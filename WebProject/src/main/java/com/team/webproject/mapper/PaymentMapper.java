package com.team.webproject.mapper;

import java.util.List;

import com.team.webproject.dto.PaymentDTO;
import com.team.webproject.dto.TicketDTO;

public interface PaymentMapper {
	
	int insertPayment(PaymentDTO payment);
	
	int insertTicket(TicketDTO orders);
	
	int updatePerformaceQty(String performance_code, int qty);

}
