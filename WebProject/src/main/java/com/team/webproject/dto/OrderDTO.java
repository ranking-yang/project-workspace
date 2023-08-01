package com.team.webproject.dto;

import lombok.Data;

@Data
public class OrderDTO {
	
	String advance_ticket_code;
	String booker_code;
	String performance_code;
	String booking_date;
	String booking_time;
	String booking_type;
	int booking_price;
	int booking_qty;
	
}
