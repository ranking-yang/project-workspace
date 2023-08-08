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
	public List<PerformanceDTO> getProductList(String main_category, String area) {
		// 로그인 안했을 때
		if(main_category.equals("키즈")) {
			//+ 메인 카테고리가 키즈이면서 로그인 상태가 아닌 경우
			return performanceMapper.getKidsPerformances();
		}else {
			//+ 메인 카테고리가 키즈가 아니면서 로그인 상태가 아닌 경우 (DB에서 가져오는 값에 wish_code 없음)
			return performanceMapper.getPerformances(main_category);
		}
	}

	@Override
	public int getMember_code(String member_id) {
		return loginMapper.checklogin(member_id).getMember_code();
	}

	@Override
	public List<WishlistDTO> getUserWish_list(int member_code) {
		return wishMapper.getUserWishlist(member_code);
	}
	
	

}
