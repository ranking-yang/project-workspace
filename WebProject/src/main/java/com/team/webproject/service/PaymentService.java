package com.team.webproject.service;

import java.util.List;
import java.util.Map;

import com.team.webproject.dto.MembersDTO;
import com.team.webproject.dto.PaymentDTO;
import com.team.webproject.dto.PerfomSaleDTO;
import com.team.webproject.dto.PerformanceDTO;
import com.team.webproject.dto.TicketDTO;

public interface PaymentService {
	
	public PerformanceDTO getPerformance(String performance_code);
	
	public List<TicketDTO> getOrders(TicketDTO ticket, String[] bookingTypes, int[] bookingPrices, int[] bookingQtys);	
	
	public MembersDTO getSingleUser(String user_id);
	
	void UpdateDB(PaymentDTO payment, List<TicketDTO> tickets, String performance_code);
	
	public Map<String, Integer> calc_month(List<PaymentDTO> payment);
	
	public Map<String, Integer> calc_wekend(List<PaymentDTO> payment);
	
	public Map<String, Integer> calc_day(List<PaymentDTO> payment);
	
	public Map<String, Integer> rankin_perfom(String option);
	public Map<String, Integer> rankin_perfomall();
}
