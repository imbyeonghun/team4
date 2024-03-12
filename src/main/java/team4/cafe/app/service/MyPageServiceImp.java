package team4.cafe.app.service;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import team4.cafe.app.dao.MyPageDAO;
import team4.cafe.app.model.vo.BoardVO;
import team4.cafe.app.model.vo.MemberVO;
import team4.cafe.app.model.vo.MyPageMemberVO;
import team4.cafe.app.model.vo.PostVO;

public class MyPageServiceImp implements MyPageService {

	private MyPageDAO myPageDao;
	
	public MyPageServiceImp() {
		String resource = "team4/cafe/app/config/mybatis-config.xml";
		
		try {
			InputStream inputStream = Resources.getResourceAsStream(resource);
			SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			SqlSession session = sessionFactory.openSession(true);
			myPageDao = session.getMapper(MyPageDAO.class);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public int getPostCount(MemberVO user) {
		if(user == null) {
			return 0;
		}
		return myPageDao.selectCountPost(user);
	}

	@Override
	public int getCommentCount(MemberVO user) {
		if(user == null) {
			return 0;
		}
		return myPageDao.selectCountComment(user);
	}

	@Override
	public boolean updateUserInfo(MyPageMemberVO updateUser) {
		if(updateUser == null) {
			return false;
		}
		return myPageDao.updateInfo(updateUser);
	}

	@Override
	public PostVO getPostList(MemberVO user) {
		if(user == null) {
			return null;
		}
		return myPageDao.selectPostListByuser(user);
	}

	@Override
	public ArrayList<BoardVO> getPostListWithBoard(MemberVO user) {
		if(user == null) {
			return null;
		}
		return myPageDao.selectPostListWithBoard(user);
	}
}