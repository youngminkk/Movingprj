package kr.co.mpago.controller.movie;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.ForEach;
import org.mariadb.jdbc.plugin.authentication.standard.ed25519.math.ed25519.Ed25519LittleEndianEncoding;

import kr.co.mpago.domain.Criteria;
import kr.co.mpago.domain.Genre;
import kr.co.mpago.domain.Movie;
import kr.co.mpago.domain.MovieGenre;
import kr.co.mpago.domain.MovieImage;
import kr.co.mpago.domain.MovieVideo;
import kr.co.mpago.domain.PageDTO;
import kr.co.mpago.service.GenreService;
import kr.co.mpago.service.MovieGenreService;
import kr.co.mpago.service.MovieImageService;
import kr.co.mpago.service.MovieService;
import lombok.extern.log4j.Log4j;

@Log4j
@WebServlet("/movie/list")
public class MovieByLanguage extends HttpServlet {
	private MovieService movieService = MovieService.getMovieService();
	private GenreService genreService = GenreService.getGenreService();
	private MovieGenreService movieGenreService = MovieGenreService.getMovieGenreService();
	private MovieImageService movieImageService = MovieImageService.getMovieImageService();
	
	/**
	 * @author gilho
	 * 
	 * @param 
	 * 0. 기본 페이지 (장르별 페이지)
	 * 
	 * @param gno
	 * 1. 장르별 페이지 > 장르별 영화 > 버튼 클릭으로 이동
	 *  >> 페이징 쿼리 필요
	 *  
	 *  @param language
	 * 2. 언어별 페이지 > 헤더에서 한국영화/외국영화  + 메인에서 한국영화/외국영화 더보기에서 사용
	 *  >> 페이징은 딱히필요하지않음
	 *  
	 *  @param gno
	 *  @param language
	 * 3. 장르 + 언어별 페이지 > 한국영화/외국영화 페이지에서 장르별 더보기로 들어갔을 때 사용
	 * 	>> 페이징 쿼리 필요
	 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 초기화 작업
		Long gno = null;
		List<MovieImage> images = null;
		Map<Long, List<MovieImage>> movieImagesMap = null;
		List<Movie> resultList = null;
		List<Genre> genres = genreService.getGenreList();
		
		// 파라미터 전송
		String language = req.getParameter("lang");
		String gParameter = req.getParameter("g"); 
		if (gParameter != null && !gParameter.isEmpty()) { // Long 타입 예외처리
		    gno = Long.valueOf(gParameter);
		}
		
		/**
		 * 파라미터를 안받아오는 경우
		 * @param
		 */
		if (gno == null || language == null) {
			log.info("gno and language is null");
			images = new ArrayList<>();
			resultList = movieService.getMovieList();
			
			for (Movie movie : resultList) {
				Long mno = movie.getMno();
				MovieImage image = movieImageService.getMovieImageListByCategory(mno, "poster");
		        if(image != null) {
		            String imagePath = image.getBackdroppath();
		            if (imagePath != null && !imagePath.startsWith("https://image.tmdb.org/t/p/w300")) {
		                image.setBackdroppath("https://image.tmdb.org/t/p/w300" + imagePath);
		            }
		        } else {
		            image = new MovieImage();
		            image.setMno(mno);
		            image.setImagecate("poster");
		            image.setBackdroppath("https://via.placeholder.com/300x450");
		        }
		        images.add(image);
			}	
//			log.info(images);
		}
		
		/**
		 * 파라미터를 language를 받아오는 경우
		 * @param language
		 */
		if (language != null && gno == null) {
			log.info("language is not null");
			List<Map<String, Object>> results = null;
			movieImagesMap = new HashMap<>();
			for (Genre genre : genres) {
				images = new ArrayList<MovieImage>();
				results = movieGenreService.getFirstTenByGenreListWithLanguage(genre.getGno(), language);
			
				// 이미지를 저장
				List<Long> mnoList = results.stream()
					    .map(entry -> (Long) entry.get("mno"))
					    .collect(Collectors.toList());
				
				for (Long mno : mnoList) {
					MovieImage image = movieImageService.getMovieImageListByCategory(mno, "poster");
					if(image != null) {
						String imagePath = image.getBackdroppath();
						if (imagePath != null && !imagePath.startsWith("https://image.tmdb.org/t/p/w300")) {
				            image.setBackdroppath("https://image.tmdb.org/t/p/w300" + imagePath);
				        }
					} else {
						image = new MovieImage();
						image.setMno(mno);
						image.setImagecate("poster");
						image.setBackdroppath("https://via.placeholder.com/300x450");
					} 
					images.add(image);
				}
				movieImagesMap.put(genre.getGno(), images);
			}	
		}
		
		/**
		 * @param language
		 * @param gno
		 */
		if (language != null && gno != null) {
			List<Map<String, Object>> results = null;
			log.info("gno is not null, language is not null");
			results = movieGenreService.getMoviesByGenre(gno, language);
			images = new ArrayList<>();
			
			List<Long> mnoList = results.stream()
			    .map(entry -> (Long) entry.get("mno"))
			    .collect(Collectors.toList());
			for (Long mno : mnoList) {
					MovieImage image = movieImageService.getMovieImageListByCategory(mno, "poster");
			        if(image != null) {
			            String imagePath = image.getBackdroppath();
			            if (imagePath != null && !imagePath.startsWith("https://image.tmdb.org/t/p/w300")) {
			                image.setBackdroppath("https://image.tmdb.org/t/p/w300" + imagePath);
			            }
			        } else {
			            image = new MovieImage();
			            image.setMno(mno);
			            image.setImagecate("poster");
			            image.setBackdroppath("https://via.placeholder.com/300x450");
			        }
			        images.add(image);
			}
		}
					
		/**
		 * 장르를 파라미터로 받아오는 경우
		 * @param gno
		 */
		if (language == null && gno != null) {
			List<Map<String, Object>> results = null;
			List<MovieGenre> movieGenres = movieGenreService.getFirstTenByGenreList(gno); // Assuming a new method in MovieService
			results = new ArrayList<Map<String,Object>>();
			for (MovieGenre movieGenre : movieGenres) {
			    Map<String, Object> map = new HashMap<>();
			    map.put("gno", movieGenre.getGno());
			    map.put("mno", movieGenre.getMno());
			    map.put("mgno", movieGenre.getMgno());
			    // 추가 필드가 있다면 여기에 추가
			    
			    results.add(map);
			}	
			images = new ArrayList<>();
			
			List<Long> mnoList = results.stream()
			    .map(entry -> (Long) entry.get("mno"))
			    .collect(Collectors.toList());
			for (Long mno : mnoList) {
				MovieImage image = movieImageService.getMovieImageListByCategory(mno, "poster");
		        if(image != null) {
		            String imagePath = image.getBackdroppath();
		            if (imagePath != null && !imagePath.startsWith("https://image.tmdb.org/t/p/w300")) {
		                image.setBackdroppath("https://image.tmdb.org/t/p/w300" + imagePath);
		            }
		        } else {
		            image = new MovieImage();
		            image.setMno(mno);
		            image.setImagecate("poster");
		            image.setBackdroppath("https://via.placeholder.com/300x450");
		        }
		        images.add(image);
			}
			
		}
			  
		// 검색 결과와 페이징 정보를 request에 저장
		req.setAttribute("images", images);
		req.setAttribute("imagesMap", movieImagesMap);
		req.setAttribute("genres", genres);
		req.setAttribute("language", language);
		
		req.setAttribute("gno", gno);
		req.setAttribute("lang", language);
		req.getRequestDispatcher("/WEB-INF/views/movie/movieByLanguage.jsp").forward(req, resp);
	
	}
}
