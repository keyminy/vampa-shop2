package com.vampa.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vampa.mapper.ReplyMapper;
import com.vampa.model.Criteria;
import com.vampa.model.PageDTO;
import com.vampa.model.ReplyDTO;
import com.vampa.model.ReplyPageDTO;
import com.vampa.model.UpdateReplyDTO;

@Service
public class ReplyServiceImpl implements ReplyService{

	@Autowired
	private ReplyMapper replyMapper;
	
	@Override
	public int enrollReply(ReplyDTO dto) {
		int result = replyMapper.enrollReply(dto);
		setRating(dto.getBookId());
		return result;
	}

	@Override
	public String checkReply(ReplyDTO dto) {
		Integer result = replyMapper.checkReply(dto);
		if(result == null) {
			return "0";
		}else {
			return "1";
		}
	}

	@Override
	public ReplyPageDTO replyList(Criteria cri) {
		///1.페이징된 댓글 정보와
		//2.페이지 총 갯수구하는 쿼리 필요
		ReplyPageDTO dto = new ReplyPageDTO();
		dto.setList(replyMapper.getReplyList(cri));
		dto.setPageInfo(new PageDTO(cri,replyMapper.getReplyTotal(cri.getBookId())));
		return dto;
	}

	@Override
	public int updateReply(ReplyDTO dto) {
		int result = replyMapper.updateReply(dto);
		setRating(dto.getBookId());
		return result;
	}

	@Override
	public ReplyDTO getUpdateReply(int replyId) {
		return replyMapper.getUpdateReply(replyId);
	}
	
	@Override
	public int deleteReply(ReplyDTO dto) {
		int result = replyMapper.deleteReply(dto.getReplyId()); 
		setRating(dto.getBookId());
		return result;
	}
	
	public void setRating(int bookId) {
		//	select avg(rating) from vam_reply where bookId
		//상품의 평점 평균값 구하기
		Double ratingAvg = replyMapper.getRatingAverage(bookId);
		
		if(ratingAvg == null) {
			ratingAvg = 0.0;
		}
		//평균값의 소수점 첫째 자리까지 표시
		ratingAvg = (double) (Math.round(ratingAvg*10));
		ratingAvg = ratingAvg / 10;
		
		UpdateReplyDTO urd = new UpdateReplyDTO();
		urd.setBookId(bookId);
		urd.setRatingAvg(ratingAvg);
		//vam_book 테이블에 평점 평균 반영
		replyMapper.updateRating(urd);
	}
}
