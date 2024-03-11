package team4.cafe.app.service;

import java.util.ArrayList;

import team4.cafe.app.model.vo.BoardVO;
import team4.cafe.app.model.vo.CategoryVO;
import team4.cafe.app.pagination.Criteria;

public interface BoardService {

	ArrayList<CategoryVO> getCategoryList(Criteria cri);

	boolean insertCategory(String category);

	boolean deleteCategory(int co_num);

	boolean updateCategory(CategoryVO category);

	ArrayList<BoardVO> getBoardList(int co_num);

	boolean insertBoard(BoardVO board);

	boolean updateBoard(BoardVO board);

	boolean deleteBoard(int bo_num);

	int getCategoryCount(Criteria cri);

	ArrayList<CategoryVO> selectCategoryList();

}
