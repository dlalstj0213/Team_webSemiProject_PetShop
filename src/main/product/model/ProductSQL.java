package main.product.model;

class ProductSQL {
	static final String LIST = "select * from( select * from PRODUCT order by PRODUCT_CODE desc) where ROWNUM <= 3";
	static final String DETAIL = "select * from PRODUCT where PRODUCT_CODE=?";
	static final String COUNT = "select COUNT(PRODUCT_CODE) from PRODUCT";
	static final String PAGE = "select * from (select ROWNUM rnum, aa.* from (select * from PRODUCT order by PRODUCT_CODE desc) aa) where rnum>? and rnum<=?";
}
