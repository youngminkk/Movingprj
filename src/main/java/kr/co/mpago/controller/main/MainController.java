package kr.co.mpago.controller.main;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.mpago.domain.IndexMovie;
import kr.co.mpago.domain.Movie;
import kr.co.mpago.domain.MovieGenre;
import kr.co.mpago.domain.MovieImage;
import kr.co.mpago.service.MovieGenreService;
import kr.co.mpago.service.MovieImageService;
import kr.co.mpago.service.MovieService;
import lombok.extern.log4j.Log4j;

@WebServlet("")
@Log4j
public class MainController extends HttpServlet {
	private MovieService movieService = MovieService.getMovieService();
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<IndexMovie> movies = movieService.getIndexMovieList();
		
		req.setAttribute("movies", movies);
		
		//		List<Long> genres = Arrays.asList(28l, 10749l, 35l, 27l);
//		Map<Long, List<MovieImage>> imageMap = new HashMap<>();
//		List<MovieImage> koImageList = new ArrayList<MovieImage>();
//		List<MovieImage> enImageList = new ArrayList<MovieImage>();
//		
//		for (Long gno : genres) {
//		    List<MovieGenre> movieList = movieGenreService.getFirstTenByGenreList(gno);
//		    List<MovieImage> imageList = new ArrayList<MovieImage>();
//		    
//		    
//		    
//		    for (MovieGenre genre : movieList) {
//				Long mno = genre.getMno();
//				MovieImage image = movieImageService.getMovieImageListByCategory(mno, "poster");
//				if(image != null) {
//		            String imagePath = image.getBackdroppath();
//		            if (imagePath != null && !imagePath.startsWith("https://image.tmdb.org/t/p/w300")) {
//		                image.setBackdroppath("https://image.tmdb.org/t/p/w300" + imagePath);
//		            }
//				} else {
//		            image = new MovieImage();
//		            image.setMno(mno);
//		            image.setImagecate("poster");
//		            image.setBackdroppath("https://via.placeholder.com/300x450");
//		        }
//		        imageList.add(image);
//			}
//		    imageMap.put(gno, imageList);
//		}
//		
//		List<Movie> koMovieList = movieService.getTenMovieListByLanguage("ko");
//		List<Movie> enMovieList = movieService.getTenMovieListByLanguage("en");
//
//		for (Movie movie : koMovieList) {
//			Long mno = movie.getMno();
//			
//			MovieImage image = movieImageService.getMovieImageListByCategory(mno, "poster");
//			if(image != null) {
//	            String imagePath = image.getBackdroppath();
//	            if (imagePath != null && !imagePath.startsWith("https://image.tmdb.org/t/p/w300")) {
//	                image.setBackdroppath("https://image.tmdb.org/t/p/w300" + imagePath);
//	            }
//	        } else {
//	            image = new MovieImage();
//	            image.setMno(mno);
//	            image.setImagecate("poster");
//	            image.setBackdroppath("https://via.placeholder.com/300x450");
//	        }
//	        koImageList.add(image);
//		}		   
//		for (Movie movie : enMovieList) {
//			Long mno = movie.getMno();
//			
//			MovieImage image = movieImageService.getMovieImageListByCategory(mno, "poster");
//			if(image != null) {
//	            String imagePath = image.getBackdroppath();
//	            if (imagePath != null && !imagePath.startsWith("https://image.tmdb.org/t/p/w300")) {
//	                image.setBackdroppath("https://image.tmdb.org/t/p/w300" + imagePath);
//	            }
//	        } else {
//	            image = new MovieImage();
//	            image.setMno(mno);
//	            image.setImagecate("poster");
//	            image.setBackdroppath("https://via.placeholder.com/300x450");
//	        }
//			enImageList.add(image);
//		}		  
//		
//		
//		req.setAttribute("genres", genres);
//		req.setAttribute("imageMap", imageMap);
//		req.setAttribute("koImageList", koImageList);
//		req.setAttribute("enImageList", enImageList);
		req.getRequestDispatcher("/WEB-INF/views/index.jsp").forward(req, resp);
	}
}