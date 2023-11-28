package kr.co.mpago.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.mpago.domain.Criteria;
import kr.co.mpago.domain.Member;
import kr.co.mpago.service.MemberService;
import kr.co.mpago.util.WebUtils;

@WebServlet("/admin/memberView")
public class AdminMemberView extends HttpServlet {
	MemberService memberService = MemberService.getInstance();
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String pageNum = req.getParameter("pageNum");
		String amount = req.getParameter("amount");
		String type = req.getParameter("type");
		String keyword = req.getParameter("keyword");
		
		Criteria.CriteriaBuilder cb = Criteria.builder();
		if(pageNum != null) {
			cb.pageNum(Integer.parseInt(pageNum));
		}
		if(amount != null) {
			cb.amount(Integer.parseInt(amount));
		}
		if(type != null) {
			cb.type(type);
		}
		if(keyword != null) {
			cb.keyword(keyword);
		}
		Criteria criteria = cb.build();
		String username = req.getParameter("name");
		 if (username == null || username.isEmpty()) {
	            WebUtils.alert(resp, "이름을 입력하세요", "list?" + criteria.getPagesLink()); 
	            // 이름이 없을 경우 에러 메시지
	            return;
	        }
		List<Member> member = memberService.findBy(username);
		if (member == null) {
			// 이름 없음
			// 목록으로 보내기
			WebUtils.alert(resp, "해당 이름이 없는 회원입니다", "list?" + criteria.getPagesLink());
			return;
		}
		req.setAttribute("cri", criteria);
		req.setAttribute("Member", member);
		req.getRequestDispatcher("/WEB-INF/views/admin/MemberView.jsp").forward(req, resp);
	}
}