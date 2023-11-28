package kr.co.mpago.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.co.mpago.domain.Board;
import kr.co.mpago.domain.Criteria;

public interface BoardMapper {
	// 목록 조회
	List<Board> getList();
	
	// 페이지 처리
	List<Board> getListWithPaging(Criteria criteria);
	
	// 단일 조회
	Board get(Long bno);
	
	// 카테고리 목록 조회
	List<Board> categoryList(Long bate);
	
	// 등록
	int insert(Board board);
	
	// 수정
	boolean modify(Board board);
	
	// 삭제
	boolean delete(Long bno);
	
	// 게시글 총 갯수
	int getTotal(Criteria criteria);
	
	// 댓글 총 갯수
	void updateReplyCnt(@Param("bno") Long bno, @Param("amount") int amount);
}