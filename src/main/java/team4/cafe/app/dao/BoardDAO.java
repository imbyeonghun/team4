package team4.cafe.app.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import team4.cafe.app.model.vo.BoardVO;
import team4.cafe.app.model.vo.CategoryVO;
import team4.cafe.app.model.vo.GradeVO;
import team4.cafe.app.pagination.BoardCriteria;
import team4.cafe.app.pagination.Criteria;

public interface BoardDAO {

	ArrayList<CategoryVO> selectCategoryList();

	boolean insertCategory(@Param("category")String category);

	boolean deleteCategory(@Param("num")int co_num);

	boolean updateCategory(@Param("ca") CategoryVO category);

	ArrayList<BoardVO> getBoardList(@Param("cri")BoardCriteria cri);
	
	ArrayList<BoardVO> selectBoardList();

	boolean insertBoard(@Param("board")BoardVO board);

	boolean updateBoard(@Param("board")BoardVO board);

	boolean deleteBoard(@Param("bo_num")int bo_num);

	int getCategoryCount();

	ArrayList<CategoryVO> getCategoryList(@Param("cri")Criteria cri);

	int getBoardCount(@Param("cri")BoardCriteria cri);

	BoardVO selectBoard(@Param("bo_num") int bo_num);

	int getAllBoardCount();

	ArrayList<GradeVO> selectGradeList();

}
