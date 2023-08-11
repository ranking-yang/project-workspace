package com.team.webproject.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.request.CancelData;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;
import com.team.webproject.dto.PaymentDTO;
import com.team.webproject.dto.TicketDTO;
import com.team.webproject.service.CouponService;
import com.team.webproject.service.PaymentService;

@PropertySource("classpath:/protected/portone.properties")
@Controller
public class PaymentController {
	
	@Autowired
	PaymentService paymentService;	
	
	@Value("${portone.marketkey}")
	private String import_api_marketkey;
	
	@Value("${portone.restkey}")
	private String import_api_restkey;
	
	@Value("${portone.secretkey}")
	private String import_api_secret;
	
	private IamportClient client;
	
	//쿠폰 보유장수 표기관련 로직
	@Autowired
	CouponService couponService;

	
	@PostMapping("/payment/request")
	String getProceedPayment(Model model,
			@ModelAttribute TicketDTO ticket,
			@RequestParam("booking_type") String[] bookingTypes,
			@RequestParam("booking_price") int[] bookingPrices,
			@RequestParam("booking_qty") int[] bookingQtys,
			@RequestParam("total_price") int totalPrice) {
		
		// 스프링 시큐리티에서 user 값 가져오기
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); // holder 불러오기
		
		if (principal.equals("anonymousUser")) {			
			return "redirect:../login";
		} else {			
			String userID = ((UserDetails) principal).getUsername();
			model.addAttribute("user", paymentService.getSingleUser(userID));
			model.addAttribute("performance", paymentService.getPerformance(ticket.getPerformance_code()));
			model.addAttribute("orders", paymentService.getOrders(ticket, bookingTypes, bookingPrices, bookingQtys));
			model.addAttribute("totalPrice", totalPrice);
			model.addAttribute("api_market", import_api_marketkey);
			
			// 해당 유저 쿠폰 보유장수 파악
			model.addAttribute("coupon_count", couponService.getTheNumberOfCoupon(userID));
			
			return "payment/payment";
		}

	}

	@PostMapping("/payment/success")
	String paymentSuccess(Model model,
			@ModelAttribute("TicketDTO") TicketDTO ticket,
			@RequestParam("booking_type") String[] bookingTypes,
			@RequestParam("booking_price") int[] bookingPrices,
			@RequestParam("booking_qty") int[] bookingQtys,
			@ModelAttribute("PaymentDTO") PaymentDTO payment) {
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); // holder 불러오기
		String userID = ((UserDetails) principal).getUsername();

		if (userID != null) {
			// 결제 DB 저장 → 예매 테이블에 결제 FK로 갖고 DB에 저장
			List<TicketDTO> tickets = paymentService.getOrders(ticket, bookingTypes, bookingPrices, bookingQtys);
			paymentService.updateDB(payment, tickets, ticket.getPerformance_code());

			// 예매한 티켓, 결제 정보를 실어보내기
			model.addAttribute("tickets", tickets); // 티켓정보
			model.addAttribute("payment", payment); // 결제정보
			model.addAttribute("performance", paymentService.getPerformance(ticket.getPerformance_code()));

			return "payment/afterpayment";		
		} else {
			return null;
		}		

	}	
	
	// 보유쿠폰 확인창
	@GetMapping("/payment/mycoupon")
	public String myCoupon() {
		return "payment/coupon-popup";
	}
	
	//  결제 검증
	@ResponseBody
	@PostMapping("/payment/verify_iamport/{imp_uid}")
	public IamportResponse<Payment> verifyIamportPOST(@PathVariable(value = "imp_uid") String imp_uid) throws IamportResponseException, IOException {			
		client = new IamportClient(import_api_restkey, import_api_secret);
		return client.paymentByImpUid(imp_uid);
	}
	
	// 환불 테스트 - 나중에 바꿔야됨 ...
	@GetMapping("/payment/test")
	public void testCancelPaymentAlreadyCancelledImpUid() {
		// payment_code 값, 환불 금액, 사용자 pk 만 받으면 됨
		// 나중에 DB에서 refund 값을 "결제완료" 바꾸고 refund_date를 관리자가 승인한 날로 업데이트, 사용한 쿠폰을 사용자에게 돌려줘야함 state를 0으로 변경
		client = new IamportClient(import_api_restkey, import_api_secret);
		
        String test_already_cancelled_imp_uid = "imp_315324587334";
        CancelData cancel_data = new CancelData(test_already_cancelled_imp_uid, true); //imp_uid를 통한 전액취소
        cancel_data.setChecksum(BigDecimal.valueOf(300)); // 취소 금액 넣기 - 금액 다르면 환불 안됨 response가 NULL 값 됨

        try {
            IamportResponse<Payment> payment_response = client.cancelPaymentByImpUid(cancel_data);

            System.out.println("취소여부 : " + payment_response.getResponse()); // 이미 취소된 거래는 response가 null이다 - 이걸 리턴해서 NULL이 아니면 
        } catch (IamportResponseException e) {
            System.out.println(e.getMessage());

            switch (e.getHttpStatusCode()) {
                case 401:
                    //TODO
                    break;
                case 500:
                    //TODO
                    break;
            }
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
	
	
	
}