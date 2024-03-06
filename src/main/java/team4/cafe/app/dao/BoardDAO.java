package team4.cafe.app.dao;

import java.util.ArrayList;

import team4.cafe.app.model.vo.CategoryVO;

public interface BoardDAO {

	ArrayList<CategoryVO> selectGategoryList();

}
