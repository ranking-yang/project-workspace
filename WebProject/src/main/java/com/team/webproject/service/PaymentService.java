package com.team.webproject.service;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;

import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;
import com.team.webproject.dto.MembersDTO;
import com.team.webproject.dto.PaymentDTO;
import com.team.webproject.dto.PerformanceDTO;
import com.team.webproject.dto.TicketDTO;

public interface PaymentService {
	
	public PerformanceDTO getPerformance(String performance_code);
	
	public List<TicketDTO> getOrders(TicketDTO ticket, String[] bookingTypes, int[] bookingPrices, int[] bookingQtys);	
	
	public MembersDTO getSingleUser(String user_id);
	
	void updateDB(PaymentDTO payment, List<TicketDTO> tickets, String performance_code);	
	
	String getPortone_api_marketkey();
	
	IamportResponse<Payment> getServerPrice(String imp_uid) throws IamportResponseException, IOException;

	void refundTicket(String payment_code, int total_price, int member_pk);

	int refundTicketDB(String payment_code, int member_pk);
}
