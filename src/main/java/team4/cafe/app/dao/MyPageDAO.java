package team4.cafe.app.dao;

import org.apache.ibatis.annotations.Param;

import team4.cafe.app.model.vo.MemberVO;

public interface MyPageDAO {

	int selectCountPost(@Param("user")MemberVO user);

	int selectCountComment(@Param("user")MemberVO user);

	boolean updateInfo(@Param("user")MemberVO updateUser);
}