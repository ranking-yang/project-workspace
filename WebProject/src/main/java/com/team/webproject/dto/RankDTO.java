package com.team.webproject.dto;

import java.util.List;

import lombok.Data;

@Data
public class RankDTO {
	private List<PerfomSaleDTO> li_per;
    private List<Float> perfom;
}
