drop sequence ORDER_DETAIL_SEQ;
drop sequence CART_SEQ;
drop sequence BOARD_SEQ;
purge recyclebin;

--주문번호 seq--
create sequence ORDER_DETAIL_SEQ increment by 1 minvalue 0 start with 0 nocache;
--장구코드 seq--
create sequence CART_SEQ increment by 1 minvalue 0 start with 0 nocache;
--게시판IDX seq--
create sequence BOARD_SEQ increment by 1 minvalue 0 start with 0 nocache;
