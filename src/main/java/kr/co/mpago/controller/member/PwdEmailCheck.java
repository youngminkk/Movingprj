package kr.co.mpago.controller.member;

import java.io.IOException;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.mpago.domain.Member;
import kr.co.mpago.service.MemberService;
import kr.co.mpago.util.MailUtils;

@WebServlet("/member/pwdEmailCheck")
public class PwdEmailCheck extends HttpServlet{
	private MemberService memberService = MemberService.getInstance();
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String id = req.getParameter("userid");
		String email = req.getParameter("email");
		System.out.println(email);
		
		
		Member mem = memberService.get(id);
		System.out.println(mem.getEmail().equals(email));
		
		// 입력한 아이디에 이메일이 일치여부 확인
		if(mem.getEmail().equals(email)) {
			resp.setContentType("application/json");
			resp.getWriter().write("{\"available\":" + true + "}");
		}
		else {
			resp.setContentType("application/json");
			resp.getWriter().write("{\"available\":" + false + "}");
		}
	}

}
