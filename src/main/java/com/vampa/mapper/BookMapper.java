package com.vampa.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.vampa.model.BookVO;
import com.vampa.model.CateFilterDTO;
import com.vampa.model.CateVO;
import com.vampa.model.Criteria;
import com.vampa.model.SelectDTO;

@Mapper
public interface BookMapper {
	/* 상품 검색 결과 */
	public List<BookVO> getGoodsList(Criteria cri);
	
	/* 상품 총 갯수(페이징 데이터) */
	public int goodsGetTotal(Criteria cri);
	
	/* 작가 id 리스트 요청 */
	public String[] getAuthorIdList(String keyword);
	
	/* 국내 카테고리 리스트 */
	public List<CateVO> getCateCode1();
	
	/* 국외 카테고리 리스트 */
	public List<CateVO> getCateCode2();
	
	/* 검색 대상 카테고리 리스트 */
	//cateCode를 String배열에 담아서 반환함.
	public String[] getCateList(Criteria cri);
	
	/* 카테고리 정보(+검색대상 갯수) */
	//CateFilterDTO : 카테고리 이름,카테고리 코드,개수 정보가 담길 수 있다.
	public CateFilterDTO getCateInfo(Criteria cri);
	
	/* 상품 정보 */
	public BookVO getGoodsInfo(int bookId);
	
	/* 상품 id 이름 */
	//view에서 넘어오는 bookId를 조건으로, bookName,bookId값이 담긴 BookVO객체를 리턴
	public BookVO getBookIdName(int bookId);
	
	/* 메인페이지의 평점 순 상품 정보 */
	public List<SelectDTO> likeSelect();
}