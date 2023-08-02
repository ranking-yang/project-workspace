package com.team.webproject.mapper;

import org.apache.ibatis.annotations.Param;

import com.team.webproject.dto.MembersDTO;

public interface OAuthMapper {

	// 카카오 관련 sql매핑
	int insertOauthMember(MembersDTO member);

	MembersDTO findByMemberId(@Param("id") String memberId);
}
