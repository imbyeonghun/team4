package team4.cafe.app.service;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import team4.cafe.app.dao.BoardDAO;
import team4.cafe.app.model.vo.CategoryVO;

public class BoardServiceImp implements BoardService {
	private BoardDAO boardDao;
	
	public BoardServiceImp() {
		String resource = "team4/cafe/app/config/mybatis-config.xml";
		try {
			InputStream inputStream = Resources.getResourceAsStream(resource);
			SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			SqlSession session = sessionFactory.openSession(true);
			boardDao = session.getMapper(BoardDAO.class);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//카테고리 목록을 가져옴
	@Override
	public ArrayList<CategoryVO> getCategoryList() {
		return boardDao.selectCategoryList();
	}
	
	//카테고리 등록
	@Override
	public boolean insertCategory(String category) {
		if(category==null) {
			return false;
		}
		ArrayList<CategoryVO>categoryList=boardDao.selectCategoryList();
		for(CategoryVO tmp:categoryList) {
			if(tmp.getCo_name().equals(category)) {
				return false;
			}
		}
		return boardDao.insertCategory(category);
	}
	
	//카테고리 삭제
	@Override
	public boolean deleteCategory(int co_num) {
		return boardDao.deleteCategory(co_num);
	}
	
	//카테고리 수정
	@Override
	public boolean updateCategory(CategoryVO category) {
		if(category==null||category.getCo_name()==null) {
			return false;
		}
		ArrayList<CategoryVO> categoryList=boardDao.selectCategoryList();
		for(CategoryVO tmp:categoryList) {
			if(tmp.getCo_name().equals(category.getCo_name())) {
				return false;
			}
		}
		return boardDao.updateCategory(category);
	}
	
}
