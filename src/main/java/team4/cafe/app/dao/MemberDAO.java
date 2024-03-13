package team4.cafe.app.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import team4.cafe.app.model.vo.MemberVO;
import team4.cafe.app.pagination.Criteria;

public interface MemberDAO {

	boolean insertMember(@Param("member")MemberVO memberVO);

	MemberVO selectMember(@Param("me_id")String id);

	void updateLoginCount(@Param("me_id")String id, @Param("me_loginCount")int loginCount);

	ArrayList<MemberVO> getMemberList(@Param("cri")Criteria cri);

	int getMemberCount(@Param("cri")Criteria cri);

}
