package team4.cafe.app.service;

import team4.cafe.app.model.dto.LoginDTO;
import team4.cafe.app.model.vo.MemberVO;

public interface MemberService {

	boolean signup(MemberVO memberVO);

	MemberVO login(LoginDTO loginDTO);

	void addLoginCount(String id, int loginCount);

	boolean checkId(String id);

	boolean checkNickName(String nickName);

}
