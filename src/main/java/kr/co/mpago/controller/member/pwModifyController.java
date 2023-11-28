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

@WebServlet("/member/pwModify")
public class pwModifyController extends HttpServlet {
    private MemberService memberService = MemberService.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Member member = (Member) req.getSession().getAttribute("member");

        req.setAttribute("myMember", memberService.findBy(((Member) member).getUserid()));
        req.getRequestDispatcher("/WEB-INF/views/member/pwModify.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String oldpassword = req.getParameter("oldpassword");
        String password = req.getParameter("password");
        String passwordchk = req.getParameter("passwordchk");

        Object member = req.getSession().getAttribute("member");
        Member findMember = memberService.get(((Member) member).getUserid());

        if (oldpassword.equals(findMember.getPassword())) {
            WebUtils.alert(resp, "기존 비밀번호와 다릅니다.", true);
        } else if (!password.equals(passwordchk)) {
            WebUtils.alert(resp, "새로운 비밀번호를 똑같이 입력해주세요", true);
        } else {
            // Bcrypt로 비밀번호 암호화
    		String BcryptPwd = BCrypt.hashpw(password, BCrypt.gensalt());
            
    		findMember.setPassword(BcryptPwd);
    		memberService.modifyPassword(findMember);
    		
    		WebUtils.alert(resp, "비밀번호 변경되었습니다");
    		resp.getWriter().write("<script>window.location.href='/member/myPage';</script>");
        }
    }
}
