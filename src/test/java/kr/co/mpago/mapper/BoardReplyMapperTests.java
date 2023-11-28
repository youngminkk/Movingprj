package kr.co.mpago.mapper;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;

import kr.co.mpago.domain.Board;
import kr.co.mpago.domain.BoardReply;
import kr.co.mpago.domain.Criteria;
import kr.co.mpago.util.DBUtils;
import lombok.extern.log4j.Log4j;

@Log4j
public class BoardReplyMapperTests {
	private SqlSessionFactory factory = DBUtils.sqlSessionFactory();
	private BoardReplyMapper mapper = DBUtils.sqlSessionFactory().openSession(true).getMapper(BoardReplyMapper.class);
	
	// 연결 테스트 (성공)
	@Test
	public void testMapper() {
		System.out.println(mapper);
		System.out.println(factory.getConfiguration());
	}
	
	// 댓글 목록 조회 테스트 (성공)
//	@Test
//	public void testGetList() {
//		mapper.getList(new Criteria(), 103L).forEach(reply->log.info(reply));
//	}
	
	// 댓글 단일 조회 테스트 (성공)
	@Test
	public void testGet() {
		BoardReply reply = mapper.get(5L);
		log.info(reply);
	}
	
	// 댓글 작성 테스트 (성공)
	@Test
	public void testInsert() {
		BoardReply reply = BoardReply.builder().bno(142L).userno(277L).comment("테스트").build();
		log.info(reply);
		int count = mapper.insert(reply);
		log.info(count);
	}
	
	// 댓글 수정 테스트 (성공)
	@Test
	public void testModify() {
		BoardReply reply = mapper.get(1L);
		reply.setComment("수정된 댓글");
		mapper.modify(reply);
	}
	
	// 댓글 삭제 테스트 (성공)
	@Test
	public void testDelete() {
		mapper.remove(41L);
	}
}












