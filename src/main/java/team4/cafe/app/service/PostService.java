package team4.cafe.app.service;

import java.util.ArrayList;

import team4.cafe.app.model.vo.BoardVO;
import team4.cafe.app.model.vo.MemberVO;
import team4.cafe.app.model.vo.PostVO;

public interface PostService {

	ArrayList<PostVO> getPostList(int bo_num);

	boolean insertPost(PostVO post);

	boolean deletePost(MemberVO user, int bo_num);

	PostVO getPost(int po_num);

	boolean updateView(int po_num);

	boolean updatePost(PostVO post, MemberVO user);

	BoardVO getBoard(int bo_num);

}
