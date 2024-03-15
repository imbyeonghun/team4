package team4.cafe.app.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import team4.cafe.app.model.vo.GradeVO;
import team4.cafe.app.model.vo.MemberVO;
import team4.cafe.app.model.vo.StateVO;
import team4.cafe.app.pagination.Criteria;

public interface MemberDAO {

	boolean insertMember(@Param("member")MemberVO memberVO);

	MemberVO selectMember(@Param("me_id")String id);

	void updateLoginCount(@Param("me_id")String id, @Param("me_loginCount")int loginCount);


	MemberVO selectMemberNickName(@Param("me_name")String nickName);

	ArrayList<MemberVO> getMemberList(@Param("cri")Criteria cri);

	int getMemberCount(@Param("cri")Criteria cri);

	ArrayList<StateVO> selectStateList();

	ArrayList<GradeVO> selectGradeList();

	boolean updateMember(@Param("member")MemberVO member);

	int getAllMemberCount();

	void updateFailCount(@Param("me_id")String me_id, @Param("me_fail")int loginFailCount);

	void updateMemberState(@Param("me_id")String me_id);


}
