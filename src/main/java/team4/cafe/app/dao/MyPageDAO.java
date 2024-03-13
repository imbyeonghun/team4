package team4.cafe.app.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import team4.cafe.app.model.vo.BoardVO;
import team4.cafe.app.model.vo.MemberVO;
import team4.cafe.app.model.vo.MyPageMemberVO;
import team4.cafe.app.model.vo.PostVO;

public interface MyPageDAO {

	int selectCountPost(@Param("user")MemberVO user);

	int selectCountComment(@Param("user")MemberVO user);

	boolean updateInfo(@Param("user")MyPageMemberVO updateUser);

	PostVO selectPostListByuser(@Param("user")MemberVO user);

	ArrayList<BoardVO> selectPostListWithBoard(@Param("user")MemberVO user);
}