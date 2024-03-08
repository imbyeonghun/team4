package team4.cafe.app.dao;

import org.apache.ibatis.annotations.Param;

import team4.cafe.app.model.vo.MemberVO;

public interface MyPageDAO {

	int selectCountBoard(@Param("user")MemberVO user);

	int selectCountComment(@Param("user")MemberVO user);
}