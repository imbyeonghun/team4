package team4.cafe.app.model.vo;

import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

/* 
  [카페 등급]
  운영자 : 
  Level 1 : 기본값, 게시글 0
  Level 2 : 게시글 10
  Level 3 : 게시글 20
 */

@Data
@NoArgsConstructor
public class MemberVO {
	
	private String me_id;
	private String me_pw;
	private String me_email;
	private String me_name;
	private Date me_date;			//가입일
	private int me_loginCount;		//로그인(카페접속) 횟수 (default 0)
	private int me_fail;			//로그인 실패 횟수 (default 0)
	private String me_st_state;		//상태 (이용중, 기간정지, 영구정지, 탈퇴)
	private String me_gr_name;		//등급명 (운영자, Level 1, Level 2, Level 3) 
	
	public MemberVO(String me_id, String me_pw, String me_email, String me_name, Date me_date) {
		this.me_id = me_id;
		this.me_pw = me_pw;
		this.me_email = me_email;
		this.me_name = me_name;
		this.me_date = me_date;
	}

	public MemberVO(String me_id, String me_pw, String me_email, String me_name) {
		this.me_id = me_id;
		this.me_pw = me_pw;
		this.me_email = me_email;
		this.me_name = me_name;
	}

	public MemberVO(String me_id, String me_st_state, String me_gr_name) {
		this.me_id = me_id;
		this.me_st_state = me_st_state;
		this.me_gr_name = me_gr_name;
	}
}

