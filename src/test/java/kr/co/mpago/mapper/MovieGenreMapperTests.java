package kr.co.mpago.mapper;


import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;

import kr.co.mpago.domain.MovieGenre;
import kr.co.mpago.util.DBUtils;
import lombok.extern.log4j.Log4j;


@Log4j
public class MovieGenreMapperTests {
	
	private SqlSessionFactory factory = DBUtils.sqlSessionFactory();
	private MovieGenreMapper movieGenreMapper = DBUtils.sqlSessionFactory().openSession(true).getMapper(MovieGenreMapper.class);
	// Mapper 연결 Test (성공)
	@Test
	public void testMapper() {
		log.info(movieGenreMapper);
		log.info(factory.getConfiguration());
	}
	
	// Mapping insert (성공)
	@Test
	public void testInsert() {
		MovieGenre movieGenre = MovieGenre.builder().mno(1L).gno(6L).build();
		
		log.info(movieGenre);
		movieGenreMapper.insertMovieGenreMapping(movieGenre);
		log.info(movieGenre);
	}

	// 단일삭제 test (성공)
	@Test
	public void testDelete() {
		movieGenreMapper.deleteMovieGenreMapping(5L);
	}
	
	// 단일변경 X
	
	// 특정 영화의 장르 전체 조회	 (성공)
	@Test
	public void testSelectGenreByMovieList() {
		movieGenreMapper.selectGenreListByMovie(1L).forEach(log::info);
	}
	
	// mno번 영화의 <List> 조회 (성공)
	@Test
	public void testSelectListByMovie2() {
		movieGenreMapper.selectListByMovie(1L).forEach(log::info);
	}
	
//	// 특정 장르의 영화 전체 조회 (성공)
//	@Test
//	public void testSelectMovieByGenreList() {
//		movieGenreMapper.selectMovieListByGenre(2L).forEach(log::info);
//	}
	
	// gno번 장르의 <List> 조회 (성공)
	@Test
	public void testSelectListByGenre2() {
		movieGenreMapper.selectListByGenre(2L).forEach(log::info);
	}
	
	@Test
	public void testSelectFirstTenByGenreList() {
		Long gno = 12l;
		movieGenreMapper.selectFirstTenByGenreList(gno);		
	}
	
	@Test
	public void testselectFirstTenByGenreListWithLanguage() {
		Long gno = 12l;
		String language = "en";
		movieGenreMapper.selectFirstTenByGenreListWithLanguage(gno, language);
	}
	
}
