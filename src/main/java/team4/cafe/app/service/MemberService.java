package team4.cafe.app.service;

import java.util.ArrayList;

import team4.cafe.app.model.dto.LoginDTO;
import team4.cafe.app.model.vo.GradeVO;
import team4.cafe.app.model.vo.MemberVO;
import team4.cafe.app.model.vo.StateVO;
import team4.cafe.app.pagination.Criteria;

public interface MemberService {

	boolean signup(MemberVO memberVO);

	MemberVO login(LoginDTO loginDTO);

	boolean checkId(String id);

	boolean checkNickName(String nickName);

	ArrayList<MemberVO> getMemberList(Criteria cri);

	int getMemberCount(Criteria cri);

	ArrayList<StateVO> getStateList();

	ArrayList<GradeVO> getGradeList();

	boolean updateMember(MemberVO member);

	int getAllMemberCount();

	MemberVO getMember(String id);

	void addFailCount(MemberVO user);

	void stopMember(MemberVO userFail);


}
