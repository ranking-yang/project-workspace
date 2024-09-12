package com.team.webproject.service;

import java.util.List;

import com.team.webproject.dto.PerformanceDTO;
import com.team.webproject.dto.WishlistDTO;


public interface ProductListService {
	List<PerformanceDTO> getProductList(String main_category, String area_code);
	int getMember_code(String member_id);
	List<WishlistDTO> getUserWish_list(int member_code);
	int countUserWish_list(int member_code);
	List<PerformanceDTO> getSortProductList(String main_category, String sort_code, String area_code);
	List<PerformanceDTO> getAllProduct();
	List<PerformanceDTO> getRandomProducts();

}
