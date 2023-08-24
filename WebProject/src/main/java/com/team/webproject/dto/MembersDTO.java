package com.team.webproject.dto;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Collection;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

//import com.team.webproject.domain.Member;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class MembersDTO implements UserDetails {
	
	private static final long serialVersionUID = 1L;

	private Integer member_code;
	
	@NotBlank(message = "아이디는 필수 입력 값입니다.")
	@Pattern(regexp="^[a-zA-Z]{1}[a-zA-Z0-9_-]{4,20}$",
			message = "아이디는 4~20자의 영문, 숫자, 특수기호(_)(-)만 사용가능합니다.")
	private String member_id;
	
	@NotBlank(message = "비밀번호는 필수 입력 값입니다.")
	@Pattern(regexp="(?=.*[0-9])(?=.*[a-zA-Z])(?=.*\\W)(?=\\S+$).{8,20}",
    		message = "비밀번호는 영문 대,소문자와 숫자, 특수기호가 적어도<br>1개 이상씩 포함된"
    				+ "8자 ~ 20자의 비밀번호여야 합니다.")
	private String member_pwd;
	
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
	
	@NotBlank(message = "이메일은 필수 입력 값입니다.")
	@Email(message = "이메일 형식에 맞지 않습니다.")
	private String member_email;
	
	private String member_role;
	private Date join_date;
	
	@Builder
    public MembersDTO(Integer member_code, String member_id,  String member_pwd, String member_name, String member_phone, String member_birth ,String member_email, String member_role) {

        this.member_id=member_id;
        this.member_code = member_code;
        this.member_name= member_name;
        this.member_pwd= member_pwd;
        this.member_birth = member_birth;
        this.member_phone= member_phone;
        this.member_email=member_email;
        this.member_role = member_role;
    }


	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		
		Collection<GrantedAuthority> collectors = new ArrayList<>();

		collectors.add(new GrantedAuthority() {

			private static final long serialVersionUID = 1L;

			@Override
			public String getAuthority() {
				return "ROLE_" + getMember_role();
			}
			
		});
		
		return collectors;
	}


	@Override
	public String getPassword() {
		return getMember_pwd();
	}


	@Override
	public String getUsername() {
		return getMember_id();
	}


	@Override
	public boolean isAccountNonExpired() {
		return true;
	}


	@Override
	public boolean isAccountNonLocked() {
		return true;
	}


	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}


	@Override
	public boolean isEnabled() {
		return true;
	}

}