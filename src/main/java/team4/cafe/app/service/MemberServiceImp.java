package team4.cafe.app.service;

import team4.cafe.app.model.vo.MemberVO;

public class MemberServiceImp implements MemberService {

	@Override
	public boolean signup(MemberVO memberVO) {
		//null값 체크
		if(memberVO == null || 
			memberVO.getMe_id() == null || 
			memberVO.getMe_pw() == null || 
			memberVO.getMe_email() == null ||
			memberVO.getMe_name() == null) {
			return false;
		}
		
		//null이 아니라면 ( 정규표현식과 아이디 중복체크는 입력받을 때)
		return true;
	}

}
