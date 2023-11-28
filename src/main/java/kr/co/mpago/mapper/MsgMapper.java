package kr.co.mpago.mapper;

import java.util.List;

import kr.co.mpago.domain.Msg;


public interface MsgMapper {
	// 쪽지발송
	int insert(Msg msg);
	
	// 단일조회
	Msg read(Long msgno);
	
	// 수신목록조회
	List<Msg> getReceiList(String tonick);
	
	// 발신목록조회
	List<Msg> getSendList(String fromnick);
	
	// 쪽지삭제
	int delete(Long msgno);

	
}
