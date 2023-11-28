package kr.co.mpago.controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mindrot.jbcrypt.BCrypt;

import kr.co.mpago.domain.Member;
import kr.co.mpago.service.MemberService;
import kr.co.mpago.util.WebUtils;




@WebServlet("/member/signup")
public class Signup extends HttpServlet{
	private MemberService memberService = MemberService.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/member/signup.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String id = req.getParameter("userid");
		String nickname = req.getParameter("nickname");
		String pwd = req.getParameter("password");
		String name = req.getParameter("username");
		String email = req.getParameter("email");
		boolean gender = req.getParameter("gender").equals("1");
		
		// Bcrypt로 비밀번호 암호화
		String BcryptPwd = BCrypt.hashpw(pwd, BCrypt.gensalt());
		
		// 회원등록
		Member member = Member.builder().userid(id).nickname(nickname).username(name).password(BcryptPwd).email(email).gender(gender).build();
		memberService.register(member);
		WebUtils.alert(resp, "회원가입을 축하드립니다!", "/member/signin");
	}

}
