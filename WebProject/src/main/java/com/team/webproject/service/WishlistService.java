package com.team.webproject.service;

import java.util.List;

import com.team.webproject.dto.WishlistDTO;

public interface WishlistService {
	List<WishlistDTO> getUserWislist(int member_code);

}
