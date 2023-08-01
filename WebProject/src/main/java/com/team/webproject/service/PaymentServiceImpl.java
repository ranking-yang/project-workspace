package com.team.webproject.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.webproject.common.IamportAPI;
import com.team.webproject.dto.OrderDTO;
import com.team.webproject.dto.PerformanceDTO;
import com.team.webproject.mapper.PaymentMapper;
import com.team.webproject.mapper.PerformanceMapper;

@Service
public class PaymentServiceImpl implements PaymentService {
	
	@Autowired
	PerformanceMapper performanceMapper;
	
	@Autowired
	PaymentMapper paymentMapper;
	
	@Autowired
	IamportAPI imaportAPI;
	
	// 쿠폰 조회
	
	// 선택한 공연정보 조회
	@Override
	public PerformanceDTO getPerformance(String performance_code) {
		return performanceMapper.getPerformance(performance_code);
	}
	
	// API KEY 값 조회
	@Override
	public String getApiMarketkey() {
		return imaportAPI.getImport_api_marketkey();
	}
	
	@Override
	public String getApiRestkey() {
		return imaportAPI.getImport_api_restkey();
	}

	@Override
	public String getPaymentId() {
		return paymentMapper.getPaymentId();
	}
	
	// Order 리스트 만들어서 리턴
	@Override
	public List<OrderDTO> getOrders(OrderDTO order, String[] bookingTypes, int[] bookingPrices, int[] bookingQtys) {
		List<OrderDTO> orderList = new ArrayList<>();
		
		for (int i = 0; i < bookingTypes.length; ++i) {			
			if (bookingQtys[i] != 0) {
				String bookingType = bookingTypes[i];
		        int bookingPrice = bookingPrices[i];
		        int bookingQty = bookingQtys[i];
	
		        OrderDTO neworder = new OrderDTO();
		        neworder.setPerformance_code(order.getPerformance_code());
		        neworder.setBooking_date(order.getBooking_date());
		        if (order.getBooking_time() != null) {neworder.setBooking_time(order.getBooking_time());}
		        neworder.setBooking_type(bookingType);
		        neworder.setBooking_price(bookingPrice);
		        neworder.setBooking_qty(bookingQty);
		        
		        orderList.add(neworder);
			}
		}
		
		return orderList;
	}
	
	
	

}
