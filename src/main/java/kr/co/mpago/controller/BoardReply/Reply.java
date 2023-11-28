package kr.co.mpago.controller.BoardReply;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import kr.co.mpago.domain.Board;
import kr.co.mpago.domain.BoardReply;
import kr.co.mpago.domain.Criteria;
import kr.co.mpago.domain.Member;
import kr.co.mpago.service.BoardReplyService;
import kr.co.mpago.service.BoardService;
import lombok.extern.log4j.Log4j;

@WebServlet("/reply/*")
@Log4j
public class Reply extends HttpServlet {
	private BoardReplyService replyService = BoardReplyService.getInstance();
	private Gson gson = new Gson();
	
	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		String[] arr = uri.substring(1).split("/");
		
		Long rno = Long.valueOf(arr[1]);
		if(replyService.remove(rno) > 0) {
			resp.setStatus(200);
			resp.getWriter().print("success");
		} else {
			resp.setStatus(500);
		}
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		String[] arr = uri.substring(1).split("/");
		Criteria criteria = new Criteria();
		
		Object o = null;
		log.info(uri);
		if(arr.length == 2) { // 단일 조회
			Long rno = Long.valueOf(arr[1]);
			o = replyService.get(rno);
		}else if(arr.length >= 3) { 
			Long bno = Long.valueOf(arr[2]);
			Map<String, Object> map = new HashMap<String, Object>();
			if(arr[1].equals("pages")) { // 목록 조회
				if(arr.length > 3) {
//					lastRno = Long.valueOf(arr[3]);
					System.out.println("목록 조회, bno : " + bno);
//					System.out.println("목록 조회, lastRno : " + lastRno);
				}
				map.put("list", replyService.getList(criteria, bno));
				map.put("replyCnt", replyService.getTotal(criteria, bno));
				o = map;
			}
		}
		
		resp.setContentType("application/json; charset=utf-8");
		resp.getWriter().print(gson.toJson(o));
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String str = new BufferedReader(new InputStreamReader(req.getInputStream())).lines().collect(Collectors.joining());
		log.info(str);
		
		BoardReply reply = gson.fromJson(str, BoardReply.class);
		HttpSession session = req.getSession();
	    Member member = (Member) session.getAttribute("member");
	    log.info(member);
	    
	    
	    if (member != null) {
	        reply.setUserno(member.getUserno());
	        if (replyService.insert(reply) > 0) {
	            resp.setStatus(200);
	            resp.getWriter().print(reply.getRno());
	        } else {
	            resp.setStatus(500);
	        }
	    } else {
	        resp.setStatus(401);
	    }
	}
	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String str = new BufferedReader(new InputStreamReader(req.getInputStream())).lines().collect(Collectors.joining());
		BoardReply reply = gson.fromJson(str, BoardReply.class);
		if(replyService.modify(reply) > 0) {
			resp.setStatus(200);
			resp.getWriter().print("success");
		} else {
			resp.setStatus(500);
		}
	}
}
