package com.team.webproject.dto;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

import lombok.Data;

@Data
public class MembersDTO {
	
	private Integer member_code;
	
	@NotBlank(message = "아이디는 필수 입력 값입니다.")
	private String member_id;
	
	@NotBlank(message = "비밀번호는 필수 입력 값입니다.")
	@Pattern(regexp="(?=.*[0-9])(?=.*[a-zA-Z])(?=.*\\W)(?=\\S+$).{8,20}",
    		message = "비밀번호는 영문 대,소문자와 숫자, 특수기호가 적어도 1개 이상씩 포함된"
    				+ "8자 ~ 20자의 비밀번호여야 합니다.")
	private String member_pwd;
	
	@NotBlank(message = "이름은 필수 입력 값입니다.")
	private String member_name;
	
	@NotBlank(message = "생년월일은 필수 입력 값입니다.")
	private String member_birth;
	
	@NotBlank(message = "휴대폰번호는 필수 입력 값입니다.")
	@Pattern(regexp="^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$")
	private String member_phone;
	
	@NotBlank(message = "이메일은 필수 입력 값입니다.")
	@Email(message = "이메일 형식에 맞지 않습니다.")
	private String member_email;
}
