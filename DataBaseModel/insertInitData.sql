--defualt 회원 정보--
insert into MEMBER values('manager@naver.com','관리자', 'tiger','00001', '서울시 마포구 신수동', '01012345678', null);
insert into MEMBER values('test1@naver.com','test1', '1234','11112', '서울시 마포구 공덕동', '01009876543', null);
insert into MEMBER values('test2@naver.com','test2', '1234','00003', '서울시 마포구 망원동', '01001010202', null);
insert into MEMBER values('test3@naver.com','test3', '1234','00004', '서울시 마포구 신수동', '01002020101', null);

--택베업체--
insert into DELIVER_COM values(2020, '우체국', '01052135213', '11112', '서울시 마포구 신공덕동', '1111', '351-1111-1111-11', '이민서');


--제품--
insert into PRODUCT values(0001, '포펫 K50', 1290000, 20, '포메라니안, 말티즈, 요크셔테리어, 치와와 등 소형 강아지와 고양이가 넉넉하게 사용할 수 있어요. 컴팩트한 포펫 K50를 당신의 반려견에게 선물하세요.');
insert into PRODUCT values(0002, '포펫 K100', 1690000, 20, '2~3마리 이상의 다견, 다묘가정에서 사용하세요. 비숑, 시츄, 푸들 등 8kg 내외 강아지와 고양이가 넉넉하게 사용할 수 있어요. 포펫 K100, 당신의 반려견에게 선물하세요.');
insert into PRODUCT values(0003, '포펫 K200', 1590000, 20, '프렌치불독, 슈나우저, 코카스파니엘, 시바, 웰시코기 등 15kg 전후의 중형견 아이들이 넉넉하게 사용할 수 있어요. 포펫 K200을 당신의 반려견에게 선물하세요.');
insert into PRODUCT values(0004, '포펫 K300', 2690000, 20, '웰시코기, 닥스훈트, 코카스파니엘, 시바, 베들링턴테리어 등 체장이 긴 중형견 아이들이 넉넉하게 사용할 수 있어요. 포펫 K300을 당신의 반려견에게 선물하세요.');
insert into PRODUCT values(0005, '포펫 W400', 3190000, 20, '애견 카페나 병원, 또는 35kg 이내의 대형견을 반려하는 가정에서 편하게 사용할 수 있는 도어 타입의 포펫 W400. 당신의 반려견에게 선물하세요.');

--배송--
insert into DELIVER values(0001, 2020, 2000, SYSDATE+1);

--주문--
insert into ORDER_DETAIL values(ORDER_DETAIL_SEQ.nextval, 'test3@naver.com', 1, 0001, SYSDATE, '서울시 마포구 신수동', '01002020101', '신용카드', 1, 1290000, 0, null, 'B');
insert into ORDER_DETAIL values(ORDER_DETAIL_SEQ.nextval, 'test3@naver.com', 1, 0002, SYSDATE, '서울시 마포구 신수동', '01002020101', '신용카드', 2, 3380000, 0, null, 'B');
insert into ORDER_DETAIL values(ORDER_DETAIL_SEQ.nextval, 'test3@naver.com', 1, 0003, SYSDATE, '서울시 마포구 신수동', '01002020101', '신용카드', 1, 1590000, 0, null, 'B');

--장바구니--
insert into CART values(CART_SEQ.nextval, 'test1@naver.com', 0001, 1);
insert into CART values(CART_SEQ.nextval, 'test1@naver.com', 0002, 1);
insert into CART values(CART_SEQ.nextval, 'test1@naver.com', 0003, 1);
insert into CART values(CART_SEQ.nextval, 'test1@naver.com', 0003, 1);
insert into CART values(CART_SEQ.nextval, 'test1@naver.com', 0003, 1);
insert into CART values(CART_SEQ.nextval, 'test2@naver.com', 0001, 1);

--게시판--
insert into BOARD values(BOARD_SEQ.nextval, '관리자' , 'server@naver.com', '공지사항', '안녕하십니까? 댕댕아 너가 골라 대표 김민희입니다.' , SYSDATE, 0, null, null, 0 );
insert into BOARD values(BOARD_SEQ.nextval, 'test1' , 'test1@naver.com', '포펫K50대박', '와 진짜 저희 루리가 너무 좋아해요ㅠㅠㅠ 근데 나올라고하질 않아요..' , SYSDATE, 0, null, null, 0);
insert into BOARD values(BOARD_SEQ.nextval, 'test2' , 'test2@naver.com', 'K100후기', '아 매일 퇴근 후 애기 산책하고 샤워 후에 말리기 너무 힘들고 지쳤는데 K100 구매하고 너무 편하게 말릴 수 있어서 너무 편하고 좋네요 진작 살걸그랬어요' , SYSDATE, 0, null,null, 0);
insert into BOARD values(BOARD_SEQ.nextval, 'test3' , 'test3@naver.com', '포펫K50구매', '진짜 견생템이다 진짜 대박 너무 좋아요 ㅠㅠㅠ' , SYSDATE, 0, null,null, 0);
insert into BOARD values(BOARD_SEQ.nextval, 'test4' , 'test4@naver.com', '포펫K200', '진짜 너무 편해요 말릴때마다 전쟁치룬듯 진이 다빠졌는데 200주문하고 나니까 너무 좋아요' , SYSDATE, 0, null,null, 0);
insert into BOARD values(BOARD_SEQ.nextval, 'test5' , 'test5@naver.com', '포펫400', '안녕하십니까? 댕댕아 너가 골라 대표 김민희입니다.' , SYSDATE, 0, null,null, 0);
insert into BOARD values(BOARD_SEQ.nextval, '관리자' , 'server@naver.com', '공지사항', '안녕하십니까? 댕댕아 너가 골라 대표 김민희입니다.' , SYSDATE, 0, null, null, 0 );
insert into BOARD values(BOARD_SEQ.nextval, '관리자' , 'server@naver.com', '공지사항', '안녕하십니까? 댕댕아 너가 골라 대표 김민희입니다.' , SYSDATE, 0, null, null, 0 );
insert into BOARD values(BOARD_SEQ.nextval, 'test1' , 'test1@naver.com', '포펫K50대박', '와 진짜 저희 루리가 너무 좋아해요ㅠㅠㅠ 근데 나올라고하질 않아요..' , SYSDATE, 0, null, null, 0);
insert into BOARD values(BOARD_SEQ.nextval, 'test2' , 'test2@naver.com', 'K100후기', '아 매일 퇴근 후 애기 산책하고 샤워 후에 말리기 너무 힘들고 지쳤는데 K100 구매하고 너무 편하게 말릴 수 있어서 너무 편하고 좋네요 진작 살걸그랬어요' , SYSDATE, 0, null,null, 0);
insert into BOARD values(BOARD_SEQ.nextval, 'test3' , 'test3@naver.com', '포펫K50구매', '진짜 견생템이다 진짜 대박 너무 좋아요 ㅠㅠㅠ' , SYSDATE, 0, null,null, 0);
insert into BOARD values(BOARD_SEQ.nextval, 'test4' , 'test4@naver.com', '포펫K200', '진짜 너무 편해요 말릴때마다 전쟁치룬듯 진이 다빠졌는데 200주문하고 나니까 너무 좋아요' , SYSDATE, 0, null,null, 0);
insert into BOARD values(BOARD_SEQ.nextval, 'test5' , 'test5@naver.com', '포펫400', '안녕하십니까? 댕댕아 너가 골라 대표 김민희입니다.' , SYSDATE, 0, null,null, 0);
insert into BOARD values(BOARD_SEQ.nextval, '관리자' , 'server@naver.com', '공지사항', '안녕하십니까? 댕댕아 너가 골라 대표 김민희입니다.' , SYSDATE, 0, null, null, 0 );
insert into BOARD values(BOARD_SEQ.nextval, '관리자' , 'server@naver.com', '공지사항', '안녕하십니까? 댕댕아 너가 골라 대표 김민희입니다.' , SYSDATE, 0, null, null, 0 );
insert into BOARD values(BOARD_SEQ.nextval, 'test1' , 'test1@naver.com', '포펫K50대박', '와 진짜 저희 루리가 너무 좋아해요ㅠㅠㅠ 근데 나올라고하질 않아요..' , SYSDATE, 0, null, null, 0);
insert into BOARD values(BOARD_SEQ.nextval, 'test2' , 'test2@naver.com', 'K100후기', '아 매일 퇴근 후 애기 산책하고 샤워 후에 말리기 너무 힘들고 지쳤는데 K100 구매하고 너무 편하게 말릴 수 있어서 너무 편하고 좋네요 진작 살걸그랬어요' , SYSDATE, 0, null,null, 0);
insert into BOARD values(BOARD_SEQ.nextval, 'test3' , 'test3@naver.com', '포펫K50구매', '진짜 견생템이다 진짜 대박 너무 좋아요 ㅠㅠㅠ' , SYSDATE, 0, null,null, 0);
insert into BOARD values(BOARD_SEQ.nextval, 'test4' , 'test4@naver.com', '포펫K200', '진짜 너무 편해요 말릴때마다 전쟁치룬듯 진이 다빠졌는데 200주문하고 나니까 너무 좋아요' , SYSDATE, 0, null,null, 0);
insert into BOARD values(BOARD_SEQ.nextval, 'test5' , 'test5@naver.com', '포펫400', '안녕하십니까? 댕댕아 너가 골라 대표 김민희입니다.' , SYSDATE, 0, null,null, 0);
insert into BOARD values(BOARD_SEQ.nextval, '관리자' , 'server@naver.com', '공지사항', '안녕하십니까? 댕댕아 너가 골라 대표 김민희입니다.' , SYSDATE, 0, null, null, 0 );
insert into BOARD values(BOARD_SEQ.nextval, '관리자' , 'server@naver.com', '공지사항', '안녕하십니까? 댕댕아 너가 골라 대표 김민희입니다.' , SYSDATE, 0, null, null, 0 );
insert into BOARD values(BOARD_SEQ.nextval, 'test1' , 'test1@naver.com', '포펫K50대박', '와 진짜 저희 루리가 너무 좋아해요ㅠㅠㅠ 근데 나올라고하질 않아요..' , SYSDATE, 0, null, null, 0);
insert into BOARD values(BOARD_SEQ.nextval, 'test2' , 'test2@naver.com', 'K100후기', '아 매일 퇴근 후 애기 산책하고 샤워 후에 말리기 너무 힘들고 지쳤는데 K100 구매하고 너무 편하게 말릴 수 있어서 너무 편하고 좋네요 진작 살걸그랬어요' , SYSDATE, 0, null,null, 0);
insert into BOARD values(BOARD_SEQ.nextval, 'test3' , 'test3@naver.com', '포펫K50구매', '진짜 견생템이다 진짜 대박 너무 좋아요 ㅠㅠㅠ' , SYSDATE, 0, null,null, 0);
insert into BOARD values(BOARD_SEQ.nextval, 'test4' , 'test4@naver.com', '포펫K200', '진짜 너무 편해요 말릴때마다 전쟁치룬듯 진이 다빠졌는데 200주문하고 나니까 너무 좋아요' , SYSDATE, 0, null,null, 0);
insert into BOARD values(BOARD_SEQ.nextval, 'test5' , 'test5@naver.com', '포펫400', '안녕하십니까? 댕댕아 너가 골라 대표 김민희입니다.' , SYSDATE, 0, null,null, 0);
insert into BOARD values(BOARD_SEQ.nextval, '관리자' , 'server@naver.com', '공지사항', '안녕하십니까? 댕댕아 너가 골라 대표 김민희입니다.' , SYSDATE, 0, null, null, 0 );
insert into BOARD values(BOARD_SEQ.nextval, '관리자' , 'server@naver.com', '공지사항', '안녕하십니까? 댕댕아 너가 골라 대표 김민희입니다.' , SYSDATE, 0, null, null, 0 );
insert into BOARD values(BOARD_SEQ.nextval, 'test1' , 'test1@naver.com', '포펫K50대박', '와 진짜 저희 루리가 너무 좋아해요ㅠㅠㅠ 근데 나올라고하질 않아요..' , SYSDATE, 0, null, null, 0);
insert into BOARD values(BOARD_SEQ.nextval, 'test2' , 'test2@naver.com', 'K100후기', '아 매일 퇴근 후 애기 산책하고 샤워 후에 말리기 너무 힘들고 지쳤는데 K100 구매하고 너무 편하게 말릴 수 있어서 너무 편하고 좋네요 진작 살걸그랬어요' , SYSDATE, 0, null,null, 0);
insert into BOARD values(BOARD_SEQ.nextval, 'test3' , 'test3@naver.com', '포펫K50구매', '진짜 견생템이다 진짜 대박 너무 좋아요 ㅠㅠㅠ' , SYSDATE, 0, null,null, 0);
insert into BOARD values(BOARD_SEQ.nextval, 'test4' , 'test4@naver.com', '포펫K200', '진짜 너무 편해요 말릴때마다 전쟁치룬듯 진이 다빠졌는데 200주문하고 나니까 너무 좋아요' , SYSDATE, 0, null,null, 0);
insert into BOARD values(BOARD_SEQ.nextval, 'test5' , 'test5@naver.com', '포펫400', '안녕하십니까? 댕댕아 너가 골라 대표 김민희입니다.' , SYSDATE, 0, null,null, 0);
insert into BOARD values(BOARD_SEQ.nextval, '관리자' , 'server@naver.com', '공지사항', '안녕하십니까? 댕댕아 너가 골라 대표 김민희입니다.' , SYSDATE, 0, null, null, 0 );
insert into BOARD values(BOARD_SEQ.nextval, '관리자' , 'server@naver.com', '공지사항', '안녕하십니까? 댕댕아 너가 골라 대표 김민희입니다.' , SYSDATE, 0, null, null, 0 );
insert into BOARD values(BOARD_SEQ.nextval, 'test1' , 'test1@naver.com', '포펫K50대박', '와 진짜 저희 루리가 너무 좋아해요ㅠㅠㅠ 근데 나올라고하질 않아요..' , SYSDATE, 0, null, null, 0);
insert into BOARD values(BOARD_SEQ.nextval, 'test2' , 'test2@naver.com', 'K100후기', '아 매일 퇴근 후 애기 산책하고 샤워 후에 말리기 너무 힘들고 지쳤는데 K100 구매하고 너무 편하게 말릴 수 있어서 너무 편하고 좋네요 진작 살걸그랬어요' , SYSDATE, 0, null,null, 0);
insert into BOARD values(BOARD_SEQ.nextval, 'test3' , 'test3@naver.com', '포펫K50구매', '진짜 견생템이다 진짜 대박 너무 좋아요 ㅠㅠㅠ' , SYSDATE, 0, null,null, 0);
insert into BOARD values(BOARD_SEQ.nextval, 'test4' , 'test4@naver.com', '포펫K200', '진짜 너무 편해요 말릴때마다 전쟁치룬듯 진이 다빠졌는데 200주문하고 나니까 너무 좋아요' , SYSDATE, 0, null,null, 0);
insert into BOARD values(BOARD_SEQ.nextval, 'test5' , 'test5@naver.com', '포펫400', '안녕하십니까? 댕댕아 너가 골라 대표 김민희입니다.' , SYSDATE, 0, null,null, 0);
insert into BOARD values(BOARD_SEQ.nextval, '관리자' , 'server@naver.com', '공지사항', '안녕하십니까? 댕댕아 너가 골라 대표 김민희입니다.' , SYSDATE, 0, null, null, 0 );
insert into BOARD values(BOARD_SEQ.nextval, '관리자' , 'server@naver.com', '공지사항', '안녕하십니까? 댕댕아 너가 골라 대표 김민희입니다.' , SYSDATE, 0, null, null, 0 );
insert into BOARD values(BOARD_SEQ.nextval, 'test1' , 'test1@naver.com', '포펫K50대박', '와 진짜 저희 루리가 너무 좋아해요ㅠㅠㅠ 근데 나올라고하질 않아요..' , SYSDATE, 0, null, null, 0);
insert into BOARD values(BOARD_SEQ.nextval, 'test2' , 'test2@naver.com', 'K100후기', '아 매일 퇴근 후 애기 산책하고 샤워 후에 말리기 너무 힘들고 지쳤는데 K100 구매하고 너무 편하게 말릴 수 있어서 너무 편하고 좋네요 진작 살걸그랬어요' , SYSDATE, 0, null,null, 0);
insert into BOARD values(BOARD_SEQ.nextval, 'test3' , 'test3@naver.com', '포펫K50구매', '진짜 견생템이다 진짜 대박 너무 좋아요 ㅠㅠㅠ' , SYSDATE, 0, null,null, 0);
insert into BOARD values(BOARD_SEQ.nextval, 'test4' , 'test4@naver.com', '포펫K200', '진짜 너무 편해요 말릴때마다 전쟁치룬듯 진이 다빠졌는데 200주문하고 나니까 너무 좋아요' , SYSDATE, 0, null,null, 0);
insert into BOARD values(BOARD_SEQ.nextval, 'test5' , 'test5@naver.com', '포펫400', '안녕하십니까? 댕댕아 너가 골라 대표 김민희입니다.' , SYSDATE, 0, null,null, 0);
insert into BOARD values(BOARD_SEQ.nextval, '관리자' , 'server@naver.com', '공지사항', '안녕하십니까? 댕댕아 너가 골라 대표 김민희입니다.' , SYSDATE, 0, null, null, 0 );
insert into BOARD values(BOARD_SEQ.nextval, '관리자' , 'server@naver.com', '공지사항', '안녕하십니까? 댕댕아 너가 골라 대표 김민희입니다.' , SYSDATE, 0, null, null, 0 );
insert into BOARD values(BOARD_SEQ.nextval, 'test1' , 'test1@naver.com', '포펫K50대박', '와 진짜 저희 루리가 너무 좋아해요ㅠㅠㅠ 근데 나올라고하질 않아요..' , SYSDATE, 0, null, null, 0);
insert into BOARD values(BOARD_SEQ.nextval, 'test2' , 'test2@naver.com', 'K100후기', '아 매일 퇴근 후 애기 산책하고 샤워 후에 말리기 너무 힘들고 지쳤는데 K100 구매하고 너무 편하게 말릴 수 있어서 너무 편하고 좋네요 진작 살걸그랬어요' , SYSDATE, 0, null,null, 0);
insert into BOARD values(BOARD_SEQ.nextval, 'test3' , 'test3@naver.com', '포펫K50구매', '진짜 견생템이다 진짜 대박 너무 좋아요 ㅠㅠㅠ' , SYSDATE, 0, null,null, 0);
insert into BOARD values(BOARD_SEQ.nextval, 'test4' , 'test4@naver.com', '포펫K200', '진짜 너무 편해요 말릴때마다 전쟁치룬듯 진이 다빠졌는데 200주문하고 나니까 너무 좋아요' , SYSDATE, 0, null,null, 0);
insert into BOARD values(BOARD_SEQ.nextval, 'test5' , 'test5@naver.com', '포펫400', '안녕하십니까? 댕댕아 너가 골라 대표 김민희입니다.' , SYSDATE, 0, null,null, 0);
insert into BOARD values(BOARD_SEQ.nextval, '관리자' , 'server@naver.com', '공지사항', '안녕하십니까? 댕댕아 너가 골라 대표 김민희입니다.' , SYSDATE, 0, null, null, 0 );
insert into BOARD values(BOARD_SEQ.nextval, '관리자' , 'server@naver.com', '공지사항', '안녕하십니까? 댕댕아 너가 골라 대표 김민희입니다.' , SYSDATE, 0, null, null, 0 );
insert into BOARD values(BOARD_SEQ.nextval, 'test1' , 'test1@naver.com', '포펫K50대박', '와 진짜 저희 루리가 너무 좋아해요ㅠㅠㅠ 근데 나올라고하질 않아요..' , SYSDATE, 0, null, null, 0);
insert into BOARD values(BOARD_SEQ.nextval, 'test2' , 'test2@naver.com', 'K100후기', '아 매일 퇴근 후 애기 산책하고 샤워 후에 말리기 너무 힘들고 지쳤는데 K100 구매하고 너무 편하게 말릴 수 있어서 너무 편하고 좋네요 진작 살걸그랬어요' , SYSDATE, 0, null,null, 0);
insert into BOARD values(BOARD_SEQ.nextval, 'test3' , 'test3@naver.com', '포펫K50구매', '진짜 견생템이다 진짜 대박 너무 좋아요 ㅠㅠㅠ' , SYSDATE, 0, null,null, 0);
insert into BOARD values(BOARD_SEQ.nextval, 'test4' , 'test4@naver.com', '포펫K200', '진짜 너무 편해요 말릴때마다 전쟁치룬듯 진이 다빠졌는데 200주문하고 나니까 너무 좋아요' , SYSDATE, 0, null,null, 0);
insert into BOARD values(BOARD_SEQ.nextval, 'test5' , 'test5@naver.com', '포펫400', '안녕하십니까? 댕댕아 너가 골라 대표 김민희입니다.' , SYSDATE, 0, null,null, 0);
insert into BOARD values(BOARD_SEQ.nextval, '관리자' , 'server@naver.com', '공지사항', '안녕하십니까? 댕댕아 너가 골라 대표 김민희입니다.' , SYSDATE, 0, null, null, 0 );
insert into BOARD values(BOARD_SEQ.nextval, '관리자' , 'server@naver.com', '공지사항', '안녕하십니까? 댕댕아 너가 골라 대표 김민희입니다.' , SYSDATE, 0, null, null, 0 );
insert into BOARD values(BOARD_SEQ.nextval, 'test1' , 'test1@naver.com', '포펫K50대박', '와 진짜 저희 루리가 너무 좋아해요ㅠㅠㅠ 근데 나올라고하질 않아요..' , SYSDATE, 0, null, null, 0);
insert into BOARD values(BOARD_SEQ.nextval, 'test2' , 'test2@naver.com', 'K100후기', '아 매일 퇴근 후 애기 산책하고 샤워 후에 말리기 너무 힘들고 지쳤는데 K100 구매하고 너무 편하게 말릴 수 있어서 너무 편하고 좋네요 진작 살걸그랬어요' , SYSDATE, 0, null,null, 0);
insert into BOARD values(BOARD_SEQ.nextval, 'test3' , 'test3@naver.com', '포펫K50구매', '진짜 견생템이다 진짜 대박 너무 좋아요 ㅠㅠㅠ' , SYSDATE, 0, null,null, 0);
insert into BOARD values(BOARD_SEQ.nextval, 'test4' , 'test4@naver.com', '포펫K200', '진짜 너무 편해요 말릴때마다 전쟁치룬듯 진이 다빠졌는데 200주문하고 나니까 너무 좋아요' , SYSDATE, 0, null,null, 0);
insert into BOARD values(BOARD_SEQ.nextval, 'test5' , 'test5@naver.com', '포펫400', '안녕하십니까? 댕댕아 너가 골라 대표 김민희입니다.' , SYSDATE, 0, null,null, 0);
insert into BOARD values(BOARD_SEQ.nextval, '관리자' , 'server@naver.com', '공지사항', '안녕하십니까? 댕댕아 너가 골라 대표 김민희입니다.' , SYSDATE, 0, null, null, 0 );
insert into BOARD values(BOARD_SEQ.nextval, '관리자' , 'server@naver.com', '공지사항', '안녕하십니까? 댕댕아 너가 골라 대표 김민희입니다.' , SYSDATE, 0, null, null, 0 );
insert into BOARD values(BOARD_SEQ.nextval, 'test1' , 'test1@naver.com', '포펫K50대박', '와 진짜 저희 루리가 너무 좋아해요ㅠㅠㅠ 근데 나올라고하질 않아요..' , SYSDATE, 0, null, null, 0);
insert into BOARD values(BOARD_SEQ.nextval, 'test2' , 'test2@naver.com', 'K100후기', '아 매일 퇴근 후 애기 산책하고 샤워 후에 말리기 너무 힘들고 지쳤는데 K100 구매하고 너무 편하게 말릴 수 있어서 너무 편하고 좋네요 진작 살걸그랬어요' , SYSDATE, 0, null,null, 0);
insert into BOARD values(BOARD_SEQ.nextval, 'test3' , 'test3@naver.com', '포펫K50구매', '진짜 견생템이다 진짜 대박 너무 좋아요 ㅠㅠㅠ' , SYSDATE, 0, null,null, 0);
insert into BOARD values(BOARD_SEQ.nextval, 'test4' , 'test4@naver.com', '포펫K200', '진짜 너무 편해요 말릴때마다 전쟁치룬듯 진이 다빠졌는데 200주문하고 나니까 너무 좋아요' , SYSDATE, 0, null,null, 0);
insert into BOARD values(BOARD_SEQ.nextval, 'test5' , 'test5@naver.com', '포펫400', '안녕하십니까? 댕댕아 너가 골라 대표 김민희입니다.' , SYSDATE, 0, null,null, 0);
insert into BOARD values(BOARD_SEQ.nextval, '관리자' , 'server@naver.com', '공지사항', '안녕하십니까? 댕댕아 너가 골라 대표 김민희입니다.' , SYSDATE, 0, null, null, 0 );
insert into BOARD values(BOARD_SEQ.nextval, '관리자' , 'server@naver.com', '공지사항', '안녕하십니까? 댕댕아 너가 골라 대표 김민희입니다.' , SYSDATE, 0, null, null, 0 );
insert into BOARD values(BOARD_SEQ.nextval, 'test1' , 'test1@naver.com', '포펫K50대박', '와 진짜 저희 루리가 너무 좋아해요ㅠㅠㅠ 근데 나올라고하질 않아요..' , SYSDATE, 0, null, null, 0);
insert into BOARD values(BOARD_SEQ.nextval, 'test2' , 'test2@naver.com', 'K100후기', '아 매일 퇴근 후 애기 산책하고 샤워 후에 말리기 너무 힘들고 지쳤는데 K100 구매하고 너무 편하게 말릴 수 있어서 너무 편하고 좋네요 진작 살걸그랬어요' , SYSDATE, 0, null,null, 0);
insert into BOARD values(BOARD_SEQ.nextval, 'test3' , 'test3@naver.com', '포펫K50구매', '진짜 견생템이다 진짜 대박 너무 좋아요 ㅠㅠㅠ' , SYSDATE, 0, null,null, 0);
insert into BOARD values(BOARD_SEQ.nextval, 'test4' , 'test4@naver.com', '포펫K200', '진짜 너무 편해요 말릴때마다 전쟁치룬듯 진이 다빠졌는데 200주문하고 나니까 너무 좋아요' , SYSDATE, 0, null,null, 0);
insert into BOARD values(BOARD_SEQ.nextval, 'test5' , 'test5@naver.com', '포펫400', '안녕하십니까? 댕댕아 너가 골라 대표 김민희입니다.' , SYSDATE, 0, null,null, 0);
insert into BOARD values(BOARD_SEQ.nextval, '관리자' , 'server@naver.com', '공지사항', '안녕하십니까? 댕댕아 너가 골라 대표 김민희입니다.' , SYSDATE, 0, null, null, 0 );
insert into BOARD values(BOARD_SEQ.nextval, '관리자' , 'server@naver.com', '공지사항', '안녕하십니까? 댕댕아 너가 골라 대표 김민희입니다.' , SYSDATE, 0, null, null, 0 );
insert into BOARD values(BOARD_SEQ.nextval, 'test1' , 'test1@naver.com', '포펫K50대박', '와 진짜 저희 루리가 너무 좋아해요ㅠㅠㅠ 근데 나올라고하질 않아요..' , SYSDATE, 0, null, null, 0);
insert into BOARD values(BOARD_SEQ.nextval, 'test2' , 'test2@naver.com', 'K100후기', '아 매일 퇴근 후 애기 산책하고 샤워 후에 말리기 너무 힘들고 지쳤는데 K100 구매하고 너무 편하게 말릴 수 있어서 너무 편하고 좋네요 진작 살걸그랬어요' , SYSDATE, 0, null,null, 0);
insert into BOARD values(BOARD_SEQ.nextval, 'test3' , 'test3@naver.com', '포펫K50구매', '진짜 견생템이다 진짜 대박 너무 좋아요 ㅠㅠㅠ' , SYSDATE, 0, null,null, 0);
insert into BOARD values(BOARD_SEQ.nextval, 'test4' , 'test4@naver.com', '포펫K200', '진짜 너무 편해요 말릴때마다 전쟁치룬듯 진이 다빠졌는데 200주문하고 나니까 너무 좋아요' , SYSDATE, 0, null,null, 0);
insert into BOARD values(BOARD_SEQ.nextval, 'test5' , 'test5@naver.com', '포펫400', '안녕하십니까? 댕댕아 너가 골라 대표 김민희입니다.' , SYSDATE, 0, null,null, 0);
insert into BOARD values(BOARD_SEQ.nextval, '관리자' , 'server@naver.com', '공지사항', '안녕하십니까? 댕댕아 너가 골라 대표 김민희입니다.' , SYSDATE, 0, null, null, 0 );
insert into BOARD values(BOARD_SEQ.nextval, '관리자' , 'server@naver.com', '공지사항', '안녕하십니까? 댕댕아 너가 골라 대표 김민희입니다.' , SYSDATE, 0, null, null, 0 );
insert into BOARD values(BOARD_SEQ.nextval, 'test1' , 'test1@naver.com', '포펫K50대박', '와 진짜 저희 루리가 너무 좋아해요ㅠㅠㅠ 근데 나올라고하질 않아요..' , SYSDATE, 0, null, null, 0);
insert into BOARD values(BOARD_SEQ.nextval, 'test2' , 'test2@naver.com', 'K100후기', '아 매일 퇴근 후 애기 산책하고 샤워 후에 말리기 너무 힘들고 지쳤는데 K100 구매하고 너무 편하게 말릴 수 있어서 너무 편하고 좋네요 진작 살걸그랬어요' , SYSDATE, 0, null,null, 0);
insert into BOARD values(BOARD_SEQ.nextval, 'test3' , 'test3@naver.com', '포펫K50구매', '진짜 견생템이다 진짜 대박 너무 좋아요 ㅠㅠㅠ' , SYSDATE, 0, null,null, 0);
insert into BOARD values(BOARD_SEQ.nextval, 'test4' , 'test4@naver.com', '포펫K200', '진짜 너무 편해요 말릴때마다 전쟁치룬듯 진이 다빠졌는데 200주문하고 나니까 너무 좋아요' , SYSDATE, 0, null,null, 0);
insert into BOARD values(BOARD_SEQ.nextval, 'test5' , 'test5@naver.com', '포펫400', '안녕하십니까? 댕댕아 너가 골라 대표 김민희입니다.' , SYSDATE, 0, null,null, 0);
insert into BOARD values(BOARD_SEQ.nextval, '관리자' , 'server@naver.com', '공지사항', '안녕하십니까? 댕댕아 너가 골라 대표 김민희입니다.' , SYSDATE, 0, null, null, 0 );
insert into BOARD values(BOARD_SEQ.nextval, '관리자' , 'server@naver.com', '공지사항', '안녕하십니까? 댕댕아 너가 골라 대표 김민희입니다.' , SYSDATE, 0, null, null, 0 );
insert into BOARD values(BOARD_SEQ.nextval, 'test1' , 'test1@naver.com', '포펫K50대박', '와 진짜 저희 루리가 너무 좋아해요ㅠㅠㅠ 근데 나올라고하질 않아요..' , SYSDATE, 0, null, null, 0);
insert into BOARD values(BOARD_SEQ.nextval, 'test2' , 'test2@naver.com', 'K100후기', '아 매일 퇴근 후 애기 산책하고 샤워 후에 말리기 너무 힘들고 지쳤는데 K100 구매하고 너무 편하게 말릴 수 있어서 너무 편하고 좋네요 진작 살걸그랬어요' , SYSDATE, 0, null,null, 0);
insert into BOARD values(BOARD_SEQ.nextval, 'test3' , 'test3@naver.com', '포펫K50구매', '진짜 견생템이다 진짜 대박 너무 좋아요 ㅠㅠㅠ' , SYSDATE, 0, null,null, 0);
insert into BOARD values(BOARD_SEQ.nextval, 'test4' , 'test4@naver.com', '포펫K200', '진짜 너무 편해요 말릴때마다 전쟁치룬듯 진이 다빠졌는데 200주문하고 나니까 너무 좋아요' , SYSDATE, 0, null,null, 0);
insert into BOARD values(BOARD_SEQ.nextval, 'test5' , 'test5@naver.com', '포펫400', '안녕하십니까? 댕댕아 너가 골라 대표 김민희입니다.' , SYSDATE, 0, null,null, 0);
insert into BOARD values(BOARD_SEQ.nextval, '관리자' , 'server@naver.com', '공지사항', '안녕하십니까? 댕댕아 너가 골라 대표 김민희입니다.' , SYSDATE, 0, null, null, 0 );

commit;