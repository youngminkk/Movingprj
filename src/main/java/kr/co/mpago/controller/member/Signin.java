package kr.co.mpago.controller.member;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mindrot.jbcrypt.BCrypt;

import kr.co.mpago.domain.Member;
import kr.co.mpago.service.MemberService;
import kr.co.mpago.util.WebUtils;




@WebServlet("/member/signin")
public class Signin extends HttpServlet{
	MemberService memberService = MemberService.getInstance();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/member/signin.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String id = req.getParameter("userid");
		String pwd = req.getParameter("password");
		String href = req.getParameter("href");
		System.out.println(href);
		System.out.println(id);
		System.out.println(pwd);
		if(id == null || pwd == null || memberService.get(id) == null) {
			WebUtils.alert(resp, "아이디 또는 비밀번호를 잘못 입력했습니다.", true);
//			resp.setContentType("application/json");
//			resp.getWriter().write("{\"available\":" + false + "}");
		}
		Member mem = memberService.get(id);
		// 아이디, 비밀번호 일치확인
		System.out.println("pwd : " + mem.getPassword());
		System.out.println(BCrypt.checkpw(pwd, mem.getPassword()));
		// 암호화 비밀번호 일치확인
		if(mem !=null && BCrypt.checkpw(pwd, mem.getPassword())) {
			//사용자 인증
			req.getSession().setAttribute("member", mem);
			req.getSession().setAttribute("isAdmin", mem.getIsAdmin());
			req.getSession().setAttribute("nickname", mem.getNickname());
			
			// 세션 수명 설정
		    req.getSession().setMaxInactiveInterval(0);
			
			System.out.println("로그인 성공");
			 // 사용자가 관리자인 경우 admin 페이지로 리다이렉션, 그렇지 않으면 href로 리다이렉션
	        String redirectPath = mem.getIsAdmin() ? "/admin" : (href != null ? URLDecoder.decode(href, "utf-8") : "/");
	        resp.sendRedirect(redirectPath);
	        System.out.println("리다이렉트 경로: " + redirectPath);
	        System.out.println("isAdmin: " + mem.getIsAdmin());
	    } else {
	        // 사용자 인증 실패
	    	WebUtils.alert(resp, "로그인 실패했습니다.", true);
	    }
	}
}