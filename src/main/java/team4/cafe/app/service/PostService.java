package team4.cafe.app.service;

import java.util.ArrayList;

import team4.cafe.app.model.vo.MemberVO;
import team4.cafe.app.model.vo.PostVO;

public interface PostService {

	ArrayList<PostVO> getPostList(int bo_num);

	boolean insertPost(PostVO post);

	boolean deletePost(MemberVO user, int bo_num, int po_num);

	PostVO getPost(int po_num);

	boolean updateView(int bo_num, int po_num);

	boolean updatePost(PostVO post, MemberVO user);

}
