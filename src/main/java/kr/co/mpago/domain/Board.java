package kr.co.mpago.domain;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Board {
	private Long bno; // 글 번호
	private Long userno; // 유저 번호
	private Long bcate; // 게시판 카테고리
	private String title; // 글 제목
	private String content; // 글 내용
	private Date regDate; // 작성 날짜
	private int replyCnt;
	private String nickname; // 유저 닉네임 사용
	
	@Builder.Default
	private final int category = 1; // 카테고리
}
