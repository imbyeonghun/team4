/* hrd cloud : https://www.erdcloud.com/d/xLTXnq72ihGm47RrJ */
DROP DATABASE IF EXISTS `cafe`;
CREATE DATABASE IF NOT EXISTS `cafe`;

USE `cafe`;

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
	`me_id`	varchar(20)	PRIMARY KEY,
	`me_pw`	varchar(20) not	NULL,
	`me_email`	varchar(30) not	NULL,
	`me_name`	varchar(12) not	NULL,
    `me_date` datetime not null,
	`me_loginCount`	int not	NULL default 0,
	`me_fail`	int not	NULL default 0,
	`me_st_state`	varchar(6)	NOT NULL default "이용중",
	`me_gr_name`	varchar(10)	NOT NULL default "Level1"
);

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
	`co_num`	int	PRIMARY KEY auto_increment,
	`co_name`	varchar(30) not	NULL
);

DROP TABLE IF EXISTS `post_type`;

CREATE TABLE `post_type` (
	`pt_num`	int	PRIMARY KEY auto_increment,
	`pt_name`	varchar(10) not	NULL
);

DROP TABLE IF EXISTS `board`;

CREATE TABLE `board` (
	`bo_num`	int	PRIMARY KEY auto_increment,
	`bo_name`	varchar(30) not	NULL,
	`bo_co_num`	int	NOT NULL
);

DROP TABLE IF EXISTS `post`;

CREATE TABLE `post` (
	`po_num`	int	PRIMARY KEY auto_increment,
	`po_date`	datetime not	NULL,
	`po_title`	varchar(50) not	NULL,
	`po_content`	text not	NULL,
	`po_view`	int not	NULL default 0,
	`po_bo_num`	int	NOT NULL,
	`po_me_id`	varchar(20)	NOT NULL,
	`po_pt_num`	int	NOT NULL
);

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
	`cm_num`	int	PRIMARY KEY auto_increment,
	`cm_content`	text not	NULL,
	`cm_date`	datetime not	NULL,
	`cm_me_id`	varchar(20)	NOT NULL,
	`cm_po_num`	int	NOT NULL
);

DROP TABLE IF EXISTS `state`;

CREATE TABLE `state` (
	`st_state`	varchar(6)	PRIMARY KEY
);

DROP TABLE IF EXISTS `grade`;

CREATE TABLE `grade` (
	`gr_name`	varchar(10)	PRIMARY KEY
);

ALTER TABLE `member` ADD CONSTRAINT `FK_state_TO_member_1` FOREIGN KEY (
	`me_st_state`
)
REFERENCES `state` (
	`st_state`
);

ALTER TABLE `member` ADD CONSTRAINT `FK_grade_TO_member_1` FOREIGN KEY (
	`me_gr_name`
)
REFERENCES `grade` (
	`gr_name`
);

ALTER TABLE `board` ADD CONSTRAINT `FK_category_TO_board_1` FOREIGN KEY (
	`bo_co_num`
)
REFERENCES `category` (
	`co_num`
);

ALTER TABLE `post` ADD CONSTRAINT `FK_board_TO_post_1` FOREIGN KEY (
	`po_bo_num`
)
REFERENCES `board` (
	`bo_num`
);

ALTER TABLE `post` ADD CONSTRAINT `FK_member_TO_post_1` FOREIGN KEY (
	`po_me_id`
)
REFERENCES `member` (
	`me_id`
);

ALTER TABLE `post` ADD CONSTRAINT `FK_post_type_TO_post_1` FOREIGN KEY (
	`po_pt_num`
)
REFERENCES `post_type` (
	`pt_num`
);

ALTER TABLE `comment` ADD CONSTRAINT `FK_member_TO_comment_1` FOREIGN KEY (
	`cm_me_id`
)
REFERENCES `member` (
	`me_id`
);

ALTER TABLE `comment` ADD CONSTRAINT `FK_post_TO_comment_1` FOREIGN KEY (
	`cmcomment_po_num`
)
REFERENCES `post` (
	`po_num`
);