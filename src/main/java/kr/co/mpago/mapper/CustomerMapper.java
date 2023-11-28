package kr.co.mpago.mapper;

import java.util.List;

import kr.co.mpago.domain.Notice;

public interface CustomerMapper {
    
    // 공지사항 목록 조회
    List<Notice> getList();
    
    // 공지사항 단일 조회
    Notice get(Long bno);
        
    // 공지사항 수정
    void modify(Notice notice);
    
    // 공지사항 삭제
    Long delete(Long bno);
    // 공지사항 등록
	int insert(Notice notice);

    
}