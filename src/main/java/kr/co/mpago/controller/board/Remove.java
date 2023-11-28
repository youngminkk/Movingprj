package kr.co.mpago.controller.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.mpago.domain.Board;
import kr.co.mpago.domain.Criteria;
import kr.co.mpago.domain.Member;
import kr.co.mpago.service.BoardService;
import kr.co.mpago.util.WebUtils;


@WebServlet("/board/remove")
public class Remove extends HttpServlet {
	private BoardService boardService = BoardService.getInstance();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String bno =req.getParameter("bno");
		String cate = req.getParameter("category");
		String pageNum = req.getParameter("pageNum");
		String amount = req.getParameter("amount");
		String type = req.getParameter("type");
		String keyword = req.getParameter("keyword");
		
		Criteria.CriteriaBuilder cb = Criteria.builder();
		if(cate != null) {
			cb.category(Integer.parseInt(cate));
		}
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
	}
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Member member = WebUtils.getMember(req);
		if(member != null) {
			String bno = req.getParameter("bno");
			if(bno != null) {
				Board board = boardService.get(Long.valueOf(bno));
				if(board.getUserno().equals(member.getUserno()) || member.getIsAdmin()) {
					String cate = req.getParameter("category");
					String pageNum = req.getParameter("pageNum");
					String amount = req.getParameter("amount");
					String type = req.getParameter("type");
					String keyword = req.getParameter("keyword");
					
					Criteria.CriteriaBuilder cb = Criteria.builder();
					if(cate != null) {
						cb.category(Integer.parseInt(cate));
					}
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
					
					req.setAttribute("cri", criteria);
					
					boardService.delete(Long.valueOf(bno));
					WebUtils.alert(resp, "삭제 되었습니다", req.getContextPath() + "/board/list");
				}
			}
		}
		WebUtils.alert(resp, "비정상적 접근입니다", req.getContextPath() + "/board/list");		
	}

}
