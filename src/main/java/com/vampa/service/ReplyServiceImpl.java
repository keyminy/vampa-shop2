package com.vampa.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vampa.mapper.ReplyMapper;
import com.vampa.model.ReplyDTO;

@Service
public class ReplyServiceImpl implements ReplyService{

	@Autowired
	private ReplyMapper replyMapper;
	
	@Override
	public int enrollReply(ReplyDTO dto) {
		int result = replyMapper.enrollReply(dto);
		return result;
	}
}
