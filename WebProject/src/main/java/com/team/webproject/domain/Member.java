package com.team.webproject.domain;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

import org.springframework.boot.autoconfigure.domain.EntityScan;

import lombok.AccessLevel;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Getter
@Setter
@Entity
@Table(name = "members")
public class Member {
	
	@Column(name="member_code")
	private Integer member_code;
	
	@Id
	@Column(name = "member_id")
	private String member_id;
	
	@Column(name = "member_pwd")
	private String member_pwd;
	
	@Column(name = "member_name")
	private String member_name;
	
	@Column(name = "member_birth")
	private String member_birth;
	
	@Column(name = "member_phone")
	private String member_phone;
	
	@Column(name = "member_email")
	private String member_email;
	
	@Column(name = "member_role")
	private String member_role;
	
	@Builder
    public Member(Integer member_code, String member_id,  String member_pwd, String member_name, String member_phone,String member_email, String member_birth, String member_role) {
        this.member_id=member_id;
        this.member_code = member_code;
        this.member_name= member_name;
        this.member_pwd= member_pwd;
        this.member_birth = member_birth;
        this.member_phone= member_phone;
        this.member_email=member_email;
        this.member_role = member_role;
    }
	
	
}
