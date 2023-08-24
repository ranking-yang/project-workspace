package com.team.webproject.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.team.webproject.dto.PerformanceDTO;
import com.team.webproject.dto.WishlistDTO;
import com.team.webproject.mapper.LoginMapper;
import com.team.webproject.mapper.MD_RecomMapper;
import com.team.webproject.mapper.PerformanceMapper;
import com.team.webproject.mapper.WishlistMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ProductListServiceImpl implements ProductListService {

	private final PerformanceMapper performanceMapper;
	private final LoginMapper loginMapper;
	private final WishlistMapper wishMapper;
	private final MD_RecomMapper mdmapper;

	@Override
	public List<PerformanceDTO> getProductList(String main_category, String area_code) { // /product로 들어올때
		if (main_category.equals("area")) { // 메인 카테고리가 area일때 
			if(area_code == null) {
				return performanceMapper.getAllPerformances();			// 메인 카테고리가 area이면서 area_code가 null일때	
			}else {
				String areaName = AreaEnum.getAreaNameByCode(area_code); // 메인 카테고리가 area이면서 area_code가 null이 아닐때	
				 return performanceMapper.getAreaPerformances(areaName);
			}
		} else {
			return performanceMapper.getPerformances(main_category); // 메인 카테고리가 area가 아닐때 
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
	public List<PerformanceDTO> getAllProduct() {
		return performanceMapper.getAllPerformances();
	}

	@Override
	public List<PerformanceDTO> getSortProductList(String main_category, String sort_code, String area_code) { // /area, /sort로 들어올때
		if(sort_code.equals("asc") || sort_code.equals("desc")) { // sort_code == 최고가순 , 최저가순
			if(main_category.equals("area")) { // 메인 카테고리가 area일때 
				if(area_code == null) { // 메인 카테고리가 area이면서 area_code가 null일 때
					return performanceMapper.getAllPerformancesSortbyPrice(sort_code);
				}else { // 메인 카테고리가 area이면서 area_code가 null이 아닐 때
					String areaName = AreaEnum.getAreaNameByCode(area_code);
					return performanceMapper.getPerformancesAreanSortbyPrice(areaName, sort_code);
				}
			}else { // 메인 카테고리가 area가 아닐 때
				return performanceMapper.getPerformancesSortbyPrice(main_category,sort_code);
			}
		}else { // sort_code == 별점순
			if(main_category.equals("area")) {
				if(area_code == null) {
					return performanceMapper.getAllPerformancesSortbyScore();
				}else {
					String areaName = AreaEnum.getAreaNameByCode(area_code);
					return performanceMapper.getPerformancesAreanSortbyScore(areaName);
				}
			}else {
				return performanceMapper.getPerformancesSortbyScore(main_category);
			}
		}
	}
	
	

	@Override
	public List<PerformanceDTO> getRandomProducts() {
		return performanceMapper.getRandomPerformances();
	}

	

}
