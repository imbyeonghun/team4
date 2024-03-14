package team4.cafe.app.dao;

import org.apache.ibatis.annotations.Param;

import team4.cafe.app.model.vo.MemberVO;

public interface MemberDAO {

	boolean insertMember(@Param("member")MemberVO memberVO);

	MemberVO selectMember(@Param("me_id")String id);

	void updateLoginCount(@Param("me_id")String id, @Param("me_loginCount")int loginCount);

	MemberVO selectMemberNickName(@Param("me_name")String nickName);

}
