package com.team.webproject.service;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;

import com.team.webproject.dto.MembersDTO;
import com.team.webproject.dto.PaymentDTO;
import com.team.webproject.dto.PerformanceDTO;
import com.team.webproject.dto.TicketDTO;

public interface PaymentService {
	
	public PerformanceDTO getPerformance(String performance_code);
	
	public List<TicketDTO> getOrders(TicketDTO ticket, String[] bookingTypes, int[] bookingPrices, int[] bookingQtys);	
	
	public MembersDTO getSingleUser(String user_id);
	
	void updateDB(PaymentDTO payment, List<TicketDTO> tickets, String performance_code);	
	
}
