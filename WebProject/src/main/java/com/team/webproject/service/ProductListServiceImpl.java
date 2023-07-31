package com.team.webproject.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.team.webproject.dto.PerformanceDTO;
import com.team.webproject.mapper.PerformanceMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ProductListServiceImpl implements ProductListService {
	
	
	private final PerformanceMapper performanceMapper;

	@Override
	public List<PerformanceDTO> getProductList(String main_category, Integer member_code, String area) {
		
		
		if(main_category.equals("키즈")) {
			if(member_code == null) {
				//+ 메인 카테고리가 키즈이면서 로그인 상태가 아닌 경우
				return performanceMapper.getKidsPerformances();
			}else {
				//+ 메인 카테고리가 키즈이면서 로그인 상태인 경우
				return performanceMapper.getUserPerformancesforKids();
			}
		}else {
			if(member_code == null) {
				//+ 메인 카테고리가 키즈가 아니면서 로그인 상태가 아닌 경우 (DB에서 가져오는 값에 wish_code 없음)
				return performanceMapper.getPerformances(main_category);
			}else {
				//+ 메인카테고리가 키즈가 아니면서 로그인 상태인 경우 (DB에서 가져오는 값에 wish_code 있음)
				return performanceMapper.getUserPerformances(main_category);	
			}
		}
	}

}
