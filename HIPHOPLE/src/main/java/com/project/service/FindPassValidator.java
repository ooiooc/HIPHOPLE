package com.project.service;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.project.domain.MemberVO;

//비밀번호 찾기 화면에서 이메일과 아이디가 정확히 입력됐는지 검증하는 클래스
public class FindPassValidator implements Validator {
	
	//이메일 정규표현식
    private static final String emailRegexp = "^[_a-z0-9-]+(.[_a-z0-9-]+)*@(?:\\w+\\.)+\\w+$"; //이메일 정규 표현식

    private Pattern pattern;
    private Matcher matcher;
    
    public FindPassValidator() {
        pattern = pattern.compile(emailRegexp);
    }
    
    @Override
    public boolean supports(Class<?> clazz) {
        return MemberVO.class.isAssignableFrom(clazz);
    }
 
    @Override
    public void validate(Object target, Errors errors) {
    	MemberVO vo = (MemberVO)target;//가져온 객체를 RegisterRequest에 담아주기
       
    	//이메일이 올바른 형식인지 검사
        matcher = pattern.matcher(vo.getEmail());
        if(vo.getEmail() == null || vo.getEmail().trim().isEmpty())
            errors.rejectValue("Email", "EmailRequired", "필수 정보입니다");
        else if(!matcher.matches()) //사용자가 입력한 이메일이 정규표현식에 매치 되지않는다면
            errors.rejectValue("Email", "bad", "올바르지 않은 형식입니다");
            
        
    }
 
}
