package team4.cafe.app.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import team4.cafe.app.model.vo.PostVO;

public interface PostDAO {

	ArrayList<PostVO> selectPostList(@Param("bo_num") int bo_num);

	boolean insertPost(@Param("post") PostVO post);

	boolean deletePost(@Param("po_num") int num);

	PostVO selectPost(@Param("po_num") int po_num);

	boolean updateView(@Param("bo_num") int bo_num, @Param("po_num") int po_num);

	boolean updatePost(@Param("post") PostVO post);

}
