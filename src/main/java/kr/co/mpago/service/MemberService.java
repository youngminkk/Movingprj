package kr.co.mpago.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.co.mpago.domain.Criteria;
import kr.co.mpago.domain.Member;
import kr.co.mpago.mapper.MemberMapper;
import kr.co.mpago.util.DBUtils;
import lombok.Data;
@Data
public class MemberService {
	private static final MemberService memberService = new MemberService();
	private MemberMapper memberMapper = DBUtils.sqlSessionFactory().openSession(true).getMapper(MemberMapper.class);
	private MemberService() {}
	public static MemberService getInstance() {
	        return memberService;
	    }
	
	// 회원등록
	public void register(Member member) {
		try (SqlSession sqlSession = DBUtils.sqlSessionFactory().openSession(true)) {
			MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
			memberMapper.insert(member);
		}
	}
	
	// 목록조회
	public List<Member> getList() {
		return memberMapper.getList();
	}
	
	public Member get(String userid) {
		return memberMapper.read(userid);
	}
	
	public int idCheck(String userid) {
		return memberMapper.findId(userid);
	}
	
	public int nickCheck(String nickname) {
		return memberMapper.findNick(nickname);
	}
	
	public boolean modify(Member member) {
		return memberMapper.update(member) > 0;
	}
	
	public boolean remove(Long userno) {
		return memberMapper.delete(userno) > 0;
	}
	public int emailCheck(String email) {
		return memberMapper.findEmail(email);
	}

	public List<Member> findBy(String username) {
		return memberMapper.findMember(username);
	}
	// 회원 총 카운트
	public int getTotal(Criteria criteria) {
		 if (criteria.getKeyword() == null || criteria.getKeyword().isEmpty()) {
		        return memberMapper.getTotal(criteria);
		    } else {
		        return memberMapper.getTotalWithKeyword(criteria);
		    }
		}

	public List<Member> findBy(String username, Criteria cri) {
		return memberMapper.findMember(username);
	}

	public List<Member> getList(Criteria cri) {	
		return memberMapper.getListWithPaging(cri);
	}
	// 유저번호 단일조회
	public Member getByUserno(String userno) {
		return memberMapper.readByUserno(userno);
	}
	//회원목록삭제	
	public boolean removeAll(List<String> usernos) {
	    return memberMapper.deleteAll(usernos) > 0;
	}
	// 비밀번호 변경
	public int modifyPassword(Member member) {
		return memberMapper.updatePwd(member);
	}
	
	// 닉네임 변경
	public int modifyNickname(Member member) {
		return memberMapper.updateNickName(member);
	}
}
