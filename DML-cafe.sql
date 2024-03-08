insert into category(co_name) values("운영자");
insert into board(bo_name,bo_co_num) values("공지","1");
insert into state(st_state) values("이용중"),("기간정지"), ("영구정지"), ("탈퇴");
insert into grade(gr_name) values("운영자"),("Level1"), ("Level2"), ("Level3");
insert into member(me_id, me_pw, me_email, me_name, 
	me_date, me_loginCount, me_fail, me_st_state, me_gr_name)
	values("admin", "admin", "admin@cafe.com", "운영자", "2024-01-01", 0, 0, "이용중", "운영자");