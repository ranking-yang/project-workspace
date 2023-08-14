package com.team.webproject.service;

public interface AdminService {
	
	int refundTickets(String payment_code, int total_price, int member_code);

}
