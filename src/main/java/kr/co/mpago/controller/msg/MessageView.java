package kr.co.mpago.controller.msg;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.mpago.domain.Member;
import kr.co.mpago.domain.Msg;
import kr.co.mpago.service.MsgService;

@WebServlet("/message/view")
public class MessageView extends HttpServlet{
	private MsgService msgService = MsgService.getMsgService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String msgno = req.getParameter("msgno");
		String fromnick = req.getParameter("fromnick");
		
		// 단일조회
		Msg msg = msgService.get(Long.parseLong(msgno));
		req.setAttribute("msg", msg);
		
		req.getRequestDispatcher("/WEB-INF/views/message/msgView.jsp").forward(req, resp);
		
	}
	
}
