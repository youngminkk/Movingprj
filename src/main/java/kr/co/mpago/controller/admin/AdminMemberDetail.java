package kr.co.mpago.controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.co.mpago.domain.Member;
import kr.co.mpago.service.MemberService;

@WebServlet("/admin/member/detail")
public class AdminMemberDetail extends HttpServlet {
	MemberService memberService = MemberService.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userno = req.getParameter("userno");
        if (userno != null && !userno.isEmpty()) {
    		Member member = memberService.getByUserno(userno); 
            if (member != null) {
                resp.setContentType("application/json");
                resp.setCharacterEncoding("UTF-8");
                resp.getWriter().write(new Gson().toJson(member));
            } else {
                resp.setStatus(HttpServletResponse.SC_NOT_FOUND);
                resp.getWriter().write("Cannot find the member");
            }
        } else {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            resp.getWriter().write("Invalid userno");
        }
    }
}