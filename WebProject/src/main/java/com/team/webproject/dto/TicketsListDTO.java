package com.team.webproject.dto;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import lombok.Data;

@Data
public class TicketsListDTO {
	
	String booker_code;
	Date booking_date;
	String booking_time;
	
	List<String> advance_ticket_code = new ArrayList<String>();
	Map<String, Integer> booking_type_qty = new HashMap<String, Integer>();
	
	PaymentDTO payment;
	PerformanceDTO performance;

}
