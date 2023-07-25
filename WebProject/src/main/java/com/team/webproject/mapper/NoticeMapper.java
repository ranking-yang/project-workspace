package com.team.webproject.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.team.webproject.dto.NoticeDTO;

public interface NoticeMapper {
	
	int getCount();
	
	List<NoticeDTO> getPage(@Param("start")int start, @Param("end")int end);
	
	NoticeDTO getRecord(@Param("pk")int pk);
	
}
