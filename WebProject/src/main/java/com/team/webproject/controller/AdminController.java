package com.team.webproject.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nimbusds.jose.shaded.json.JSONObject;

import com.team.webproject.dto.FreqQuestionDTO;

import com.team.webproject.dto.CouponDTO;

import com.team.webproject.dto.MDPerformanceDTO;
import com.team.webproject.dto.MD_getDTO;
import com.team.webproject.dto.MDrecomDTO;
import com.team.webproject.dto.NoticeDTO;
import com.team.webproject.dto.OneOnAsDTO;
import com.team.webproject.dto.PaymentDTO;
import com.team.webproject.dto.PerformanceDTO;
import com.team.webproject.dto.QnADTO;
import com.team.webproject.dto.RefundDTO;
import com.team.webproject.dto.SelectionDTO;
import com.team.webproject.dto.ShowDTO;
import com.team.webproject.mapper.AddPerformance;
import com.team.webproject.mapper.MD_RecomMapper;
import com.team.webproject.mapper.PaymentMapper;
import com.team.webproject.mapper.PerformanceMapper;
import com.team.webproject.service.AdminService;
import com.team.webproject.service.AsService;
import com.team.webproject.service.CouponService;
import com.team.webproject.service.DateChange;
import com.team.webproject.service.LoginService;
import com.team.webproject.service.PaymentService;
import com.team.webproject.service.ProductListService;
import com.team.webproject.service.QnAService;

@Controller
public class AdminController {

	@Autowired
	AddPerformance addPerformance;

	@Autowired
	ProductListService product;

	@Autowired
	MD_RecomMapper recom_MD;

	@Autowired
	PaymentMapper payment;

	@Autowired
	PaymentService paymentService;

	@Autowired
	LoginService loginservice;

	@Autowired
	PerformanceMapper perform;

	@Autowired
	AdminService adminService;

	@Autowired
	QnAService qnaService;

	@Autowired
	CouponService couponService;
	
	@Autowired
	AsService asService;
	
	private DateChange datech;

	// 관리자 페이지
	@GetMapping("/admin/api")
	public String adminGET(Model model) {

		List<PerformanceDTO> performance_admin = product.getAllProduct();
		model.addAttribute("performance", performance_admin);

		return "admin/admin_main";

	}

	@PostMapping("/admin")
	public String adminPOST(@Param("id") String id, @Param("pwd") String pwd) {

		return "admin/adminPage";
	}

	// 관리자 페이지 전체 공연 DB조회
	@RequestMapping(value = "/admin/api/select", method = RequestMethod.POST)
	@ResponseBody
	public List<PerformanceDTO> adminSelect() {

		List<PerformanceDTO> show = addPerformance.selectShow();
		return show;
	}
	// 수정
	@PostMapping("/admin/api/update")
	@ResponseBody
	public Integer updateShow(@RequestBody PerformanceDTO perfom) {
		System.out.println(perfom.toString());
		return adminService.updateShow(perfom);
	}
	// 수정
	@PostMapping("/admin/api/allupdate")
	@ResponseBody
	public Integer updateShow(@RequestBody List<PerformanceDTO> perfom) {
		System.out.println(perfom.toString());
		return adminService.updateAllShow(perfom);
	}
	@PostMapping("/admin/mdreom/add")
	@ResponseBody
	public String tableList(@RequestBody MD_getDTO mdget) {
		MDrecomDTO mddto = new MDrecomDTO();
		mddto.setMd_title(mdget.getMd_title());

		datech = new DateChange();
		mddto.setMd_period_start(datech.transformDate4(mdget.getMd_stdate()));
		mddto.setMd_period_end(datech.transformDate4(mdget.getMd_endate()));

		String area_concat = String.join(",", mdget.getMd_local());
		String show_concat = String.join(",", mdget.getMd_show());
		mddto.setMd_area(area_concat);
		mddto.setMd_genrenm(show_concat);
		recom_MD.addMDrecom(mddto);
		int md_seq = recom_MD.currseq();

		MDPerformanceDTO mdperDTO = new MDPerformanceDTO();

		for (int i = 0; i < mdget.getMd_performance().size(); i++) {
			mdperDTO.setRecommened_performance(mdget.getMd_performance().get(i));
			mdperDTO.setMd_code(md_seq);
			mdperDTO.setRecommened_performance_name(mdget.getMd_perfotitle().get(i));
			recom_MD.addMDperfo(mdperDTO);
		}

		return "완료";

	}
	@PostMapping("/admin/api/add")
	@ResponseBody
	public String apiDataAdd(@RequestBody List<PerformanceDTO> li_perfom) throws SQLException {
		for(PerformanceDTO perfom: li_perfom) {
			if(perfom.getPerformance_code() != null) {
				
				addPerformance.addShow(perfom);
			}
		}
		return "완료";
	}
	// 환불 List DTO 검색
	@GetMapping("/admin/refund/all")
	@ResponseBody
	public List<RefundDTO> getAllRefundList(String option, String startday, String endday) {
		return adminService.searchAllRefundList(option, startday, endday);
	}

	@GetMapping("/admin/refund/user-id")
	@ResponseBody
	public List<RefundDTO> getUserRefundList(String option, String keyword, String startday, String endday) {
		return adminService.searchUserRefundList(option, keyword, startday, endday);
	}

	@GetMapping("/admin/refund/payment-num")
	@ResponseBody
	public List<RefundDTO> getPkRefundList(String option, String keyword) {
		return adminService.searchPaymentPkRefundList(option, keyword);
	}

	// 환불 요청 시, 처리
	@PostMapping("/admin/refund/request")
	@ResponseBody
	public List<RefundDTO> refundTickets(@RequestBody List<SelectionDTO> selections) {
		return adminService.refundTickets(selections);
	}

	@GetMapping("/admin/chart")
	@ResponseBody
	public Map<String, Map<String, Integer>> chartdata() {
		List<PaymentDTO> payli = payment.getAllPayment();

		Map<String, Integer> salemap = paymentService.calc_month(payli);
		Map<String, Integer> saleweek = paymentService.calc_wekend(payli);
		Map<String, Integer> saleday = paymentService.calc_day(payli);
		Map<String, Map<String, Integer>> total_sales = new HashMap<>();
		Map<String, Integer> loginMap = loginservice.month_join();
		total_sales.put("월매출", salemap);
		total_sales.put("주간매출", saleweek);
		total_sales.put("일매출", saleday);
		total_sales.put("회원추이", loginMap);

		return total_sales;
	}

	@GetMapping("/admin/showsale")
	@ResponseBody
	public Map<String, Integer> ranking(String option) {
		return paymentService.ranking_perfom(option);
	}

	@GetMapping("/admin/saleall")
	@ResponseBody
	public Map<String, Integer> ranking() {

		return paymentService.ranking_perfomall();
	}

	@GetMapping(path = { "/admin/qna/main", "/admin/qna/processing" })
	@ResponseBody
	public List<QnADTO> adminQna() {
		return qnaService.getQnAsAnswerYet();
	}

	@GetMapping("/admin/qna/complete")
	@ResponseBody
	public List<QnADTO> adminQnaAnswered() {
		return qnaService.getQnAsAnswered();
	}

	@GetMapping("/admin/qna/all")
	@ResponseBody
	public List<QnADTO> adminAllQnas() {
		return qnaService.getAllQnAs();
	}

	@GetMapping("/admin/qna/addAnswer/{qaCode}")
	@ResponseBody
	public QnADTO getQnAbyQacode(@PathVariable int qaCode) {
		return qnaService.getQnAbyQacode(qaCode);
	}

	@PostMapping("/admin/qna/insertAnswer")
	@ResponseBody
	public int insertAnswer(@RequestBody QnADTO qna) {
		int qa_code = qna.getQa_code();
		String qa_answer = qna.getQa_answer();

		return qnaService.addAnswertoQ(qa_code, qa_answer);
	}

	@GetMapping("/admin/inqurity/select")
	@ResponseBody
	public List<OneOnAsDTO> selectOneOn() {
		return asService.getOneOnAll();
	}

	@GetMapping("/admin/inqurity/details")
	@ResponseBody
	OneOnAsDTO selectOneOnDetails(int onecode) {
		return asService.selectOneTitle(onecode);
	}

	@PostMapping("/admin/oneon/answer")
	@ResponseBody
	public int updateAnswer(Integer onecode, String oneonanswer) {
		return asService.updateAnswer(onecode, oneonanswer);
	}

	@GetMapping("/admin/inqurity/search")
	@ResponseBody
	public List<OneOnAsDTO> searchOneOn(String stdate, String endate, String searchtext, String option) {
		return asService.getSearch(stdate, endate, searchtext, option);
	}

	@PostMapping("/admin/notice/add")
	@ResponseBody
	public String addNotice(@RequestBody NoticeDTO notice) {
		asService.saveNotice(notice);
		return "success";
	}
	
	@GetMapping("/admin/notice/list")
	@ResponseBody
	public List<NoticeDTO> getNoticeList() {
		return asService.getAllNotices();
	}

	@GetMapping("/admin/notice/getNotice/{noticeCode}")
	@ResponseBody
	public NoticeDTO getNoticeByCode(@PathVariable int noticeCode) {
		return asService.getNoticeByCode(noticeCode);
	}

	@PostMapping("/admin/notice/editNotice")
	@ResponseBody
	public int editNotice(@RequestBody NoticeDTO notice) {

		return asService.editNotice(notice);
	}

	@PostMapping("/admin/notice/deleteNotice")
	@ResponseBody
	public void deleteNotice(@RequestBody List<JSONObject> noticeCodes) {
		asService.deleteNotice(noticeCodes);
	}

	
	@PostMapping("/admin/faq/add")
	@ResponseBody
	public String addFaq(@RequestBody FreqQuestionDTO newFaq) {
		asService.addFaq(newFaq);
		return "success";
	}
	
	@GetMapping("/admin/faq/list")
	@ResponseBody
	public List<FreqQuestionDTO> getNoticeByCode() {
	    return asService.getAllFaqs();
	}
	
	@PostMapping("/admin/faq/deleteFaq")
	@ResponseBody
	public void deleteFaq(@RequestBody List<JSONObject> faqs) {
		asService.deleteFaqs(faqs);
	}
	
	@GetMapping("/admin/faq/getFaq/{faqCode}")
	@ResponseBody
	public FreqQuestionDTO getFaqByCode(@PathVariable int faqCode) {
	    return asService.getFaq(faqCode);
	}
	
	@PostMapping("/admin/faq/edit")
	@ResponseBody
	public int editFaq(@RequestBody FreqQuestionDTO newFaq) {
		return asService.editFaq(newFaq);
	}

	@GetMapping("/admin/coupon/get-all-list")
	@ResponseBody
	public List<CouponDTO> getAllList() {
		return couponService.getAllCouponList();

	}

	@GetMapping("/admin/coupon/add")
	@ResponseBody
	public List<CouponDTO> addCoupon(String coupon_name, String coupon_qty, String discount) {
		
		couponService.addNewCoupon(coupon_name, coupon_qty, discount);
		
		return couponService.getAllCouponList();
	}

	@GetMapping("/admin/coupon/delete")
	@ResponseBody
	public List<CouponDTO> deleteCoupon(@RequestParam("coupon_code") String coupon_code){
		couponService.deleteSelectedCoupon(coupon_code);
		
		return couponService.getAllCouponList();
	}
	
	@GetMapping("/admin/coupon/update")
	@ResponseBody
	public List<CouponDTO> updateCoupon(String coupon_code, String coupon_name, String discount, String coupon_qty) {
		
		couponService.updateSelectedCoupon(coupon_code, coupon_name, discount, coupon_qty);
		
		return couponService.getAllCouponList();
	}

}
