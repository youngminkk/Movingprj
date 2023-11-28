package kr.co.mpago.controller.msg;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.mpago.service.MsgService;

@WebServlet("/message/remove")
public class MessageRemove extends HttpServlet{
	private MsgService msgService = MsgService.getMsgService();
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		// 단일수집
		String msgno = req.getParameter("msgno");
		// 배열수집
		String[] msgnos = req.getParameterValues("msgnos");
		
		// 단일 삭제
		if(msgno != null) {
			msgService.remove(Long.valueOf(msgno));
		}
		
		// 일괄삭제
		if(msgnos != null) {
			for(String m : msgnos) {
				System.out.println(m);
				msgService.remove(Long.valueOf(m));
			}
		}
		
	}

}
