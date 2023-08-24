package com.team.webproject.dto;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class MembersDTO_findId {
	
	@NotBlank(message = "이름은 필수 입력 값입니다.")
	private String member_name;
	
	@NotBlank(message = "생년월일은 필수 입력 값입니다.")
	@Pattern(regexp="^\\d{2}\\d{2}\\d{2}$",
			message = "생년월일은 년월일 6자리만 입력해주세요.")
	private String member_birth;
	
	@NotBlank(message = "휴대폰번호는 필수 입력 값입니다.")
	@Pattern(regexp="^01([0~9])(\\d{3}|\\d{4})(\\d{4})$",
			message = "휴대폰 번호는 '-' 빼고 13자리를 입력해주세요.")
	private String member_phone;
	
	
	@Builder
    public MembersDTO_findId(String member_birth, String member_name, String member_phone) {
       
        this.member_name= member_name;
        this.member_birth = member_birth;
        this.member_phone= member_phone;
    }
	
	
}