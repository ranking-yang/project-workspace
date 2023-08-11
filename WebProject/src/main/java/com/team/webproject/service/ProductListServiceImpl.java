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
		if(main_category.equals("area")) {
			return performanceMapper.getAllPerformances();
		}else {
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
	@Override
	public int countUserWish_list(int member_code) {
		return wishMapper.countUserWishlist(member_code);
	}

	@Override
    public List<PerformanceDTO> getAreaProductList(String area_code) {
        String areaName = AreaEnum.getAreaNameByCode(area_code);
        return performanceMapper.getAreaPerformances(areaName);


    }

}
