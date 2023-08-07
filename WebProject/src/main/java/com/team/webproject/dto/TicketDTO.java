package com.team.webproject.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class TicketDTO {
	
	String advance_ticket_code;
	String booker_code;
	String payment_code_fk;
	String performance_code;
	Date booking_date;
	String booking_time;
	String booking_type;
	int booking_price;
	int booking_qty;
	
}
