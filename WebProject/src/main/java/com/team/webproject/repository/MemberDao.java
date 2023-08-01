package com.team.webproject.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
 
import com.team.webproject.domain.Member;
 
public interface MemberDao extends JpaRepository<Member, String> {
	Member findOneById(String id);
}
