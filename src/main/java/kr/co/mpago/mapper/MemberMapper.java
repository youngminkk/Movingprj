package kr.co.mpago.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;

import kr.co.mpago.domain.Board;
import kr.co.mpago.domain.Criteria;
import kr.co.mpago.domain.Member;

public interface MemberMapper {

	int insert(Member member);
	// 목록조회
	List<Member> getList();
	// 단일조회
	Member read(String userid);
	Member readByUserno(String userno);
	// 회원삭제
	int delete(Long userno);
	// 회원정보수정
	int update(Member member);
	// 아이디 중복확인
	int findId(String userid);
	// 아이디 중복확인
	int findNick(String nickname);
	// 이메일 중복확인
	int findEmail(String email);
	// 이름으로 회원검색
	List<Member> findMember(String username);
	// 총 회원수
	int getTotal(Criteria criteria);
	List<Member> getListWithPaging(Criteria criteria);
	//검색 회원수
	int getTotalWithKeyword(Criteria criteria);
	// 회원목록삭제
	int deleteAll(List<String> usernos);
	// 비밀번호 변경
	int updatePwd(Member member);
	// 닉네임 변경
	int updateNickName(Member member);
}
