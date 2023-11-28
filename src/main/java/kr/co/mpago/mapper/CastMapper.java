package kr.co.mpago.mapper;

import java.util.List;

import kr.co.mpago.domain.Cast;

public interface CastMapper {
	
	// 테스트 완료
	void insertCast(Cast cast);	// 배우 추가
	void insertCastWithCastno(Cast cast);	// 배우 추가
	Cast selectCast(Long castno); // 배우 단일 선택
	int deleteCast(Long castno); // 배우 정보 삭제
	int updateCast(Cast cast); // 배우 정보 변경
	List<Cast> selectCastList(); // 배우 리스트? 필요한가?
	List<Cast> searchCastMain(String search); // 통합결과
	List<Cast> searchCastList(String search); // 배우만
}
