package kr.co.mpago.mapper;


import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;

import kr.co.mpago.domain.Cast;
import kr.co.mpago.util.DBUtils;
import lombok.extern.log4j.Log4j;


@Log4j
public class CastMapperTests {
	
	private SqlSessionFactory factory = DBUtils.sqlSessionFactory();
	private CastMapper castMapper = DBUtils.sqlSessionFactory().openSession(true).getMapper(CastMapper.class);	

	// Mapper 연결 Test (성공)
	@Test
	public void testMapper() {
		log.info(castMapper);
		log.info(factory.getConfiguration());
	}
	
	// 단일생성 insert (성공)
	@Test
	public void testInsert() {
		Cast cast =	Cast.builder().name("test이름10").birthDate("2099/12/31")
				.profileImage("testURL").build();
//		Cast cast = new Cast();
//		cast.setName("test이름10");
//		cast.setBirthDate("2099/12/31");
//		cast.setProfileImage("testurl");
		
		log.info(cast);
		castMapper.insertCast(cast);
		log.info(cast);
	}

	// 단일조회 test (성공)
	@Test
	public void testSelect() {
		castMapper.selectCast(10L);
		log.info(castMapper.selectCast(10L));
	}
	
	// 단일삭제 test (성공)
	@Test
	public void testDelete() {
		testSelect();
		castMapper.deleteCast(10L);
		log.info(castMapper.deleteCast(10L));
		testSelect();
	}
	
	// 단일변경 test (성공)
	@Test
	public void testUpdate() {
		Cast cast = castMapper.selectCast(9L);
		
		cast.setName("test이름9");
		castMapper.updateCast(cast);
		log.info(cast);
		
		cast = castMapper.selectCast(9L);
		log.info(cast);
	}
	
	// 전체조회 (성공)
	@Test
	public void testselectList() {
		castMapper.selectCastList().forEach(cast -> log.info(cast));
	}
	
	// 인물 검색
	@Test
	public void testSearch() {
		castMapper.searchCastMain("test");
	}
}
