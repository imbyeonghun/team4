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

	ArrayList<CommentVO> getCommentListByUser(MemberVO user, Criteria cri);

	int getTotalCountPost(Criteria cri, MemberVO user);

	int getTotalCountComment(Criteria cri, MemberVO user);

	boolean updateMemberSecession(String me_id);

	MemberVO getMember(MemberVO user);

	void updateMemberStop(MemberVO user);

	void updateFailCount(MemberVO user);

	void updateUserGrade(MemberVO user);
}