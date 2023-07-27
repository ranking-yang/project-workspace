package com.team.webproject.dto;

import java.sql.Date;
import java.time.LocalDate;

import lombok.ToString;

@ToString
public class ShowDTO {
	 String performance_code;
	 String performance_name;
	 int performance_qty;
	 String main_category;
	 String sub_category;
	 int performance_price;
	 Date start_date;
	 Date end_date;
	 String address;
	 String place;
	 char kid_state;
	 String poster;

	 public String getPerformance_code() {
		return performance_code;
	}
	public void setPerformance_code(String performance_code) {
		this.performance_code = performance_code;
	}
	public String getPerformance_name() {
		return performance_name;
	}
	public void setPerformance_name(String performance_name) {
		this.performance_name = performance_name;
	}
	public int getPerformance_qty() {
		return performance_qty;
	}
	public void setPerformance_qty(int performance_qty) {
		this.performance_qty = performance_qty;
	}
	public String getMain_category() {
		return main_category;
	}
	public void setMain_category(String main_category) {
		this.main_category = main_category;
	}
	public String getSub_category() {
		return sub_category;
	}
	public void setSub_category(String sub_category) {
		this.sub_category = sub_category;
	}
	public int getPerformance_price() {
		return performance_price;
	}
	public void setPerformance_price(int performance_price) {
		this.performance_price = performance_price;
	}
	public Date getStart_date() {
		return start_date;
	}
	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}
	public Date getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public char getKid_state() {
		return kid_state;
	}
	public void setKid_state(char kid_state) {
		this.kid_state = kid_state;
	}

	public String getPoster() {
		return poster;
	}
	public void setPoster(String porster) {
		this.poster = porster;
	}
	
}