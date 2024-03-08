package team4.cafe.app.service;

import team4.cafe.app.model.vo.MemberVO;

public interface MyPageService {

	int getBoardCount(MemberVO user);

	int getCommentCount(MemberVO user);
}