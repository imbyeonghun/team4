package team4.cafe.app.service;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import team4.cafe.app.dao.PostDAO;
import team4.cafe.app.model.vo.PostVO;

public class PostServiceImp implements PostService{
	
	private PostDAO postDao;
	public PostServiceImp() {
		String resource = "team4/cafe/app/config/mybatis-config.xml";
		try {
			InputStream inputStream = Resources.getResourceAsStream(resource);
			SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			SqlSession session = sessionFactory.openSession(true);
			postDao = session.getMapper(PostDAO.class);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public ArrayList<PostVO> getPostList(int boardNum) {
		return postDao.selectPostList(boardNum);
	}

	@Override
	public boolean insertBoard(PostVO post) {
		if(post.getPo_bo_num() == 0) {
			return false;
		}
		if(	!checkString(post.getPo_content()) ||
			!checkString(post.getPo_title()) ||
			!checkString(post.getPo_me_id())) {
			return false;
		}
		return postDao.insertPost(post);
	}
	
	private boolean checkString(String string) {
		if(string == null || string.length() == 0) {
			return false;
		}
		return true;
	}
}
