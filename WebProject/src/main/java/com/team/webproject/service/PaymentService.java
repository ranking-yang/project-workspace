package com.team.webproject.service;

import java.util.List;

import com.team.webproject.dto.OrderDTO;
import com.team.webproject.dto.PerformanceDTO;

public interface PaymentService {
	
	public PerformanceDTO getPerformance(String performance_code);
	
	public String getApiMarketkey();
	
	public String getApiRestkey();
	
	public List<OrderDTO> getOrders(OrderDTO order, String[] bookingTypes, int[] bookingPrices, int[] bookingQtys);

}
