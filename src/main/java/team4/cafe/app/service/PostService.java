package team4.cafe.app.service;

import java.util.ArrayList;

import team4.cafe.app.model.vo.BoardVO;
import team4.cafe.app.model.vo.CommentVO;
import team4.cafe.app.model.vo.MemberVO;
import team4.cafe.app.model.vo.PostTypeVO;
import team4.cafe.app.model.vo.PostVO;
import team4.cafe.app.pagination.Criteria;

public interface PostService {

	ArrayList<PostVO> getPostList(int bo_num, Criteria cri);

	boolean insertPost(PostVO post);

	boolean deletePost(MemberVO user, int bo_num);

	PostVO getPost(int po_num);

	boolean updateView(int po_num);

	boolean updatePost(PostVO post, MemberVO user);

	BoardVO getBoard(int bo_num);

	ArrayList<BoardVO> getBoardList();

	int getTotalCount(int bo_num, Criteria cri);

	ArrayList<PostTypeVO> getPostTypeList();

	ArrayList<CommentVO> getCommentList(Criteria cri);

	ArrayList<PostVO> getAllPostList(Criteria cri);

	int getAllPostCount();

	int getTotalCommentCount(Criteria cri);

	boolean insertComment(CommentVO comment);

	boolean deleteComment(int num, MemberVO user);

	boolean updateComment(CommentVO comment);

	ArrayList<PostTypeVO> getPostTypeList(Criteria cri);

	int getPostTypeCount(Criteria cri);

	boolean insertPostType(String ptName);

	boolean deletePostType(int num);

	boolean updatePostType(int num, String name);

	int getAllTotalCount(Criteria cri);

}
