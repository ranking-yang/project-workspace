package com.team.webproject.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team.webproject.dto.MDPerformanceDTO;
import com.team.webproject.dto.MD_getPosterDTO;
import com.team.webproject.dto.MDrecomDTO;
import com.team.webproject.dto.PerformanceDTO;

@Mapper
public interface MD_RecomMapper {
	
	int addMDrecom(MDrecomDTO mddata);
	
	int currseq();
	
	int addMDperfo(MDPerformanceDTO mdperDTO);
	
	List<MDrecomDTO> getMDrecom();
	
	List<MD_getPosterDTO> getMDposter();
	
	List<PerformanceDTO> getMDperfom(String md_code);
}
