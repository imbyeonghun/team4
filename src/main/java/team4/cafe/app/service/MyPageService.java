package team4.cafe.app.service; 

import java.util.ArrayList;

import team4.cafe.app.model.vo.BoardVO;
import team4.cafe.app.model.vo.CommentVO;
import team4.cafe.app.model.vo.MemberVO;
import team4.cafe.app.pagination.Criteria;

public interface MyPageService {

	int getPostCount(MemberVO user);

	int getCommentCount(MemberVO user);

	boolean updateUserInfo(MemberVO updateUser);

	ArrayList<BoardVO> getPostListByUser(MemberVO user, Criteria cri);

	ArrayList<CommentVO> getCommentListByUser(MemberVO user);

	int getTotalCount(Criteria cri);
}