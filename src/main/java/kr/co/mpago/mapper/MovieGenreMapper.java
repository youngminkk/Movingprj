package kr.co.mpago.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import kr.co.mpago.domain.MovieGenre;

public interface MovieGenreMapper {
	
	// 테스트 완료
	void insertMovieGenreMapping(MovieGenre movieGenre); // 영화장르 Mapping 추가
	int deleteMovieGenreMapping(Long mgno); // 영화장르 Mapping 삭제
	int updateMovieGenreMapping(MovieGenre movieGenre); // 영화장르 Mapping 갱신
	List<Map<String, Object>> selectGenreListByMovie(Long mno); // 특정 영화의 장르 조회
	List<MovieGenre> selectListByMovie(Long mno); // Mno번 영화의 <List> 조회 
	List<MovieGenre> selectListByGenre(Long gno); // Gno번 장르 <List> 조회 
	
	List<Map<String, Object>> selectMovieListByGenre(@Param("gno") Long gno, @Param("language") String language); // 특정 장르 특정 언어의 영화 조회,
	
	 // gno번 장르 <List> 10개 조회
	List<MovieGenre> selectFirstTenByGenreList(Long gno); 
	
	// gno번 장르 <List> 10개 조회, 언어별
	List<Map<String,Object>> selectFirstTenByGenreListWithLanguage(@Param("gno") Long gno, @Param("language") String language); 
	
	// 페이징 처리 gno번 장르 <List> 조회
	List<MovieGenre> selectPagedMoviesByGenreList(Long gno);
	
	// gno번 장르 + 언어별 <List> 10개 조회
	List<MovieGenre> selectFirstTenByLanguageAndGenreList(Long gno, String language);
	
	// (실행X) 페이징 처리 gno번 장르 + 언어별 <List> 조회
	List<MovieGenre> selectPagedMoviesByLanguageAndGenreList(Long gno, String language);
	
	// 페이징처리 gno번 장르 + 언어별 <List> 조회
	List<MovieGenre> selectMovieListByGenreAndLanguage(@Param("gno") Long gno, @Param("language") String language, @Param("offset") int offset, @Param("amount") int amount);
    int selectTotalByGenreAndLanguage(@Param("gno") Long gno, @Param("language") String language);

    int selectTotalByGenre(@Param("gno") Long gno);
}
