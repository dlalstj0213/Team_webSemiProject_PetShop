drop table MEMBER cascade constraint;
drop table DELIVER_COM cascade constraint;
drop table ORDER_DETAIL cascade constraint;
drop table PRODUCT cascade constraint;
drop table DELIVER cascade constraint;
drop table CART cascade constraint;
drop table BOARD cascade constraint;
drop table BOARD_COMMENT cascade constraint;
purge recyclebin;


create table MEMBER(
      EMAIL VARCHAR2(50) constraint MID_PK primary key,
	  NAME VARCHAR2(30) not null,
      PWD VARCHAR2(30) not null,
      POST NUMBER(5) not null,
      ADDRESS VARCHAR2(100) not null,
      PHONE VARCHAR2(20) not null,
      POINT NUMBER(20)
);


create table DELIVER_COM (
   COMP_BIZNO NUMBER(4) constraint BIZNO_PK primary key NOT NULL ,
   NAME VARCHAR2(30) NOT NULL , 
   PHONE VARCHAR2(20) NOT NULL , 
   POST VARCHAR2(5) NOT NULL, 
   ADDRESS VARCHAR2(100) NULL,
   BANKCODE NUMBER(4) NOT NULL,
   ACCOUNT_NO VARCHAR2(20),
   BANK_NAME VARCHAR(30) NOT NULL
); 

create table DELIVER (
         DELIVER_NO NUMBER(4) constraint DNO_PK primary key ,
         COMP_BIZNO NUMBER(4) constraint BIZNO_FK references DELIVER_COM(COMP_BIZNO),
         PRICE NUMBER(20) default 2000,
         DELIVER_DATE DATE
);

create table PRODUCT(
    PRODUCT_CODE NUMBER(4) constraint PCO_PK primary key ,
    NAME VARCHAR2(30),
    PRICE NUMBER(20),
    QUANTITY NUMBER(20),
    INFO VARCHAR2(2000)
);

create table ORDER_DETAIL( 
   ORDER_NO VARCHAR2(4) constraint ONO_PK primary key NOT NULL ,
   EMAIL VARCHAR2(50) constraint ORDER_MID_FK references MEMBER(EMAIL) ,
   DELIVER_NO NUMBER(4) constraint DNO_FK references DELIVER(DELIVER_NO),
   PRODUCT_CODE NUMBER(4) constraint ORDER_PNO_FK references PRODUCT(PRODUCT_CODE), 
   ORDER_DATE DATE,
   ADDRESS VARCHAR2(100), 
   PHONE VARCHAR2(20), 
   PAYCODE VARCHAR2(20),
   QUANTITY NUMBER(20),
   TOTAL_PRICE NUMBER(20),
   DISCOUNT NUMBER(20),
   MEMO VARCHAR2(4000),
   ORDER_STATE CHAR(1) CHECK (ORDER_STATE IN ('A', 'B', 'C'))
);    
--A:배송중 / B:배송완료 / C:default--

create table CART(
      CART_CODE NUMBER(4) constraint CART_CODE_PK primary key ,
      EMAIL VARCHAR2(50)constraint  MID_FK references MEMBER(EMAIL), 
      PRODUCT_CODE NUMBER(4)constraint PNO_FK references PRODUCT(PRODUCT_CODE),
	  QUANTITY NUMBER not null
);

create table BOARD(
      IDX NUMBER constraint IDX_PK primary key,
      WRITER VARCHAR2(30),
      EMAIL VARCHAR2(50),
      TITLE VARCHAR2(25),
      CONTENT VARCHAR2(4000),
      WRITEDATE DATE default SYSDATE,
      READNUM NUMBER,
      FILENAME VARCHAR2(200),
      OFILENAME VARCHAR2(200),
      FILESIZE NUMBER   
);

create table BOARD_COMMENT(
	COMMENT_IDX number primary key,
	BOARD_IDX number constraint BOARD_COMMENT_FK references BOARD(IDX) on delete cascade, 
	WRITER varchar2(30) not null,
	EMAIL varchar2(50) not null,
	WRITEDATE date,
	CONTENT varchar(2000)
);