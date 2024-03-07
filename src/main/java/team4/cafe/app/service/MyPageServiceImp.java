package team4.cafe.app.service;

import team4.cafe.app.dao.MyPageDAO;
import team4.cafe.app.model.vo.MemberVO;

public class MyPageServiceImp implements MyPageService {

	private MyPageDAO myPageDao;
	@Override
	public int getBoardCount(MemberVO user) {
		if(user == null) {
			return 0;
		}
		return myPageDao.selectCountBoard(user);
	}

	@Override
	public int getCommentCount(MemberVO user) {
		if(user == null) {
			return 0;
		}
		return myPageDao.selectCountComment(user);
	}

}