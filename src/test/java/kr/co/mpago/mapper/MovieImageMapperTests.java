package kr.co.mpago.mapper;

import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;

import kr.co.mpago.domain.MovieImage;
import kr.co.mpago.util.DBUtils;

// 테스트 완료
public class MovieImageMapperTests {
	private SqlSessionFactory factory = DBUtils.sqlSessionFactory();
	private MovieImageMapper imageMapper = DBUtils.sqlSessionFactory().openSession(true).getMapper(MovieImageMapper.class);

	@Test
	public void testselectMovieImage() {
		imageMapper.selectMovieImage("d");
	}
	@Test
	public void testdeleteMovieImage() {
		imageMapper.deleteMovieImage("a");
	}
	@Test
	public void testdeleteallMovieImage() {
		imageMapper.deleteAllMovieImage(1l);
	}
	
	@Test
	public void testinsertMovieImage() {
		imageMapper.selectMovieImageList(3l);
	}
	@Test
	public void testinsertMovieImage2() {
		imageMapper.selectMovieImageListByImageCategory(16l, "poster");
	}
	@Test
	public void testMovieImagetotal1() {
		imageMapper.selectMovieImageTotal(3l);
	}
}
