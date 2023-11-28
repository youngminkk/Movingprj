package kr.co.mpago.mapper;


import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;

import kr.co.mpago.domain.Criteria;
import kr.co.mpago.domain.Member;
import kr.co.mpago.util.DBUtils;
import lombok.extern.log4j.Log4j;
@Log4j
public class MemberMapperTests {
	private SqlSessionFactory factory = DBUtils.sqlSessionFactory();
	private MemberMapper mapper = DBUtils.sqlSessionFactory().openSession(true).getMapper(MemberMapper.class);
	
	// mapper 테스트
	@Test
	public void testMapper () {
		log.info(mapper);
		log.info(factory.getConfiguration());
	}
	
	// insert 테스트
	@Test
	public void testInsert() {
		String a = "0";
		boolean gender = a == "1";
		log.info(gender);
		Member member = Member.builder().userid("kiaa").nickname("zxd").username("huhu").password("1234").email("zczvt@").gender(gender).build();
		log.info(member);
		int count = mapper.insert(member);
		log.info(count);
	}
	// 단일조회 테스트
	@Test
	public void testRead() {
		log.info(mapper.read("qwer"));
	}
	// 목록조회 테스트
	@Test
	public void testGetList() {
		mapper.getList();
	}
	// 회원삭제테스트
	@Test
	public void testDelete() {
		int cnt = mapper.delete(1L);
		log.info(cnt);
	}
	// 회원수정 테스트
	@Test
	public void testUpdate() {
		boolean gender = false;
		Member mem = mapper.read("qwer");
		log.info(mem);
		mem.setGender(gender);
		mem.setNickname("안대대");
		mem.setPassword("1234");
		mapper.update(mem);
		mem = mapper.read("qwer");
		log.info(mem);
	}
	
	// 아이디 중복검사 테스트
	@Test
	public void testIdCheck() {
		int cnt = mapper.findId("qwer");
		log.info(cnt);
	}
	// 이메일 중복검사 테스트
	@Test
	public void testEmailCheck() {
		int cnt = mapper.findEmail("qwre@");
		log.info(cnt);
	}
	@Test
	public void testNickCheck() {
		int cnt = mapper.findNick("kdb");
		log.info(cnt);
	}
	// 이름으로 검색 테스트 성공(ex 홍길동 '홍'만 검색해도 전체 목록 표시) 
	@Test
	public void findName() {
		log.info(mapper.findMember("관리자"));
	}
	// 검색에 따른 회원 수	
//	@Test
//	public void testGetTotalWithKeyword() {
//	    // 검색어가 있는 경우
//	    Criteria criteriaWithKeyword = new Criteria(1, 10, "김");
//	    int countWithKeyword = mapper.getTotalWithKeyword(criteriaWithKeyword);
//	    log.info("검색어 '김'에 해당하는 회원 수: " + countWithKeyword);
//
//	    // 검색어가 없는 경우
//	    Criteria criteriaWithoutKeyword = new Criteria(1, 10, "");
//	    int countWithoutKeyword = mapper.getTotalWithKeyword(criteriaWithoutKeyword);
//	    log.info("검색어 없이 조회한 회원 수: " + countWithoutKeyword);
//	}
}