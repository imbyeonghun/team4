package team4.cafe.app.service;

import java.util.ArrayList;

import team4.cafe.app.model.vo.PostVO;

public interface PostService {

	ArrayList<PostVO> getPostList(int boardNum);

	boolean insertBoard(PostVO post);

}
