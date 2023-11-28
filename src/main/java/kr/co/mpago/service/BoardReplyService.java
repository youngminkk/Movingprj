package kr.co.mpago.service;

import java.util.List;

import kr.co.mpago.domain.BoardReply;
import kr.co.mpago.domain.BoardReplyPageDTO;
import kr.co.mpago.domain.Criteria;
import kr.co.mpago.mapper.BoardMapper;
import kr.co.mpago.mapper.BoardReplyMapper;
import kr.co.mpago.util.DBUtils;

public class BoardReplyService {
	private static final BoardReplyService BoardReplyService = new BoardReplyService();
	private BoardReplyMapper ReplyMapper = DBUtils.sqlSessionFactory().openSession(true).getMapper(BoardReplyMapper.class); 
	private BoardMapper boardMapper = DBUtils.sqlSessionFactory().openSession(true).getMapper(BoardMapper.class); 
	private BoardReplyService() {}
	public static BoardReplyService getInstance() {
	        return BoardReplyService;
	    }
	// 목록 조회
	public List<BoardReply> getList(Criteria criteria, Long bno) {
		return ReplyMapper.getListWithPaging(criteria, bno);
	}
	
	// 
	public BoardReplyPageDTO getListWithPaging(Criteria criteria, Long bno) {
		return new BoardReplyPageDTO(ReplyMapper.getTotal(criteria, bno), ReplyMapper.getListWithPaging(criteria, bno));
	}
	
	// 단일 조회
	public BoardReply get(Long rno) {
		return ReplyMapper.get(rno);
	}
	
	// 해당 게시글의 댓글 갯수
	public int getTotal(Criteria criteria, Long bno) {
		return ReplyMapper.getTotal(criteria, bno);
	}
	
	// 댓글 작성
	public int insert(BoardReply reply) {
		boardMapper.updateReplyCnt(reply.getBno(), 1);
		return ReplyMapper.insert(reply);
	}
	
	// 댓글 수정
	public int modify(BoardReply reply) {
		return ReplyMapper.modify(reply);
	}
	
	// 댓글 삭제
	public int remove(Long rno) {
		boardMapper.updateReplyCnt(get(rno).getBno(), -1);
		return ReplyMapper.remove(rno);
	}
	
}






