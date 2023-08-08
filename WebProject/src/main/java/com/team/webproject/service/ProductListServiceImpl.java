package com.team.webproject.service;
import java.util.List;

import org.springframework.stereotype.Service;

import com.team.webproject.dto.PerformanceDTO;
import com.team.webproject.dto.WishlistDTO;
import com.team.webproject.mapper.LoginMapper;
import com.team.webproject.mapper.PerformanceMapper;
import com.team.webproject.mapper.WishlistMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ProductListServiceImpl implements ProductListService {
	
	
	private final PerformanceMapper performanceMapper;
	private final LoginMapper loginMapper;
	private final WishlistMapper wishMapper;

	@Override	
	public List<PerformanceDTO> getProductList(String main_category) {
		return performanceMapper.getPerformances(main_category);			
	
	}

	@Override
	public int getMember_code(String member_id) {
		return loginMapper.checklogin(member_id).getMember_code();
	}

	@Override
	public List<WishlistDTO> getUserWish_list(int member_code) {
		return wishMapper.getUserWishlist(member_code);
	}

	@Override
	public List<PerformanceDTO> getAreaProductList(String area_code) {
		if(area_code.equals("a01")) {
			return performanceMapper.getAreaPerformances("서울");			
		}else if(area_code.equals("a02")) {
			return performanceMapper.getAreaPerformances("경기");			
		}else if(area_code.equals("a03")) {
			return performanceMapper.getAreaPerformances("강원");			
		}else if(area_code.equals("a04")) {
			return performanceMapper.getAreaPerformances("인천");			
		}else if(area_code.equals("a05")) {
			return performanceMapper.getAreaPerformances("충청");			
		}else if(area_code.equals("a06")) {
			return performanceMapper.getAreaPerformances("세종");			
		}else if(area_code.equals("a07")) {
			return performanceMapper.getAreaPerformances("대전");			
		}else if(area_code.equals("a08")) {
			return performanceMapper.getAreaPerformances("전라");			
		}else if(area_code.equals("a09")) {
			return performanceMapper.getAreaPerformances("광주");			
		}else if(area_code.equals("a10")) {
			return performanceMapper.getAreaPerformances("경상");			
		}else if(area_code.equals("a11")) {
			return performanceMapper.getAreaPerformances("부산");			
		}else if(area_code.equals("a12")) {
			return performanceMapper.getAreaPerformances("대구");			
		}else if(area_code.equals("a13")) {
			return performanceMapper.getAreaPerformances("울산");			
		}else {
			return performanceMapper.getAreaPerformances("제주");
		}
	}

	
	

}
