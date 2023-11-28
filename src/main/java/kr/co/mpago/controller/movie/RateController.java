package kr.co.mpago.controller.movie;

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

import com.google.gson.Gson;

import kr.co.mpago.domain.Rate;
import kr.co.mpago.service.RateService;
import lombok.extern.log4j.Log4j;

@Log4j
@WebServlet("/rate/*")
public class RateController extends HttpServlet {
	private RateService rateService = new RateService();
	private Gson gson = new Gson();

	// 평점 삭제
	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		String[] arr = uri.substring(1).split("/");

		if (arr.length == 2) {
			Long tno = Long.valueOf(arr[1]);
			log.info("단일삭제, tno : " + tno);

			if (rateService.delete(tno) > 0) {
				resp.setStatus(200);
				resp.getWriter().print("success");
			} else {
				resp.setStatus(500);
			}
		}
	}

	// 평점 조회
	@Override
	// http://localhost:8080/rate/{tno}
	// http://localhost:8080/rate/mno/{mno}/{lastTno}
	// http://localhost:8080/rate/userno/{userno}/{lastTno}
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		String cp = req.getContextPath();
		uri = uri.substring(cp.length() + 1);
		String[] arr = uri.substring(1).split("/");
		Object o = null;

		// 평점 단일조회
		if (arr.length == 2) {
			Long tno = Long.valueOf(arr[1]);
			o = rateService.getOne(tno);
		}
		
		// 평점 목록 조회
		else if (arr.length >= 3) {
			Long no = Long.valueOf(arr[2]);
			Long lastTno = null;
			if (arr.length >= 4) {
				lastTno = Long.valueOf(arr[3]);
			}
			if (arr[1].equals("mno")) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("list", rateService.getList(no, null, lastTno));
				map.put("info", rateService.getCountAndAvg(no));
				o = map;

			} else if (arr[1].equals("userno")) {
				o = rateService.getList(null, no, lastTno);
			}
		}
		resp.setContentType("application/json; charset=utf-8");
		resp.getWriter().print(gson.toJson(o));
	}

	// 평점 등록
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String str = new BufferedReader(new InputStreamReader(req.getInputStream())).lines().collect(Collectors.joining());
		Rate myrate = gson.fromJson(str, Rate.class);

		if (rateService.register(myrate) > 0) {
			resp.setStatus(200); // 200 : 성공
			resp.getWriter().print(myrate.getTno());
		} else {
			resp.setStatus(500); // 500 : 오류메세지
		}
	}

	// 댓글 수정
	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String str = new BufferedReader(new InputStreamReader(req.getInputStream())).lines().collect(Collectors.joining());
		Rate myrate = gson.fromJson(str, Rate.class);

		if (rateService.modify(myrate) > 0) {
			resp.setStatus(200);
			resp.getWriter().print("success");
		} else {
			resp.setStatus(500);
		}
	}
}