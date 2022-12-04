package com.vampa.mapper;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.TestPropertySource;

import com.vampa.model.ReplyDTO;

@SpringBootTest
@TestPropertySource(locations = "classpath:application.properties")
public class ReplyMapperTests {

	@Autowired
	private ReplyMapper replyMapper;
	
	@Test
	@DisplayName("댓글 등록 테스트")
	public void replyEnrollTest() {
		String id = "admin";
		int bookId = 95;
		double rating = 3.5;
		String content = "댓글 테스트";
		
		ReplyDTO dto = new ReplyDTO();
		dto.setBookId(bookId);
		dto.setMemberId(id);
		dto.setRating(rating);
		dto.setContent(content);
		
		replyMapper.enrollReply(dto);
	}
}
