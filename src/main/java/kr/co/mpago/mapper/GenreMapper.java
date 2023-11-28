package kr.co.mpago.mapper;

import java.util.List;

import kr.co.mpago.domain.Genre;

public interface GenreMapper {
	
	// 테스트 완료
	void insertGenre(Genre genre);	// 장르 추가
	Genre selectGenre(Long gno); // 장르 단일 선택
	int deleteGenre(Long gno); // 장르 삭제
	int updateGenre(Genre genre); // 장르 정보 변경
	List<Genre> selectGenreList(); // 장르 리스트
	List<Genre> selectGenreMain(); // 메인에서 쓸 장르 리스트
}
