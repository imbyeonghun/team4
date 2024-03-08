package team4.cafe.app.service;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import team4.cafe.app.dao.MyPageDAO;
import team4.cafe.app.model.vo.MemberVO;

public class MyPageServiceImp implements MyPageService {

	private MyPageDAO myPageDao;
	
	public MyPageServiceImp() {
		String resource = "kr/kh/app/config/mybatis-config.xml";
		
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