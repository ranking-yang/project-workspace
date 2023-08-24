package com.team.webproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.webproject.dto.PerformanceDTO;
import com.team.webproject.dto.RefundDTO;
import com.team.webproject.dto.SelectionDTO;
import com.team.webproject.mapper.PaymentMapper;
import com.team.webproject.mapper.PerformanceMapper;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	PaymentMapper paymentMapper;
	
	@Autowired
	PerformanceMapper perfomMapper;
	
	@Autowired
	PaymentService paymentService;

	@Override
	public List<RefundDTO> searchAllRefundList(String option, String startday, String endday) {		
		List<RefundDTO> getlist = null;		
		if (startday.isEmpty() && endday.isEmpty()) {
			// 조건 없이 전체 검색했을 때
			getlist = paymentMapper.getAllRefundList(option);		
		} else {
			// 날짜로 전체 검색 했을 때
			getlist = paymentMapper.getAllRefundList_ChkDate(option, startday, endday);
		}		
		return getlist;
	}
	
	@Override
	public List<RefundDTO> searchUserRefundList(String option, String keyword, String startday, String endday) {
		List<RefundDTO> getlist = null;
		
		if (startday.isEmpty() && endday.isEmpty()) {
			// 아이디만 검색했을 때
			getlist = paymentMapper.getRefundList_ChkId(option, keyword);
		} else {
			// 아이디 + 날짜 검색했을 때
			getlist = paymentMapper.getRefundList_ChkId_ChkDate(option, keyword, startday, endday);
		}
		
		return getlist;
	}
	
	@Override
	public List<RefundDTO> searchPaymentPkRefundList(String option, String keyword) {		
		return paymentMapper.getRefundList_ChkPaymentCode(option, keyword);
	}
	
	// 티켓 환불
	@Override
	public List<RefundDTO> refundTickets(List<SelectionDTO> selections) {
		for (SelectionDTO selection : selections) {
			paymentService.refundTicket(selection.getPayment_code(), selection.getTotal_price(), selection.getMember_code());
		}
		
		List<RefundDTO> getlist = paymentMapper.getAllRefundList("환불요청");			
		return getlist;
	}

	@Override
	public Integer updateShow(PerformanceDTO perfom) {
		return perfomMapper.setShowUpdate(perfom);
	}
	@Override
	public Integer updateAllShow(List<PerformanceDTO> perfom) {
		Integer count = 0;
		for(int i =0; i<perfom.size(); ++i) {
			count += perfomMapper.setShowUpdate(perfom.get(i));
		}
		if(count == 0) {
			return count;
		}else {
			return null;
		}
		
	} 
}
