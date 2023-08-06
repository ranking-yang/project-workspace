package com.team.webproject.dto;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class TicketListDTO {
	
	List<Integer> advance_ticket_code;
	Date booking_date;
	String booking_time;
	Map<String, Integer> booking_type_qty;

	String booker_code;
	PerformanceDTO performance;
	PaymentDTO payment;
	
	
}