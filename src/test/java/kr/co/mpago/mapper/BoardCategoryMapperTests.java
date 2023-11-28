package kr.co.mpago.mapper;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;

import kr.co.mpago.domain.BoardCategory;
import kr.co.mpago.util.DBUtils;
import lombok.extern.log4j.Log4j;

@Log4j
public class BoardCategoryMapperTests {
	private SqlSessionFactory factory = DBUtils.sqlSessionFactory();
	private BoardCategoryMapper mapper = DBUtils.sqlSessionFactory().openSession(true).getMapper(BoardCategoryMapper.class);
	
	// 연결 테스트 (성공)
	@Test
	public void testMapper() {
		System.out.println(mapper);
		System.out.println(factory.getConfiguration());
	}
	
	// 카테고리 목록 조회
	@Test
	public void testGetList() {
		List<BoardCategory> categoryList = mapper.getList();
		categoryList.forEach(log::info);
	}
}
