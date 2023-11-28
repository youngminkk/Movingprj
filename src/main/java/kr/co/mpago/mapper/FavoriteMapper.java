package kr.co.mpago.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.co.mpago.domain.Favorite;


public interface FavoriteMapper {
	
	// 등록
	int insert(Favorite Favorite);
	
	// 단일 조회
	Favorite get(Long fno);
	
	// Favorite등록한 조회 
	Favorite find(Favorite Favorite);
	
	// 목록 조회
	List<Favorite> getList(Long userno);
	
	// 수정
	int update(Favorite favorite);
	
	// 삭제
	int delete(Long fno);
	
	//void delete2(@Param("userno") Long userno, @Param("mno") Long mno);
	
}
