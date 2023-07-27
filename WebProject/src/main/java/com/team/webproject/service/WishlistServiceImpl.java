package com.team.webproject.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.team.webproject.dto.WishlistDTO;
import com.team.webproject.mapper.WishlistMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class WishlistServiceImpl implements WishlistService{
	private final WishlistMapper wishlistMapper;

	@Override
	public List<WishlistDTO> getUserWislist(int member_code) {
		return wishlistMapper.getUserWislist(member_code);
	}
}
