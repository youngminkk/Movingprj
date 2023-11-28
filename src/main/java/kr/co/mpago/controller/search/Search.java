package kr.co.mpago.controller.search;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.mpago.domain.Cast;
import kr.co.mpago.domain.Movie;
import kr.co.mpago.service.CastService;
import kr.co.mpago.service.MovieService;

@WebServlet("/search")
public class Search extends HttpServlet {
	private MovieService movieservice = MovieService.getMovieService();
	private CastService castservice = CastService.getCastService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String search = req.getParameter("search");
		
		/**
		 * 검색결과 분류 카테고리
		 * 영화, 인물 검색결과
		 */
		
		// 통합검색 영화, 배우 10개씩
		List<Movie> movieMain = movieservice.getSearch(search);
		List<Cast> castMain = castservice.getSearch(search);
		
		// 영화 전체결과
		List<Movie> movieList = movieservice.getSearchMoviList(search);
		// 배우 전체결과
		List<Cast> castList = castservice.getSearchList(search);
		
		req.setAttribute("movieMain", movieMain);
		req.setAttribute("movieList", movieList);
		req.setAttribute("castMain", castMain);
		req.setAttribute("castList", castList);
		req.getRequestDispatcher("/WEB-INF/views/search/search.jsp").forward(req, resp);
	}

}
