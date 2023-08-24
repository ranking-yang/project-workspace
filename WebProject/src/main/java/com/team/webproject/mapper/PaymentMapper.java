package com.team.webproject.mapper;

import java.util.List;

import com.team.webproject.dto.PaymentDTO;
import com.team.webproject.dto.PerfomSaleDTO;
import com.team.webproject.dto.RefundDTO;
import com.team.webproject.dto.TicketDTO;

public interface PaymentMapper {
	
	int insertPayment(PaymentDTO payment);
	
	int insertTicket(TicketDTO orders);
	
	int updatePerformaceQty(String performance_code, int qty);
	
	PaymentDTO getUserPayment(String payment_code);
	
	int insertRefundTicket(String payment_code);

	List<RefundDTO> getAllRefundList(String option);
	
	List<RefundDTO> getAllRefundList_ChkDate(String option, String startday, String endday);
	
	List<RefundDTO> getRefundList_ChkId(String option, String keyword);
	
	List<RefundDTO> getRefundList_ChkId_ChkDate(String option, String keyword, String startday, String endday);
	
	List<RefundDTO> getRefundList_ChkPaymentCode(String option, String keyword);
	
	int updateRefundTicketState(String payment_code);
	
	int getTicketQty(String payment_code);

	List<PaymentDTO> getAllPayment();
	
	List<PerfomSaleDTO> getAllPayPerfom();
	
	String getCoupontNum(String payment_code);
	
	String chkPayment_code(String payment_code);

}
