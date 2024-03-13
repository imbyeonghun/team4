package team4.cafe.app.service;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import team4.cafe.app.dao.PostDAO;
import team4.cafe.app.model.vo.MemberVO;
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
	public ArrayList<PostVO> getPostList(int bo_num) {
		return postDao.selectPostList(bo_num);
	}

	@Override
	public boolean insertPost(PostVO post) {
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

	@Override
	public boolean deletePost(MemberVO user, int bo_num, int po_num) {
		PostVO post = postDao.selectPost(bo_num, po_num);
		if( user == null ||
			post.getPo_bo_num() != bo_num ||
			!post.getPo_me_id().equals(user.getMe_id())) {
			return false;
		}
		
		return postDao.deletePost(po_num);
	}

	@Override
	public PostVO getPost(int po_num) {
		return postDao.selectPost(po_num);
	}

	@Override
	public boolean updateView(int bo_num, int po_num) {
		return postDao.updateView(bo_num, po_num);
	}

	@Override
	public boolean updatePost(PostVO post, MemberVO user) {
		if(user == null || !post.getPo_me_id().equals(user.getMe_id())) {
			return false;
		}
		if( !checkString(post.getPo_title()) ||
			!checkString(post.getPo_content())) {
			return false;
		}
		return postDao.updatePost(post);
	}
}
