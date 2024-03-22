package team4.cafe.app.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import team4.cafe.app.model.vo.BoardVO;
import team4.cafe.app.model.vo.CommentVO;
import team4.cafe.app.model.vo.MemberVO;
import team4.cafe.app.pagination.Criteria;

public interface MyPageDAO {

	int selectCountPost(@Param("user")MemberVO user);

	int selectCountComment(@Param("user")MemberVO user);

	boolean updateInfo(@Param("user")MemberVO user);

	ArrayList<BoardVO> selectPostListByUser(@Param("user")MemberVO user, @Param("cri")Criteria cri);

	ArrayList<CommentVO> selectCommentListByUser(@Param("user")MemberVO user, @Param("cri")Criteria cri);

	int selectTotalCountPost(@Param("cri")Criteria cri);

	int selectTotalCountComment(@Param("cri")Criteria cri);

	boolean updateMemberSecession(@Param("me_id")String me_id);

	void updateMemberStop(@Param("user")MemberVO user);

	MemberVO selectMember(@Param("user")MemberVO user);

	void updateFailCount(@Param("user")MemberVO user);

	void updateGrade(@Param("user")MemberVO user);
}