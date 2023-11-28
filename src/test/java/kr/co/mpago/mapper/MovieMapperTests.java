package kr.co.mpago.mapper;


import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;

import kr.co.mpago.domain.Movie;
import kr.co.mpago.util.DBUtils;
import lombok.extern.log4j.Log4j;


@Log4j
public class MovieMapperTests {
	
	private SqlSessionFactory factory = DBUtils.sqlSessionFactory();
	private MovieMapper movieMapper = DBUtils.sqlSessionFactory().openSession(true).getMapper(MovieMapper.class);	

	// Mapper 연결 Test (성공)
	@Test
	public void testMapper() {
		System.out.println(movieMapper);
		log.info(movieMapper);
//		System.out.println(factory.getConfiguration());
		log.info(factory.getConfiguration());
	}
	
	// insert (성공)
	@Test
	public void testInsert() {
		Movie movie = new Movie();
		
//		movie.setMno(11L);
		movie.setTitle("Mapper Test Title");
		movie.setRunningTime(52);
		movie.setFormattedMdate("2023/10/19");
		movie.setRated("ALL");
		movie.setLanguage("ko");
		movie.setOutline("개요");
		movie.setStatus("개봉 전");
		
		log.info(movie);
		movieMapper.insertMovie(movie);
		log.info(movie);
	}

//	// mno 값 확인 + insert (성공)
//	@Test
//	public void testinsertSelectKey() {
//		Movie movie = new Movie();
//		
//		movie.setTitle("Mapper Test Title");
//		movie.setRate(4.5);
//		movie.setRunningTime(52);
//		movie.setFormattedMdate("2023/10/19");
//		movie.setRated("ALL");
//		movie.setLanguage("ko");
//		movie.setOutline("개요");
//		movie.setStatus("개봉 전");
//		
//		log.info(movie);
//		movieMapper.insertSelectKey(movie);
//		log.info(movie);
//	}

	// 단일조회 test (성공)
	@Test
	public void testSelect() {
		movieMapper.selectMovie(11L);
		log.info(movieMapper.selectMovie(11L));
	}
	
	// 단일삭제 test (성공)
	@Test
	public void testDelete() {
		testSelect();
		movieMapper.deleteMovie(11L);
		log.info(movieMapper.deleteMovie(11L));
		testSelect();
	}
	
	// 단일변경 test (성공)
	@Test
	public void testUpdate() {
		Movie movie = movieMapper.selectMovie(12L);
		movie.setTitle("테스트 제목 또변경");
		movie.setFormattedMdate("2023/10/16");
		
		movieMapper.updateMovie(movie);
		log.info(movie);
		
		movie = movieMapper.selectMovie(3L);
		log.info(movie);
	}
	
	// 전체조회 (성공)
	@Test
	public void testselectList() {
		movieMapper.selectMovieList().forEach(movie -> log.info(movie));
	}
	
	// 언어 입력하면 그 언어의 List가 나옴 test(성공)
	@Test
	public void testselectListByLanguage() {
		movieMapper.selectMovieListByLanguage("ko").forEach(movie -> log.info(movie));
	}
	
	// 갯수 조회 (성공)
	@Test
	public void testselectTotal() {
		int t = movieMapper.selectMovieTotal();
		log.info(t);
	}
	
	@Test
	public void testselectTitle() {
		movieMapper.selectMovieTitle(5l);
	}
	
	// 만들어야 할 것 : 카테고리별 조회
	// 언어, 장르, 연도, 별점, 런타임 등
	
	// 헤더 검색
	@Test
	public void testSearch() {
		List<Movie> list = movieMapper.searchMoviMain("가위손"); 
		log.info(list);
	}
	@Test
	public void testSearchMovi() {
		List<Movie> list = movieMapper.searchMoviList("가위손");
		log.info(list);
	}
	
	@Test
	public void testSelectIndexListMovie() {
		movieMapper.selectIndexMovieList();
	}
}
