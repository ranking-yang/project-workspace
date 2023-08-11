package com.team.webproject.mapper;

import com.team.webproject.dto.PaymentDTO;
import com.team.webproject.dto.TicketDTO;

public interface PaymentMapper {
	
	int insertPayment(PaymentDTO payment);
	
	int insertTicket(TicketDTO orders);
	
	int updatePerformaceQty(String performance_code, int qty);
	
	PaymentDTO getUserPayment(String payment_code);
	
	int insertRefundTicket(String payment_code);

}
