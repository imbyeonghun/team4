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
import team4.cafe.app.model.vo.CommentVO;
import team4.cafe.app.model.vo.MemberVO;
import team4.cafe.app.pagination.Criteria;

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
	public boolean updateUserInfo(MemberVO updateUser) {
		if(updateUser == null) {
			return false;
		}
		return myPageDao.updateInfo(updateUser);
	}

	@Override
	public ArrayList<BoardVO> getPostListByUser(MemberVO user, Criteria cri) {
		if(user == null) {
			return null;
		}
		if(cri == null) {
			cri = new Criteria();
		}
		return myPageDao.selectPostListByUser(user, cri);
	}

	@Override
	public ArrayList<CommentVO> getCommentListByUser(MemberVO user, Criteria cri) {
		if(user == null) {
			return null;
		}
		if(cri == null) {
			cri = new Criteria();
		}
		return myPageDao.selectCommentListByUser(user, cri);
	}

	@Override
	public int getTotalCountPost(Criteria cri) {
		if(cri == null) {
			cri = new Criteria();
		}
		return myPageDao.selectTotalCountPost(cri);
	}

	@Override
	public int getTotalCountComment(Criteria cri) {
		if(cri == null) {
			cri = new Criteria();
		}
		return myPageDao.selectTotalCountComment(cri);
	}

	@Override
	public boolean updateMemberSecession(String me_id) {
		if(me_id == null) {
			return false;
		}
		return myPageDao.updateMemberSecession(me_id);
	}

	@Override
	public MemberVO getMember(MemberVO user) {
		if(user == null) {
			return null;
		}
		return myPageDao.selectMember(user);
	}

	@Override
	public void updateMemberStop(MemberVO user) {
		if(user == null) {
			return;
		}
		myPageDao.updateMemberStop(user);
	}

	@Override
	public void updateFailCount(MemberVO user) {
		if(user == null) {
			return;
		}
		myPageDao.updateFailCount(user);
	}

	@Override
	public void updateUserGrade(MemberVO user) {
		if(user == null) {
			return;
		}
		myPageDao.updateGrade(user);
	}
}