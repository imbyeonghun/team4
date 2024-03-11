package team4.cafe.app.service;

import team4.cafe.app.model.vo.MemberVO;
import team4.cafe.app.model.vo.MyPageMemberVO;
import team4.cafe.app.model.vo.PostVO;

public interface MyPageService {

	int getPostCount(MemberVO user);

	int getCommentCount(MemberVO user);

	boolean updateUserInfo(MyPageMemberVO updateUser);

	PostVO getPostList(MemberVO user);
}