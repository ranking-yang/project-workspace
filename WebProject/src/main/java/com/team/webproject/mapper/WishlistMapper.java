package com.team.webproject.mapper;

import java.util.List;

import com.team.webproject.dto.WishlistDTO;

public interface WishlistMapper {
	List<WishlistDTO> getUserWishlist(int member_code);
	int insertWishlist(int member_code, String performance_code);
	int deleteWishlist(int member_code, String performance_code);
	
}
