package team4.cafe.app.service;

import java.util.ArrayList;

import team4.cafe.app.model.vo.CategoryVO;

public interface BoardService {

	ArrayList<CategoryVO> getCategoryList();

	boolean insertCategory(String category);

	boolean deleteCategory(int co_num);

	boolean updateCategory(CategoryVO category);

}