package team4.cafe.app.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import team4.cafe.app.model.vo.BoardVO;
import team4.cafe.app.model.vo.PostTypeVO;
import team4.cafe.app.model.vo.PostVO;
import team4.cafe.app.pagination.Criteria;

public interface PostDAO {

	ArrayList<PostVO> selectPostList(@Param("bo_num") int bo_num, @Param("cri") Criteria cri);

	boolean insertPost(@Param("post") PostVO post);

	PostVO selectPost(@Param("po_num") int po_num);

	boolean updateView(@Param("po_num") int po_num);

	boolean updatePost(@Param("post") PostVO post);

	boolean deletePost(@Param("po_num") int po_num);

	BoardVO selectBoard(@Param("bo_num") int bo_num);

	ArrayList<BoardVO> selectBoardList();

	int selectTotalCount(@Param("cri") Criteria cri);

	ArrayList<PostTypeVO> selectPostType();

	ArrayList<PostVO> selectAllPost(@Param("cri")Criteria cri);

	int selectAllPostCount();


}
