package kr.co.mpago.controller.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.mpago.domain.Board;
import kr.co.mpago.service.BoardService;
import kr.co.mpago.service.MemberService;
import kr.co.mpago.util.WebUtils;

@WebServlet("/board/get")
public class Get extends HttpServlet{
	private BoardService boardService = BoardService.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(req.getParameter("bno") == null) {
			// 게시글 번호 없음
			// 목록으로 보내기
			WebUtils.alert(resp, "없는 게시글 번호 입니다", "list?");
			return;
		}

		Long bno = Long.valueOf(req.getParameter("bno"));
		Board board = boardService.get(bno);
		if(board == null) {		
			// 게시글 없음
			// 목록으로 보내기
			WebUtils.alert(resp, "없는 게시글 입니다", "list?");
			return;
		}

		req.setAttribute("board", board);
		req.getRequestDispatcher("/WEB-INF/views/board/get.jsp").forward(req, resp);	
	}	
}
