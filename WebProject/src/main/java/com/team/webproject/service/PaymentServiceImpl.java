package com.team.webproject.service;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

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
import com.team.webproject.dto.PerformanceDTO;
import com.team.webproject.dto.TicketDTO;
import com.team.webproject.mapper.CouponMapper;
import com.team.webproject.mapper.LoginMapper;
import com.team.webproject.mapper.PaymentMapper;
import com.team.webproject.mapper.PerformanceMapper;

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

}
