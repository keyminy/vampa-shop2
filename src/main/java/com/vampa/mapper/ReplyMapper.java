package com.vampa.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.vampa.model.ReplyDTO;

@Mapper
public interface ReplyMapper {

	/* 댓글 등록 */
	public int enrollReply(ReplyDTO dto);
}
