insert into category(co_name) values("운영자");
insert into category(co_name) values("운영자");
insert into board(bo_name,bo_co_num) values("공지","1");
insert into state(st_state) values("이용중"),("기간정지"), ("영구정지"), ("탈퇴");
insert into grade(gr_name) values("운영자"),("Level1"), ("Level2"), ("Level3");
insert into member(me_id, me_pw, me_email, me_name, 
	me_date, me_loginCount, me_fail, me_st_state, me_gr_name)
	values("admin", "admin", "admin@cafe.com", "운영자", "2024-01-01", 0, 0, "이용중", "운영자");
insert into post(po_title, po_id, po_content, po_bo_num) values ("공지", "admin", "공지입니다.", "1");

/* post_type 추가*/
insert into post_type(pt_name) values("공지");
insert into post_type(pt_name) values("필독");