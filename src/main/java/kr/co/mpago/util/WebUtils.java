package kr.co.mpago.util;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.mpago.domain.Criteria;
import kr.co.mpago.domain.Member;

public class WebUtils {
	public static Member getMember(HttpServletRequest req) {
		Member member = null;
		if (req.getSession().getAttribute("member") != null) {
			member = (Member) req.getSession().getAttribute("member");
		}
		return member;
	}

	public static void alert(HttpServletResponse resp, String msg, String url, boolean back) throws IOException {
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter pw = resp.getWriter();
		pw.write("<script>");
		pw.write("alert('" + msg + "');");
		if (url != null) {
			pw.println("location.href ='" + url + "';");
		}
		if (back) {
			pw.println("history.back();");
		}
		pw.println("</script>");
	}

	public static void alert(HttpServletResponse resp, String msg) throws IOException {
		alert(resp, msg, null);
	}

	public static void alert(HttpServletResponse resp, String msg, String url) throws IOException {
		alert(resp, msg, url, false);
	}

	public static void alert(HttpServletResponse resp, String msg, boolean back) throws IOException {
		alert(resp, msg, null, true);
	}
	
	public static Criteria boardCriteria (HttpServletRequest req) {
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
		return criteria;
	}

	public static Criteria memberCriteria(HttpServletRequest req) {
		String pageNum = req.getParameter("pageNum");
		String amount = req.getParameter("amount");
		String keyword = req.getParameter("keyword");
		
		Criteria.CriteriaBuilder cb = Criteria.builder();
		if(pageNum != null) {
			cb.pageNum(Integer.parseInt(pageNum));
		}
		if(amount != null) {
			cb.amount(Integer.parseInt(amount));
		}
		if(keyword != null) {
			cb.keyword(keyword);
		}
		
		Criteria criteria = cb.build();
		return criteria;
	}

	public static void alertBack(HttpServletResponse resp, String msg) throws IOException {
		resp.setContentType("text/html; charset=utf-8");

		PrintWriter pw = resp.getWriter();
		pw.write("<script>alert('" + msg + "'); history.back();</script>");
	}
}


