package kr.co.mpago.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import kr.co.mpago.domain.MovieCast;

public interface MovieCastMapper {	
	
	// 테스트 완료 
	void insertMovieCastMapping(MovieCast movieCast); // 영화배우 Mapping 추가
	int deleteMovieCastMapping(Long mcno); // 영화배우 Mapping 삭제
	int updateMovieCastMapping(MovieCast movieCast); // 영화배우 Mapping 갱신
	List<Map<String, Object>> selectCastListByMovie(Long mno); // 특정 영화의 배우 조회
	List<MovieCast> selectListByMovie(Long mno); // Mno번 영화의 <List> 조회 
	List<Map<String, Object>> selectMovieListByCast(Long castno); // 특정 배우의 영화 조회
	List<MovieCast> selectListByCast(Long castno); // Castno번 배우<List> 조회 
	
	// 영화 상세보기 페이지에서 사용할 배우 8명 조회
	List<Map<String, Object>> selectMovieOneToEightCastList(Long mno); 
	
	// 배우 리스트에서 사용할 배우 & 비 배우 타입별 조회
	List<Map<String, Object>> selectMovieCastListByType(@Param("mno") Long mno, @Param("casttype") String casttype); 
	
	// 배우 리스트에서 사용할 배우 인원 수
	int selectActingListCount(Long mno);
	
	// 배우 리스트에서 사용할 비 배우 인원 수
	int selectNotActingListCount(Long mno);
	
	List<String> selectCasttypes();
	
	int deleteDistinctMovieCastData(); // 중복된 영화-배우 삭제
	
}
