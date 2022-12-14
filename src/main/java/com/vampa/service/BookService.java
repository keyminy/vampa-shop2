package com.vampa.service;

import java.util.List;

import com.vampa.model.BookVO;
import com.vampa.model.CateFilterDTO;
import com.vampa.model.CateVO;
import com.vampa.model.Criteria;
import com.vampa.model.SelectDTO;

public interface BookService {
	/* 상품 검색 */
	public List<BookVO> getGoodsList(Criteria cri);
	
	/* 상품 총 갯수 */
	public int goodsGetTotal(Criteria cri);
	
	/* 국내 카테고리 리스트 */
	public List<CateVO> getCateCode1();
	
	/* 외국 카테고리 리스트 */
	public List<CateVO> getCateCode2();
	
	/* 검색 결과에 대한 필터링 정보 반환 */
	public List<CateFilterDTO> getCateInfoList(Criteria cri); 
	
	/* 상품 정보 */
	public BookVO getGoodsInfo(int bookId);
	
	/* 상품 id 이름 */
	public BookVO getBookIdName(int bookId);
	
	/* 메인페이지 평점 순 상품 정보 */
	public List<SelectDTO> likeSelect();
}
