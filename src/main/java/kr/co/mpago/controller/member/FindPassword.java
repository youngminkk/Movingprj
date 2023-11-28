package kr.co.mpago.controller.member;

import java.io.IOException;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mindrot.jbcrypt.BCrypt;

import kr.co.mpago.domain.Member;
import kr.co.mpago.service.MemberService;
import kr.co.mpago.util.MailUtils;
import kr.co.mpago.util.WebUtils;

@WebServlet("/member/findpassword")
public class FindPassword extends HttpServlet{
	private MemberService memberService = MemberService.getInstance();
	private MailUtils mail = new MailUtils();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/member/findPwd.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String id = req.getParameter("userid");
		String email = req.getParameter("email");
		Member mem = memberService.get(id);
		
			try {
				// 이메일 발송
				mail.sendPwdEmail(email);
			} catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		// 임시발송된 비밀번호 암호화 후 등록
		String Bcryptpwd = BCrypt.hashpw(mail.codeVeri, BCrypt.gensalt());
		System.out.println("임시비밀번호 : " + mail.codeVeri);
		mem.setPassword(Bcryptpwd);
		
		memberService.modify(mem);
		
		WebUtils.alert(resp, "임시비밀번호가 발송되었습니다", "/member/signin");
	}

}
