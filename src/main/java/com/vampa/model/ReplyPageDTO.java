package com.vampa.model;

import java.util.List;

import lombok.Data;

@Data
public class ReplyPageDTO {
	
	//페이징 된 댓글 리스트 정보
	List<ReplyDTO> list;
	
	//페이지 정보를 저장할 변수
	PageDTO pageInfo;
}
