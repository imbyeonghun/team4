/* 프로그램 구성 전 기본값으로 들어가야하는 내용들 */

/* 멤버 상태를 등록(기본값 : 이용중) */
insert into state(st_state) values("이용중"),("기간정지"), ("영구정지"), ("탈퇴");
/* 멤버 등급 이름과 순위(숫자가 작을수록 높은 순위) (기본값 : Level1) */
insert into grade values("운영자", 1),("Level3", 2), ("Level2", 3),("Level1", 4) ;
/* 운영자 정보 추가 */
insert into member(me_id, me_pw, me_email, me_name, 
	me_date, me_loginCount, me_fail, me_st_state, me_gr_name)
	values("admin", "admin", "admin@cafe.com", "운영자", "2024-01-01", 0, 0, "이용중", "운영자");
/* post_type 1번 기본 값 추가(공백 말머리) */
insert into post_type(pt_name) values("");
