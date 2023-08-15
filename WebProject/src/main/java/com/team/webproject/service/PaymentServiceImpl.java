package com.team.webproject.service;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.request.CancelData;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;
import com.team.webproject.dto.MembersDTO;
import com.team.webproject.dto.PaymentDTO;
import com.team.webproject.dto.PerfomSaleDTO;
import com.team.webproject.dto.PerformanceDTO;
import com.team.webproject.dto.RankDTO;
import com.team.webproject.dto.ReviewDTO;
import com.team.webproject.dto.TicketDTO;
import com.team.webproject.mapper.CouponMapper;
import com.team.webproject.mapper.LoginMapper;
import com.team.webproject.mapper.PaymentMapper;
import com.team.webproject.mapper.PerformanceMapper;
import com.team.webproject.mapper.ReviewMapper;

@PropertySource("classpath:/protected/portone.properties")
@Service
public class PaymentServiceImpl implements PaymentService {
	
	@Autowired
	PerformanceMapper performanceMapper;
	
	@Autowired
	PaymentMapper paymentMapper;
	
	@Autowired
	LoginMapper loginMapper;
	
	@Autowired
	CouponMapper couponMapper;
	
	@Value("${portone.marketkey}")
	private String portOne_marketkey;
	
	@Value("${portone.restkey}")
	private String portOne_restkey;
	
	@Value("${portone.secretkey}")
	private String portOne_secret;
	
	private IamportClient client;
	ReviewMapper reviewMapper;
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
	
	// 포트원 키 값 리턴
	@Override
	public String getPortone_api_marketkey() {
		return portOne_marketkey;
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
	
	// DB에 구매한 티켓 정보 저장
	@Override
	@Transactional
	public void updateDB(PaymentDTO payment, List<TicketDTO> tickets, String performance_code) {
		
		paymentMapper.insertPayment(payment);
		
		// 회원쿠폰코드를 통해 사용한 쿠폰의 상태를 변경한다(미사용->사용)
		if (payment.getRelated_coupon() != null) {
			couponMapper.updateCouponState(payment.getRelated_coupon());
		}
		
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
	public Map<String, Integer> ranking_perfom(String option) {
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
	public List<String> ranking_getperfom() {
		 List<PerfomSaleDTO> li_perfom = paymentMapper.getAllPayPerfom();
		
		 Calendar calendar = Calendar.getInstance(); 
		 int currentMonth = calendar.get(Calendar.MONTH); 
		 Map<String, Integer> rankingmap = new HashMap(); 
		 for (PerfomSaleDTO perfom : li_perfom) {
			 
		 calendar.setTime(perfom.getPayment_date()); 
		 int paymentMonth = calendar.get(Calendar.MONTH);
		 
		 if (paymentMonth == currentMonth) { // 같은 월에 해당하는 데이터 만.
			 if(perfom.getAdvance_ticket_state()=='Y') { 
				 int currentCount = rankingmap.getOrDefault(perfom.getPerformance_code(), 0);
			 	 rankingmap.put(perfom.getPerformance_code(), currentCount + 1); 
			 	} 
		 	} 
		 }
		 List<Map.Entry<String, Integer>> sortedEntries = rankingmap.entrySet()
			        .stream()
			        .sorted(Collections.reverseOrder(Map.Entry.comparingByValue()))
			        .collect(Collectors.toList());

		List<String> sortedPerformanceCodes = new ArrayList<>();
		for (Map.Entry<String, Integer> entry : sortedEntries) {
		    sortedPerformanceCodes.add(entry.getKey());
		}
		
		return sortedPerformanceCodes;
	}
	
	
	@Override
	public Map<String, Integer> ranking_perfomall() {
		List<PerfomSaleDTO> li_perfom = paymentMapper.getAllPayPerfom(); // 전체 list
		Calendar calendar = Calendar.getInstance();
	    int currentMonth = calendar.get(Calendar.MONTH);
	    
	    Map<String, Integer> rankingmap = new HashMap();
	    for (PerfomSaleDTO perfom : li_perfom) {
	        
            calendar.setTime(perfom.getPayment_date());
            int paymentMonth = calendar.get(Calendar.MONTH);
            
            if (paymentMonth == currentMonth) { // 같은 월에 해당하는 데이터 만.
            	if(perfom.getAdvance_ticket_state()=='Y') {
            		int currentCount = rankingmap.getOrDefault(perfom.getMain_category(), 0);
            		rankingmap.put(perfom.getMain_category(), currentCount + 1); // 전체 공연에 대한 랭킹
            	}
            }
	    }
		return rankingmap;
	}
	
	
	// 결제 정보 검증
	@Override
	public IamportResponse<Payment> getServerPrice(String imp_uid) throws IamportResponseException, IOException {
		client = new IamportClient(portOne_restkey, portOne_secret);
		return client.paymentByImpUid(imp_uid);
	}
	
	// 티켓 환불
	@Override
	public void refundTicket(String payment_code, int total_price, int member_pk) {
		
		System.out.println(payment_code);
		System.out.println(total_price);
		System.out.println(member_pk);
		
		// 포트원 서버 취소 로직
		client = new IamportClient(portOne_restkey, portOne_secret);
		
        CancelData cancel_data = new CancelData(payment_code, true); //imp_uid를 통한 전액취소
        cancel_data.setChecksum(BigDecimal.valueOf(total_price)); // 취소 금액 넣기 - 금액 다르면 환불 안됨 response가 NULL 값 됨

        try {
            IamportResponse<Payment> payment_response = client.cancelPaymentByImpUid(cancel_data);
            System.out.println("취소여부 : " + payment_response.getResponse()); // 이미 취소된 거래는 response가 null이다 - 이걸 리턴해서 NULL이 아니면 
            
            if (payment_response != null) {
            	// DB 티켓 취소 로직   
            	refundTicketDB(payment_code, member_pk); // DB 업데이트 값 리턴
            }
        } catch (IamportResponseException e) {
            System.out.println(e.getMessage());

            switch (e.getHttpStatusCode()) {
                case 401:
                    break;
                case 500:
                    break;
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

	}
	
	@Override
	@Transactional
	public int refundTicketDB(String payment_code, int member_pk) {
		return paymentMapper.updateRefundTicketState(payment_code) // 결제완료로 바꾸고 refund_date를 관리자가 승인한 날로 변경
				+ couponMapper.updateCouponReturn(member_pk, payment_code) // 쿠폰 돌려주기 (state 0으로 변경)
				+ performanceMapper.updateQty(paymentMapper.getTicketQty(payment_code), payment_code); // 판매 객석 수 늘리기
	}

	@Override
	public List<Float> getPostli(List<PerfomSaleDTO> rank) {
		List<Float> perfom = new ArrayList();
		float review = 0;
		int sum= 0;
		int count = 0;
		String code = "";
		for(PerfomSaleDTO per : rank) {
			System.out.println(per.getPerformance_name() +","+ per.getPerformance_code());
			for(ReviewDTO rev : reviewMapper.getAllReviews()) {
				if(rev.getPerformance_code().equals(per.getPerformance_code())){
					sum += rev.getReview_star();
					count ++;
				}
			}
			
			if (count > 0) {
				review = sum/count;
				review = (float) sum / count;
			    System.out.println("?? " + String.format("%.1f", review));
			    perfom.add(review);
			}else {
				perfom.add((float) 0);
			}
		}
		return perfom;
		
	}

	@Override
	public List<String> ranking_getreview() {
	    List<PerfomSaleDTO> li_perfom = paymentMapper.getAllPayPerfom();

	    Calendar calendar = Calendar.getInstance(); 
	    int currentMonth = calendar.get(Calendar.MONTH); 
	    Map<String, Integer> rankingmap = new HashMap(); // 리뷰 개수를 저장하는 맵

	    // 각 공연별 리뷰 개수를 세고 맵에 저장
	    for (PerfomSaleDTO perfom : li_perfom) {
	        calendar.setTime(perfom.getPayment_date()); 
	        int paymentMonth = calendar.get(Calendar.MONTH);

	        if (paymentMonth == currentMonth) {
	            if (perfom.getAdvance_ticket_state() == 'Y') {
	                int reviewCount = 0;
	                for (ReviewDTO rev : reviewMapper.getAllReviews()) {
	                    if (rev.getPerformance_code().equals(perfom.getPerformance_code())) {
	                        reviewCount++;
	                    }
	                }
	                rankingmap.put(perfom.getPerformance_code(), reviewCount); // 리뷰 개수를 맵에 저장
	            }
	        }
	    }
	    
	    // 리뷰 개수에 따라 내림차순으로 정렬된 맵 생성
	    List<Map.Entry<String, Integer>> sortedEntries = rankingmap.entrySet()
	            .stream()
	            .sorted(Collections.reverseOrder(Map.Entry.comparingByValue()))
	            .collect(Collectors.toList());

	    List<String> sortedPerformanceCodes = new ArrayList<>();
	    for (Map.Entry<String, Integer> entry : sortedEntries) {
	        sortedPerformanceCodes.add(entry.getKey());
	    }

	    return sortedPerformanceCodes;
	}

	@Override
	public List<String> ranking_getstar() {
	    List<PerfomSaleDTO> li_perfom = paymentMapper.getAllPayPerfom();

	    Calendar calendar = Calendar.getInstance(); 
	    int currentMonth = calendar.get(Calendar.MONTH); 
	    Map<String, Float> rankingmap = new HashMap(); // 점수를 저장하는 맵으로 수정
	    for (PerfomSaleDTO perfom : li_perfom) {
	        calendar.setTime(perfom.getPayment_date()); 
	        int paymentMonth = calendar.get(Calendar.MONTH);

	        if (paymentMonth == currentMonth) {
	            if (perfom.getAdvance_ticket_state() == 'Y') {
	                // 점수 계산
	                int sum = 0;
	                int count = 0;
	                for (ReviewDTO rev : reviewMapper.getAllReviews()) {
	                    if (rev.getPerformance_code().equals(perfom.getPerformance_code())) {
	                        sum += rev.getReview_star();
	                        count++;
	                    }
	                }
	                if (count > 0) {
	                    float average = (float) sum / count;
	                    rankingmap.put(perfom.getPerformance_code(), average); // 점수를 맵에 저장
	                } else {
	                    rankingmap.put(perfom.getPerformance_code(), 0f); // 리뷰 없을 경우 0으로 저장
	                }
	            }
	        }
	    }
	    
	    // 점수에 따라 내림차순으로 정렬된 맵 생성
	    List<Map.Entry<String, Float>> sortedEntries = rankingmap.entrySet()
	            .stream()
	            .sorted(Collections.reverseOrder(Map.Entry.comparingByValue()))
	            .collect(Collectors.toList());

	    List<String> sortedPerformanceCodes = new ArrayList<>();
	    for (Map.Entry<String, Float> entry : sortedEntries) {
	        sortedPerformanceCodes.add(entry.getKey());
	    }

	    return sortedPerformanceCodes;
	}
}



