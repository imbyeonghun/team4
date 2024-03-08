package team4.cafe.app.service;

import java.util.ArrayList;

import team4.cafe.app.model.vo.MemberVO;
import team4.cafe.app.model.vo.PostVO;

public interface PostService {

	ArrayList<PostVO> getPostList(int boardNum);

	boolean insertBoard(PostVO post);

	boolean deletePost(MemberVO user, int bo_num, int po_num);

}
