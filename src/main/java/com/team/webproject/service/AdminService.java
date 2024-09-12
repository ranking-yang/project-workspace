package com.team.webproject.service;

import java.util.List;

import com.team.webproject.dto.PerformanceDTO;
import com.team.webproject.dto.RefundDTO;
import com.team.webproject.dto.SelectionDTO;

public interface AdminService {
	
	List<RefundDTO> searchAllRefundList(String option, String startday, String endday);

	List<RefundDTO> searchUserRefundList(String option, String keyword, String startday, String endday);
	
	List<RefundDTO> searchPaymentPkRefundList(String option, String keyword);

	List<RefundDTO> refundTickets(List<SelectionDTO> selections);
	
	Integer updateShow(PerformanceDTO perfom);

	Integer updateAllShow(List<PerformanceDTO> perfom);
}
