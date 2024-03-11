package team4.cafe.app.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import team4.cafe.app.model.vo.BoardVO;
import team4.cafe.app.model.vo.CategoryVO;

public interface BoardDAO {

	ArrayList<CategoryVO> selectCategoryList();

	boolean insertCategory(@Param("category")String category);

	boolean deleteCategory(@Param("num")int co_num);

	boolean updateCategory(@Param("ca") CategoryVO category);

	ArrayList<BoardVO> selectBoardList(@Param("num")int co_num);

	boolean insertBoard(@Param("board")BoardVO board);

	boolean updateBoard(@Param("board")BoardVO board);

	boolean deleteBoard(@Param("bo_num")int bo_num);

}
