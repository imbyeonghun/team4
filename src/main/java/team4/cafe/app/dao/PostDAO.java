package team4.cafe.app.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import team4.cafe.app.model.vo.BoardVO;
import team4.cafe.app.model.vo.CommentVO;
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


	ArrayList<CommentVO> selectCommentList(@Param("cri") Criteria cri);

	int selectTotalCommentCount(@Param("cri") Criteria cri);

	boolean insertComment(@Param("co") CommentVO comment);
	//매퍼에 insert 추가

	CommentVO selectComment(@Param("cm_num") int num);

	boolean deleteComment(@Param("cm_num") int num);

	boolean updateComment(@Param("co") CommentVO comment);

	ArrayList<PostVO> selectAllPost(@Param("cri")Criteria cri);

	int selectAllPostCount();

	ArrayList<PostTypeVO> getPostTypeList(@Param("cri")Criteria cri);

	int getPostTypeCount(Criteria cri);

	boolean insertPostType(@Param("ptName")String ptName);

	ArrayList<PostTypeVO> selectPostTypeList();



}
