package com.vampa.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vampa.mapper.ReplyMapper;
import com.vampa.model.Criteria;
import com.vampa.model.PageDTO;
import com.vampa.model.ReplyDTO;
import com.vampa.model.ReplyPageDTO;

@Service
public class ReplyServiceImpl implements ReplyService{

	@Autowired
	private ReplyMapper replyMapper;
	
	@Override
	public int enrollReply(ReplyDTO dto) {
		int result = replyMapper.enrollReply(dto);
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
}
