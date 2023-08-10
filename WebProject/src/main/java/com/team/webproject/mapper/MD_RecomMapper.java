package com.team.webproject.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.team.webproject.dto.MDPerformanceDTO;
import com.team.webproject.dto.MDrecomDTO;

@Mapper
public interface MD_RecomMapper {
	
	int addMDrecom(MDrecomDTO mddata);
	
	int currseq();
	
	int addMDperfo(MDPerformanceDTO mdperDTO);
}
