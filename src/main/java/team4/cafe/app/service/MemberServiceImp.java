package team4.cafe.app.service;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.regex.Pattern;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import team4.cafe.app.dao.MemberDAO;
import team4.cafe.app.model.dto.LoginDTO;
import team4.cafe.app.model.vo.GradeVO;
import team4.cafe.app.model.vo.MemberVO;
import team4.cafe.app.model.vo.StateVO;
import team4.cafe.app.pagination.Criteria;

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
			checkString(memberVO.getMe_id()) || 
			checkString(memberVO.getMe_pw()) || 
			checkString(memberVO.getMe_email()) || 
			checkString(memberVO.getMe_name()) || 
			memberVO.getMe_date() == null) {
			System.out.println("memberService.signup() : null값");
			return false;
		}
		
		System.out.println("memberService.signup() : null값 아님");
		
		//아이디 중복 체크
		if((memberDAO.selectMember(memberVO.getMe_id())) != null) {
			System.out.println("memberService.signup() : 아이디: 중복");
			return false;
		}
		//닉네임 중복체크
		if((memberDAO.selectMemberNickName(memberVO.getMe_name())) != null) {
			System.out.println("memberService.signup() : 닉네임: 중복");
			return false;
		}
		System.out.println("memberService.signup() : 중복 아님");
		
		//정규표현식 체크
		
		String regexId = "^[a-zA-Z0-9]{8,20}$";
		String regexPw = "^[a-zA-Z0-9,.!@]{10,20}$";	
		String regexNickName =  "^[\\w\\Wㄱ-ㅎㅏ-ㅣ가-힣]{3,12}$";
		String regexEmail = "^[a-z0-9\\.\\-_]+@([a-z0-9\\-]+\\.)+[a-z]{2,6}$";	//이메일 형식 틀림
		if( !checkRegex(regexId,memberVO.getMe_id()) ||
			!checkRegex(regexPw,memberVO.getMe_pw()) ||
			!checkRegex(regexNickName,memberVO.getMe_name()) || 
			!checkRegex(regexEmail,memberVO.getMe_email())){
			System.out.println("memberService.signup() : 정규표현식 틀림");
			return false;
		}
		
		System.out.println("memberService.signup() : 정규표현식 맞음");
		
		try {
			return memberDAO.insertMember(memberVO);
		}catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		
	}
	
	//정규 표현식 체크
	private boolean checkRegex(String regex, String str) {
		if(!Pattern.matches(regex, str)) {
			System.out.println("memberService.checkRegex() : 정규표현식 틀림");
			return false;
		}
		System.out.println("memberService.checkRegex() : 정규표현식 맞음");
		return true;
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
			//로그인에 성공하면
			//카페 접속 횟수++
			int loginCount = user.getMe_loginCount() + 1;
			memberDAO.updateLoginCount(user.getMe_id(), loginCount);
			//로그인 실패 횟수 0으로
			
			return user;
		}
		//비번이 틀리면 
		return null;
	}

	
	//회원 리스트
	@Override
	public ArrayList<MemberVO> getMemberList(Criteria cri) {
		if(cri==null) {
			cri=new Criteria();
		}
		return memberDAO.getMemberList(cri);
	}
	
	//회원의 총 인원수
	@Override
	public int getMemberCount(Criteria cri) {
		if(cri==null) {
			return 0;
		}
		return memberDAO.getMemberCount(cri);
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


	//상태 리스트
	@Override
	public ArrayList<StateVO> getStateList() {
		return memberDAO.selectStateList();
	}
	
	//등급 리스트
	@Override
	public ArrayList<GradeVO> getGradeList() {
		return memberDAO.selectGradeList();
	}

	@Override
	public boolean updateMember(MemberVO member) {
		if(member==null) {
			return false;
		}
		if(checkString(member.getMe_gr_name())||
			checkString(member.getMe_id())||
			checkString(member.getMe_st_state())) {
			return false;
		}
		MemberVO DBmember=memberDAO.selectMember(member.getMe_id());
		if(DBmember==null) {
			return false;
		}
		return memberDAO.updateMember(member);
	}
	
	private boolean checkString(String str) {
		if(str==null||str.length()==0) {
			return true;
		}
		return false;
	}

	//모든 멤버 수 카운트
	@Override
	public int getAllMemberCount() {
		return memberDAO.getAllMemberCount();
	}

	//아이디로 멤버 정보 가져오기
	@Override
	public MemberVO getMember(String id) {
		if(checkString(id)) {
			return null;
		}
		return memberDAO.selectMember(id);
	}



	@Override
	public void setFailCount(MemberVO user, int loginFailCount) {
		memberDAO.updateFailCount(user.getMe_id(), loginFailCount);
		
	}

	@Override
	public void setMemberState(MemberVO user, String state) {
		if(user != null) {
			memberDAO.updateMemberState(user.getMe_id(), state);
		}
		
	}

	@Override
	public int getGradeRank(String gr_name) {
		if(gr_name == null) {
			return 4;	//최하 랭크
		}
		System.out.println("멤버서비스 - getGradeRank : " +  memberDAO.insertMemberGrRank(gr_name));
		return memberDAO.insertMemberGrRank(gr_name);
	}

}
