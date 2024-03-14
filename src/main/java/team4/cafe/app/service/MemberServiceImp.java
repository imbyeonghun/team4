package team4.cafe.app.service;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import team4.cafe.app.dao.MemberDAO;
import team4.cafe.app.model.dto.LoginDTO;
import team4.cafe.app.model.vo.MemberVO;

public class MemberServiceImp implements MemberService {

	MemberDAO memberDAO;
	
	public MemberServiceImp() {
		String resource = "team4/cafe/app/config/mybatis-config.xml";
		
		try {
			InputStream inputStream = Resources.getResourceAsStream(resource);
			SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			SqlSession session = sessionFactory.openSession(true);
			memberDAO = session.getMapper(MemberDAO.class);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/** 회원가입 */
	@Override
	public boolean signup(MemberVO memberVO) {
		//null값 체크
		if(memberVO == null || 
			memberVO.getMe_id() == null || 
			memberVO.getMe_pw() == null || 
			memberVO.getMe_email() == null ||
			memberVO.getMe_name() == null||
			memberVO.getMe_date() == null) {
			System.out.println("null값");
			return false;
		}
		//null이 아니라면
		
		//정규표현식 체크
		
		//아이디 중복 체크
		try {
			System.out.println("null값 아님");
			return memberDAO.insertMember(memberVO);
		}catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		
	}

	/** 로그인 */
	@Override
	public MemberVO login(LoginDTO loginDTO) {
		if(loginDTO == null) {
			return null;
		}
		//아이디로 회원 정보 요청
		MemberVO user = memberDAO.selectMember(loginDTO.getId());
		
		//아이디 확인
		if(user == null) {
			return null;
		}
		//비번 확인
		if(user.getMe_pw().equals(loginDTO.getPw())) {
			return user;
		}
		return null;
	}

	/* 로그인 횟수(카페 접속 횟수 증가) */
	@Override
	public void addLoginCount(String id, int loginCount) {
		memberDAO.updateLoginCount(id, loginCount);
	}

	@Override
	public boolean checkId(String id) {
		MemberVO member = memberDAO.selectMember(id);
		
		return member == null;
	}

	@Override
	public boolean checkNickName(String nickName) {
		MemberVO member = memberDAO.selectMemberNickName(nickName);
		
		return member == null;
	}

}
