package team4.cafe.app.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import team4.cafe.app.model.vo.PostVO;

public interface PostDAO {

	ArrayList<PostVO> selectPostList(@Param("bo_num") int boardNum);

	boolean insertPost(@Param("post") PostVO post);

}
