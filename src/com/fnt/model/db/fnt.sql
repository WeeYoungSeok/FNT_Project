 SELECT * FROM ALL_TABLES WHERE OWNER = 'BIGMASTER05_SEMI';
 
--회원
DELETE FROM MEMBER;
SELECT * FROM MEMBER;
CREATE TABLE MEMBER(
   MEMBER_ID VARCHAR2(10) NOT NULL,
   MEMBER_PW VARCHAR2(16) NOT NULL,    
   MEMBER_PWCHK VARCHAR2(16) NOT NULL,
   MEMBER_NICKNAME VARCHAR2(20) NOT NULL,
   MEMBER_NAME VARCHAR2(20) NOT NULL,
   MEMBER_BIRTH DATE NOT NULL,
   MEMBER_PHONE VARCHAR2(20) NOT NULL,
   MEMBER_ADDR VARCHAR2(100) NOT NULL,
   MEMBER_EMAIL VARCHAR2(50) NOT NULL,
   --ADMIN은 관리자, USER은 회원
   MEMBER_ROLE VARCHAR2(10) NOT NULL,
   --Y는 회원, N은 탈퇴된 회원, R은 신고된 회원
   ENABLED CHAR(1) NOT NULL,
   REGDATE DATE NOT NULL,
   
   CONSTRAINT ID_MEMBER_PK PRIMARY KEY(MEMBER_ID),
   CONSTRAINT NICKNAME_MEMBER_UNQ UNIQUE(MEMBER_NICKNAME),
   CONSTRAINT PHONE_MEMBER_UNQ UNIQUE(MEMBER_PHONE),
   CONSTRAINT EMAIL_MEMBER_UNQ UNIQUE(MEMBER_EMAIL),
   --ADMIN : 관리자, USER : 일반회원
   CONSTRAINT MEMBER_ROLE_MEMBER_CHK CHECK(MEMBER_ROLE IN('ADMIN','USER')),
   --Y : 회원, N : 탈퇴한 회원, R : 신고된 회원
   CONSTRAINT ENABLED_MEMBER_CHK CHECK(ENABLED IN('Y','N','R'))
);
INSERT INTO MEMBER
VALUES('test', 'test1234', 'test1234', '문의열리네요', '김지후', SYSDATE, '010-1234-1234', '캘리포니아', 'mune@kh.com', 'USER', 'Y', SYSDATE);

--공지사항 테이블
DELETE FROM NOTICE_BOARD;

DROP TABLE NOTICE_BOARD;

DROP SEQUENCE NB_BOARDNO_SEQ;


CREATE SEQUENCE NB_BOARDNO_SEQ;


CREATE TABLE NOTICE_BOARD(
   NB_BOARDNO NUMBER NOT NULL,
   NB_ID VARCHAR2(10) NOT NULL,
   NB_NICKNAME VARCHAR2(20) NOT NULL,
   NB_TITLE VARCHAR2(50) NOT NULL,
   NB_CONTENT VARCHAR2(3000) NOT NULL,
   NB_REGDATE DATE NOT NULL,
   
   CONSTRAINT NB_BOARDNO_PK PRIMARY KEY(NB_BOARDNO),
   FOREIGN KEY(NB_ID) REFERENCES MEMBER(MEMBER_ID),
   FOREIGN KEY(NB_NICKNAME) REFERENCES MEMBER(MEMBER_NICKNAME)
);

--거래게시판 테이블
DELETE FROM DEAL_BOARD;

DROP TABLE DEAL_BOARD;

DROP SEQUENCE DB_BOARDNO_SEQ;

CREATE SEQUENCE DB_BOARDNO_SEQ;


CREATE TABLE DEAL_BOARD(
   D_BOARDNO NUMBER NOT NULL,
   D_ID VARCHAR2(10) NOT NULL,
   D_NICKNAME VARCHAR2(20) NOT NULL,
   D_TITLE VARCHAR2(50) NOT NULL,
   D_FILENAME VARCHAR2(50),
   D_CONTENT VARCHAR2(3000) NOT NULL,
   D_PRICE NUMBER NOT NULL,
   D_REGDATE DATE NOT NULL,
   D_CATEGORY CHAR(1) NOT NULL,
   D_FLAG CHAR(1) NOT NULL,
   
   CONSTRAINT DB_BOARDNO_PK PRIMARY KEY(D_BOARDNO),
   FOREIGN KEY(D_ID) REFERENCES MEMBER(MEMBER_ID),
   --F : 패션, C : 차량, D : 가전제품, A : 애완, S : 스포츠
   CONSTRAINT D_CATEGORY_DEAL_BOARD_CHK CHECK(D_CATEGORY IN('F','C','D','A','S')),
   --B : 구매, S : 판매
   CONSTRAINT D_FLAG_DEAL_BOARD_CHK CHECK(D_FLAG IN('B','S')),
   FOREIGN KEY(D_NICKNAME) REFERENCES MEMBER(MEMBER_NICKNAME)
);
-- D_LONGITUDE , D_LATITUDE VARCHAR2(20)
insert into deal_board(D_BOARDNO ,D_ID ,D_NICKNAME,D_TITLE ,D_CONTENT ,D_PRICE ,D_REGDATE ,D_CATEGORY ,D_FLAG )
values (10,'admin','회원','ㅇㅇ','ㅇㄴㅁ',2000,SYSDATE,'F','B');


--문의게시판 테이블
DELETE FROM QNA_BOARD;

DROP TABLE QNA_BOARD;

DROP SEQUENCE QB_BOARDNO_SEQ;

CREATE SEQUENCE QB_BOARDNO_SEQ;

CREATE TABLE QNA_BOARD(
   QB_BOARDNO NUMBER NOT NULL,
   QB_ID VARCHAR2(10) NOT NULL,
   QB_NICKNAME VARCHAR2(20) NOT NULL,
   QB_TITLE VARCHAR2(50) NOT NULL,
   QB_CONTENT VARCHAR2(3000) NOT NULL,
   QB_SECRET CHAR(1) NOT NULL,
   QB_FLAG CHAR(1) NOT NULL,
   QB_REGDATE DATE NOT NULL,
   QB_REDATE DATE NOT NULL,
   
   CONSTRAINT QB_BOARDNO_PK2 PRIMARY KEY(QB_BOARDNO),
   FOREIGN KEY(QB_ID) REFERENCES MEMBER(MEMBER_ID),
   FOREIGN KEY(QB_NICKNAME) REFERENCES MEMBER(MEMBER_NICKNAME),
   CONSTRAINT QB_SECRET_CHK1 CHECK(QB_SECRET IN('Y','N')),
   CONSTRAINT QB_FLAG_CHK CHECK(QB_FLAG IN('Y','N'))
);

--리플
DELETE FROM REPLY;
DROP SEQUENCE REPLY_SEQ;

DROP TABLE REPLY;

CREATE SEQUENCE REPLY_SEQ;
CREATE SEQUENCE REPLY_GROUPNO_SEQ;
CREATE TABLE REPLY(
   REPLY_NO NUMBER NOT NULL,
   REPLY_ID VARCHAR2(10) NOT NULL,
   REPLY_NICKNAME VARCHAR2(20) NOT NULL,
   REPLY_BOARDNO NUMBER NOT NULL,
   REPLY_GROUPNO NUMBER NOT NULL,
   REPLY_GROUPNOSEQ NUMBER NOT NULL,
   REPLY_TITLETAB VARCHAR2(10) NOT NULL,
   REPLY_TITLE VARCHAR2(1000) NOT NULL, --댓글 내용
   REPLY_REGDATE DATE NOT NULL,
   
   CONSTRAINT REPLY_NO_PK PRIMARY KEY(REPLY_NO),
   FOREIGN KEY(REPLY_ID) REFERENCES MEMBER(MEMBER_ID),
   FOREIGN KEY(REPLY_BOARDNO) REFERENCES DEAL_BOARD(D_BOARDNO),
   FOREIGN KEY(REPLY_NICKNAME) REFERENCES MEMBER(MEMBER_NICKNAME)
);

--신고게시판
DELETE FROM REPORT;

DROP TABLE REPORT;

DROP SEQUENCE REPORT_SEQ;

CREATE SEQUENCE REPORT_SEQ;

CREATE TABLE REPORT(
   REPORT_NO NUMBER NOT NULL,
   SEND_ID VARCHAR2(10) NOT NULL,
   -- SEND ID, RECEIVE ID 모두 MEMBER와 조인해서 NICKNAME 가져오기
   RECEIVE_ID VARCHAR2(10) NOT NULL,
   SEND_NICKNAME VARCHAR2(20) NOT NULL,
   RECEIVE_NICKNAME VARCHAR2(20) NOT NULL,
   REPORT_TITLE VARCHAR2(50) NOT NULL,
   REPORT_CONTENT VARCHAR2(3000) NOT NULL,
   REPORT_REGDATE DATE NOT NULL,
   
   CONSTRAINT RP_REPORT_NO_PK PRIMARY KEY(REPORT_NO),
   FOREIGN KEY(SEND_ID) REFERENCES MEMBER(MEMBER_ID),
   FOREIGN KEY(RECEIVE_ID) REFERENCES MEMBER(MEMBER_ID),
   FOREIGN KEY(SEND_NICKNAME) REFERENCES MEMBER(MEMBER_NICKNAME),
   FOREIGN KEY(RECEIVE_NICKNAME) REFERENCES MEMBER(MEMBER_NICKNAME)
);
INSERT INTO REPORT
VALUES(REPORT_SEQ.NEXTVAL, 'test', 'member', '문의열리네요', '회원', '거래사기', '거래사기쳤어요', SYSDATE);

--찜목록
DELETE FROM WISH_LIST;

DROP TABLE  WISH_LIST;

DROP SEQUENCE WL_NO_SEQ;

CREATE SEQUENCE WL_NO_SEQ;

CREATE TABLE WISH_LIST(
   WL_NO NUMBER NOT NULL,
   WL_ID VARCHAR2(10) NOT NULL,
   WL_SELL_NICKNAME VARCHAR2(20) NOT NULL,
   WL_BOARDNO NUMBER NOT NULL,
   
   CONSTRAINT WL_NO_PK PRIMARY KEY(WL_NO),
   FOREIGN KEY(WL_BOARDNO) REFERENCES DEAL_BOARD(D_BOARDNO),
   FOREIGN KEY(WL_ID) REFERENCES MEMBER(MEMBER_ID),
   FOREIGN KEY(WL_SELL_NICKNAME) REFERENCES MEMBER(MEMBER_NICKNAME)
);

DELETE FROM ORDER_LIST;

DROP TABLE ORDER_LIST;

DROP SEQUENCE OL_NO_SEQ;

CREATE SEQUENCE OL_NO_SEQ;

CREATE TABLE ORDER_LIST(
   OL_NO NUMBER NOT NULL,
   OL_ID VARCHAR2(10) NOT NULL,
   OL_SELL_NICKNAME VARCHAR2(20) NOT NULL,
   OL_INVOICE NUMBER,
   OL_BOARDNO NUMBER NOT NULL,
   
   CONSTRAINT OL_NO_PK PRIMARY KEY(OL_NO),
   FOREIGN KEY(OL_BOARDNO) REFERENCES DEAL_BOARD(D_BOARDNO),
   FOREIGN KEY(OL_ID) REFERENCES MEMBER(MEMBER_ID),
   FOREIGN KEY(OL_SELL_NICKNAME) REFERENCES MEMBER(MEMBER_NICKNAME)
);

--알람
DELETE FROM ALERT;

DROP TABLE ALERT;

DROP SEQUENCE ALERT_NO_SEQ;

CREATE SEQUENCE ALERT_NO_SEQ;

CREATE TABLE ALERT(
   ALERT_NO NUMBER NOT NULL,
   ALERT_ID VARCHAR2(10) NOT NULL,
   ALERT_COUNT NUMBER NOT NULL,
   ALERT_BOARDNO NUMBER NOT NULL,
    
   CONSTRAINT AT_ALERT_NO_PK PRIMARY KEY(ALERT_NO),
   FOREIGN KEY(ALERT_BOARDNO) REFERENCES DEAL_BOARD(D_BOARDNO),
   FOREIGN KEY(ALERT_ID) REFERENCES MEMBER(MEMBER_ID)
);




CREATE TABLE MAP(
	MAP_NO NUMBER NOT NULL,
	MAP_LONGITUDE NUMBER NOT NULL,
	MAP_LATITUDE NUMBER NOT NULL,
	
	CONSTRAINT MP_MAP_NO_PK PRIMARY KEY(MAP_NO),
	FOREIGN KEY(MAP_NO) REFERENCES DEAL_BOARD(D_BOARDNO)
);