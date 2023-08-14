package com.team.webproject.service;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team.webproject.dto.MembersDTO;
import com.team.webproject.dto.PaymentDTO;
import com.team.webproject.dto.PerfomSaleDTO;
import com.team.webproject.dto.PerformanceDTO;
import com.team.webproject.dto.TicketDTO;
import com.team.webproject.mapper.LoginMapper;
import com.team.webproject.mapper.PaymentMapper;
import com.team.webproject.mapper.PerformanceMapper;

@Service
public class PaymentServiceImpl implements PaymentService {
	
	@Autowired
	PerformanceMapper performanceMapper;
	
	@Autowired
	PaymentMapper paymentMapper;
	
	@Autowired
	LoginMapper loginMapper;
	
	// 쿠폰 조회
	
	// 유저 아이디 조회
	@Override
	public MembersDTO getSingleUser(String user_id) {
		return loginMapper.checklogin(user_id);
	}
	
	// 선택한 공연정보 조회
	@Override
	public PerformanceDTO getPerformance(String performance_code) {
		return performanceMapper.getPerformance(performance_code);
	}
	
	// 선택한 Ticket 리스트 만들어서 리턴
	@Override
	public List<TicketDTO> getOrders(TicketDTO ticket, String[] bookingTypes, int[] bookingPrices, int[] bookingQtys) {
		List<TicketDTO> ticketList = new ArrayList<>();
		
		if (ticket.getBooking_time() != null) {
			String[] times = ticket.getBooking_time().split(",");
			ticket.setBooking_time(times[0]);
		}
		
		for (int i = 0; i < bookingTypes.length; ++i) {			
			if (bookingQtys[i] != 0) {
				String bookingType = bookingTypes[i];
		        int bookingPrice = bookingPrices[i];
		        int bookingQty = bookingQtys[i];
	
		        TicketDTO neworder = new TicketDTO();
		        neworder.setBooker_code(ticket.getBooker_code());
		        neworder.setPerformance_code(ticket.getPerformance_code());
		        neworder.setBooking_date(ticket.getBooking_date());
		        if (ticket.getBooking_time() != null) {neworder.setBooking_time(ticket.getBooking_time());}
		        if (ticket.getPayment_code_fk() != null) {neworder.setPayment_code_fk(ticket.getPayment_code_fk());}
		        neworder.setBooking_type(bookingType);
		        neworder.setBooking_price(bookingPrice);
		        neworder.setBooking_qty(bookingQty);
		        
		        ticketList.add(neworder);
			}
		}
		
		return ticketList;
	}
	
	// 구매한 총 좌석 수 조회
	int getTotalQty(List<TicketDTO> tickets) {
		int total = 0;
		
		for (TicketDTO ticket : tickets) {
			total += ticket.getBooking_qty();
		}
		
		return total;
	}
	
	// DB에 저장
	@Override
	@Transactional
	public void UpdateDB(PaymentDTO payment, List<TicketDTO> tickets, String performance_code) {
		
		paymentMapper.insertPayment(payment);
		
		for (TicketDTO ticket : tickets) {
			for (int i = 0; i < ticket.getBooking_qty(); ++i) {
				paymentMapper.insertTicket(ticket);				
			}
		}
		
		paymentMapper.updatePerformaceQty(performance_code, getTotalQty(tickets));

	}

	@Override
	public Map<String, Integer> calc_month(List<PaymentDTO> payment) {
		Map<String, Integer> month_sales = new HashMap<String, Integer>();
		for(int i=1; i<=12; i++) {
			Integer sales = 0;
			for(PaymentDTO pay : payment) {
				if(pay.getPayment_date().getMonth()+1 == i) {
					sales += pay.getTotal_price();
				}
			}
			month_sales.put(i+"월", sales);
		}
		  
		
		return month_sales;
	}

	@Override
	public Map<String, Integer> calc_wekend(List<PaymentDTO> payment) {
		Map<String, Integer> week_sales = new HashMap<>();

        Calendar calendar = Calendar.getInstance();
        for (PaymentDTO pay : payment) {
            calendar.setTime(pay.getPayment_date());
            int month = calendar.get(Calendar.MONTH);
            if (month == Calendar.getInstance().get(Calendar.MONTH)) { // 현재 월인 경우에만 처리
                int weekOfYear = calendar.get(Calendar.WEEK_OF_YEAR);

                Integer sales = week_sales.getOrDefault(weekOfYear, 0);
                sales += pay.getTotal_price();
                week_sales.put(weekOfYear+"주", sales);
            }
        }
		  
		
		return week_sales;
	}

	@Override
	public Map<String, Integer> calc_day(List<PaymentDTO> payment) {
		Map<String, Integer> day_sales = new HashMap<>();

        Calendar calendar = Calendar.getInstance();
        for (PaymentDTO pay : payment) {
            calendar.setTime(pay.getPayment_date());
            int month = calendar.get(Calendar.MONTH);
            if (month == Calendar.getInstance().get(Calendar.MONTH)) { // 현재 월인 경우에만 처리
                int dayOfMonth = calendar.get(Calendar.DAY_OF_MONTH);

                Integer sales = day_sales.getOrDefault(dayOfMonth, 0);
                sales += pay.getTotal_price();
                day_sales.put(dayOfMonth+"일", sales);
            }
        }
        
        return day_sales;
	}

	@Override
	public Map<String, Integer> rankin_perfom(String option) {
		List<PerfomSaleDTO> li_perfom = paymentMapper.getAllPayPerfom();
		Calendar calendar = Calendar.getInstance();
	    int currentMonth = calendar.get(Calendar.MONTH);
	    Map<String, Integer> rankingmap = new HashMap();
	    for (PerfomSaleDTO perfom : li_perfom) {
	        if (perfom.getMain_category().equals(option)) {
	            calendar.setTime(perfom.getPayment_date());
	            int paymentMonth = calendar.get(Calendar.MONTH);
	            
	            if (paymentMonth == currentMonth) { // 같은 월에 해당하는 데이터 만.
	            	if(perfom.getAdvance_ticket_state()=='Y') {
	            		int currentCount = rankingmap.getOrDefault(perfom.getPerformance_name(), 0);
	            		rankingmap.put(perfom.getPerformance_name(), currentCount + 1);
	            	}
	            }
	            
	        }
	    }
		return rankingmap;
	}
	
	@Override
	public Map<String, Integer> rankin_perfomall() {
		List<PerfomSaleDTO> li_perfom = paymentMapper.getAllPayPerfom();
		Calendar calendar = Calendar.getInstance();
	    int currentMonth = calendar.get(Calendar.MONTH);
	    
	    Map<String, Integer> rankingmap = new HashMap();
	    for (PerfomSaleDTO perfom : li_perfom) {
	        
            calendar.setTime(perfom.getPayment_date());
            int paymentMonth = calendar.get(Calendar.MONTH);
            
            if (paymentMonth == currentMonth) { // 같은 월에 해당하는 데이터 만.
            	if(perfom.getAdvance_ticket_state()=='Y') {
            		int currentCount = rankingmap.getOrDefault(perfom.getMain_category(), 0);
            		rankingmap.put(perfom.getMain_category(), currentCount + 1);
            	}
            }
	        
	    }
		return rankingmap;
	}

}



