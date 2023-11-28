package kr.co.mpago.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;

import kr.co.mpago.domain.Rate;
import kr.co.mpago.util.DBUtils;
import lombok.extern.log4j.Log4j;

@Log4j
public class RateMapperTests {
	private SqlSessionFactory factory = DBUtils.sqlSessionFactory();
	private RateMapper rateMapper = DBUtils.sqlSessionFactory().openSession(true).getMapper(RateMapper.class);

	// Mapper 연결 Test (성공)
	@Test
	public void testMapper() {
//		System.out.println(rateMapper);
		log.info(rateMapper);
//		System.out.println(factory.getConfiguration());
		log.info(factory.getConfiguration());
	}
	
	// 등록 Test (성공)
	@Test
	public void testInsert() {
		//Rate rate = Rate.builder().rate(2.0).userno(1L).mno(3L).tcomment("리뷰 작성 테스트").build();
		Rate rate = new Rate();
		rate.setRate(5.0);
		rate.setUserno(162L);
		rate.setMno(3L);
		rate.setTcomment("1101리뷰등록");
//		System.out.println(rate);
		int count = rateMapper.insert(rate);
		log.info(count);
	}
	
	// 수정 Test
	@Test
	public void testModify() {
//		Rate rate = Rate.builder().userno(162L).mno(20L).rate(3.0).tcomment("리뷰 수정 테스트").build();
//		boolean count = rateMapper.modify(rate);
//		System.out.println(rate);
	}
	
	// 영화별 평점 조회 Test (성공)
	@Test
	public void testGetMovie() {
//	    List<Rate> rates = rateMapper.getRateByMovie(3L);
//	    if (rates.isEmpty()) {
//	        log.info("내용이 없습니다.");
//	    } else {
//	        for (Rate rate : rates) {
//	            log.info(rate.toString());
//	        }
//	    }
	}
	
	// userno의 평점 조회 Test (성공)
	@Test
	public void testGetUser() {
//	    List<Rate> rates = rateMapper.getRateByUser(162L);
//	    if (rates.isEmpty()) {
//	        log.info("내용이 없습니다.");
//	    } else {
//	        for (Rate rate : rates) {
//	            log.info(rate.toString());
//	        }
//	    }
	}
	
	// 영화별 평점 평균 Test (성공)
	@Test
	public void testRateAvg() {
//		Long mno = 3L;
//		Double rateAvg = rateMapper.getRateAvg(mno);
//		   if (rateAvg == null) { // 영화에 평점이 등록되지 않았을 경우
//			  rateAvg = 0.0;
//		    }
//		   log.info(rateAvg);
	}
	
	// test 실패 값이 있는데 0으로 나옴
	@Test
	public void testSelectCount() { 
		 Long mno = 3L;
		 Map<?, ?> map = rateMapper.selectCountAndAvg(mno);
		 log.info("댓글 갯수: " + map);
	}

	
	
	// 목록 조회 Test (성공) 
//	@Test
//	public void getList() {
//		List<Rate> rateList = rateMapper.getList();
//		rateList.forEach(log::info);
//	}
	
	// 삭제  
	@Test
	public void testdelete() {
//		log.info(rateMapper.delete(9L) == true ? "삭제" : "삭제할 평점 없음");
	}
	
	@Test
	public void testList() {
		rateMapper.selectList(null, 160L, 1000000L).forEach(log::info);;
	}
}
