package kr.co.mpago.service;

import java.io.IOException;
import java.util.List;

import com.google.gson.Gson;

import kr.co.mpago.domain.Criteria;
import kr.co.mpago.domain.IndexMovie;
import kr.co.mpago.domain.Movie;
import kr.co.mpago.mapper.MovieMapper;
import kr.co.mpago.util.DBUtils;
import kr.co.mpago.util.MovieJsonDataFetcher;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@NoArgsConstructor(access = AccessLevel.PRIVATE)
public class MovieService {
	@Getter
	private static MovieService movieService = new MovieService();
	private MovieMapper movieMapper = DBUtils.sqlSessionFactory().openSession(true).getMapper(MovieMapper.class);
	
	
	/**
	 * @author gilho
	 * ApiUrl값(실제 https:// 주소값)
	 * @param mno
	 * @param apiKey
	 * @return
	 */
	public String getMovieApiUrl(Long mno, String apiKey) {
		return "https://api.themoviedb.org/3/movie/" + mno + "?language=ko-kr&api_key=" + apiKey;
	}

	/**
	 * JSON 데이터를 파싱하여 데이터베이스에 저장
	 * @author gilho
	 * @param mno
	 * @param apiKey
	 * @param jsonMovieData 
	 * @throws IOException
	 */
	public void addMovieDataFromJson(Long mno, String apiKey, String apiUrl) throws IOException {
		MovieJsonDataFetcher fetcher = new MovieJsonDataFetcher();
		String jsonMovieData = fetcher.fetchJsonData(apiUrl);
		log.info(jsonMovieData);
		if(jsonMovieData != null) {
			Gson gson = new Gson();
			Movie movie = gson.fromJson(jsonMovieData, Movie.class);
			if((movie.getLanguage().equals("en") || movie.getLanguage().equals("ko")) && !movie.getMdate().equals("")) {
				try { movieMapper.insertMovie(movie);} catch (Exception e) {e.printStackTrace();}				
			}
		}
	}
	
	/**
	 * 영화 단일 조회 
	 * @author gilho
	 * @param mno
	 * @return 
	 */
	public Movie getMovie(Long mno) {
		return movieMapper.selectMovie(mno);
	}
	
	/**
	 * 영화 수정
	 * @author gilho
	 * @param movie
	 * @return
	 */
	public boolean modifyMovie(Movie movie) {
		return movieMapper.updateMovie(movie) > 0;
	}
	
	/**
	 * 영화 삭제
	 * @author gilho
	 * @param mno
	 * @return
	 */
	public boolean removeMovie(Long mno) {
		return movieMapper.deleteMovie(mno) > 0;
	}
	/**
	 * 영화 목록 삭제(관리자페이지)
	 * @author youngmin
	 * @param mno
	 * @return
	 */
	public boolean removeAll(List<Long> mnos) {
	    return movieMapper.deleteAll(mnos) > 0;
	}
	/**
	 * 영화 전체 갯수
	 * @return
	 */
	public int findTotal() {
		return movieMapper.selectMovieTotal();
	}
	public int findTotal(Criteria criteria) {
		 if (criteria.getKeyword() == null || criteria.getKeyword().isEmpty()) {
		        return movieMapper.selectMovieTotal(criteria);
		    } else {
		        return movieMapper.getTotalWithKeyword(criteria);
		    }
		}
	
	/**
	 * 영화 전체 가져오기 (날짜 역순)
	 * @author gilho
	 * @return
	 */
	public List<Movie> getMovieList() {
		return movieMapper.selectMovieList();
	}
	/**
	 * 영화 10개 가져오기. 언어별, 날짜 역순
	 * @param language
	 * @return
	 */
	public List<Movie> getTenMovieListByLanguage(String language) {
		return movieMapper.selectTenMovieListByLanguage(language);
	}
	
	public List<Movie> getMovieList(Criteria criteria) {
		return movieMapper.getListWithPaging(criteria);
	}
	
	/**
	 * 언어별 영화 전체 가져오기
	 * @author gilho
	 * @param language
	 * @return
	 */
	public List<Movie> getMovieListByLanguage(String language) {
		return movieMapper.selectMovieListByLanguage(language);
	}
	
	/**
	 * 번호로 영화 제목 가져오기
	 */
	public String getMovieTitle(Long mno) {
		return movieMapper.selectMovieTitle(mno);
	}
	

	/**
	 * 
	 * 영화제목 검색
	 * kht
	 * @return
	 */
	public List<Movie> getSearch(String search) {
		return movieMapper.searchMoviMain(search);
	}
	// 영화만 검색
	public List<Movie> getSearchMoviList(String search) {
		return movieMapper.searchMoviList(search);
	}
	
	/**
	 * 메인에서 사용하는 영화 리스트
	 * @return
	 */
	public List<IndexMovie> getIndexMovieList() {
		return movieMapper.selectIndexMovieList();
	}
}
