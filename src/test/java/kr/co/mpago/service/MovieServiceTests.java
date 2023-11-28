package kr.co.mpago.service;

import java.io.IOException;

import org.junit.Test;

import com.google.gson.Gson;

import kr.co.mpago.domain.Movie;
import kr.co.mpago.util.MovieJsonDataFetcher;
import lombok.extern.log4j.Log4j;

@Log4j
public class MovieServiceTests {
	MovieService movieService = MovieService.getMovieService();
	MovieJsonDataFetcher fetcher = new MovieJsonDataFetcher();
	
	//테스트 성공
	@Test
	public void testgetMovieApiUrl() {
		Long mno = 807172L;
		String apiKey = "60f92fc317ba11184216e66058a386e1";
		String apiurl = movieService.getMovieApiUrl(mno, apiKey);
		log.info(apiurl);
	}
	
	//테스트 성공
	@Test
	public void testFetchJsonData() throws IOException {
		Long mno = 807172L;
		String apiKey = "60f92fc317ba11184216e66058a386e1";
		log.info(apiKey);
		String apiUrl = movieService.getMovieApiUrl(mno, apiKey);
		log.info(apiUrl);
		String jsonMovieData = fetcher.fetchJsonData(apiUrl);
		log.info(jsonMovieData);
	}
	
	// 영화 여러개 넣기
	// 3000번까지 들어감. (성공)
	@Test
	public void testAddMovieDatasFromJson() throws IOException {
		Long[] type = {492008l, 961268l, 606403l, 851644l, 290098l, 799379l, 852881l, 496243l, 750209l, 581528l, 615173l, 396535l, 633374l, 588108l, 204553l, 387824l, 995612l, 397567l, 843794l, 601796l, 390845l, 705996l, 800345l, 481871l, 619803l, 727209l, 670l, 399905l, 938008l, 727340l, 729854l, 110415l, 707610l, 518068l, 59421l, 474412l, 626872l, 482036l, 897160l, 333167l, 581392l, 773867l, 286687l, 479718l, 614696l, 508642l, 698779l, 340819l, 530254l, 75432l, 736545l, 628704l, 386716l, 581387l, 269955l, 736732l, 865463l, 784941l, 200085l, 49797l, 255709l, 16318l, 4552l, 716263l, 581389l, 965143l, 629028l, 826945l, 849869l, 372921l, 491584l, 662237l, 33196l, 405817l, 1148154l, 955555l, 845222l, 11423l, 293670l, 122126l};
		for (Long mno : type) {
//			Long mno = 808175l;
			String apiKey = "60f92fc317ba11184216e66058a386e1";
			log.info(apiKey);
			String apiUrl = movieService.getMovieApiUrl(mno, apiKey);
			String jsonMovieData = fetcher.fetchJsonData(apiUrl);
			if(jsonMovieData != null) {
				log.info(jsonMovieData);
				
				Gson gson = new Gson();
				Movie movie = gson.fromJson(jsonMovieData, Movie.class);
				log.info(movie);
				// 영어이거나 한국어인 영화만 넣는다. + date 없는값은 안넣음.
				if((movie.getLanguage().equals("en") || movie.getLanguage().equals("ko")) && !movie.getMdate().equals("")) {//|| !((String) movie.getMdate() == "")) {
					try {
//						movieMapper.insertMovie(movie);			
					} catch (Exception e) {
						// TODO: handle exception
					}
				}
				else {
					log.info("returned");
				}	
			} else {
				log.info("failed");
			}
		}
	}
	
	// 단일 추가 (성공)
	@Test
	public void testAddMovieDataFromJson() throws IOException {
			Long mno = 21l;
			String apiKey = "60f92fc317ba11184216e66058a386e1";
			log.info(apiKey);
			String apiUrl = movieService.getMovieApiUrl(mno, apiKey);
			//-------------------------------------------------------------
			String jsonMovieData = fetcher.fetchJsonData(apiUrl);
			if(jsonMovieData != null) {
				log.info(jsonMovieData);
				
				Gson gson = new Gson();
				Movie movie = gson.fromJson(jsonMovieData, Movie.class);
				log.info(movie);
				log.info(movie.getLanguage());
				log.info(movie.getLanguage().equals("en"));
				
				
			}
			//---------------------------------------------------------------
		}
	
	// 단일추가2 (성공)
	@Test
	public void testAddMoive3() throws IOException {
		Long[] type = {492008l, 961268l, 606403l, 851644l, 290098l, 799379l, 852881l, 496243l, 750209l, 581528l, 615173l, 396535l, 633374l, 588108l, 204553l, 387824l, 995612l, 397567l, 843794l, 601796l, 390845l, 705996l, 800345l, 481871l, 619803l, 727209l, 670l, 399905l, 938008l, 727340l, 729854l, 110415l, 707610l, 518068l, 59421l, 474412l, 626872l, 482036l, 897160l, 333167l, 581392l, 773867l, 286687l, 479718l, 614696l, 508642l, 698779l, 340819l, 530254l, 75432l, 736545l, 628704l, 386716l, 581387l, 269955l, 736732l, 865463l, 784941l, 200085l, 49797l, 255709l, 16318l, 4552l, 716263l, 581389l, 965143l, 629028l, 826945l, 849869l, 372921l, 491584l, 662237l, 33196l, 405817l, 1148154l, 955555l, 845222l, 11423l, 293670l, 122126l};
		for (Long mno : type) {
		String apiKey = "60f92fc317ba11184216e66058a386e1";
		String apiUrl = movieService.getMovieApiUrl(mno, apiKey);
		log.info(apiUrl);
		log.info(fetcher.fetchJsonData(apiUrl));
		movieService.addMovieDataFromJson(mno, apiKey, movieService.getMovieApiUrl(mno, apiKey));
		log.info(movieService.getMovie(mno));
		}
	}
	
	// 영화 단일조회test (성공)
	@Test
	public void testFindMovie() {
		movieService.getMovie(1l);
	}
	
	@Test
	public void testFindTotal() {
		movieService.findTotal();
	}
	
	// 영화 수정test (성공)
	@Test
	public void testModifyMovie() {
		Movie movie = movieService.getMovie(1l);
		log.info(movie);
		movie.setTitle("test수정된영화");
		movieService.modifyMovie(movie);
		log.info(movieService.getMovie(1l));
	}
	
	// 영화 날짜 역순으로 가져오기 (성공)
	@Test
	public void testGetMovieList() {
		movieService.getMovieList();
	}

	// 영화 날짜 역순 + 언어별로 가져오기 (성공)
	@Test
	public void testGetMovieListByLanguage() {
		String language = "ko";
		movieService.getMovieListByLanguage(language);
	}
	
	// 번호로 영화 제목 가져오기 (성공)
	@Test
	public void testGetMovieTitle() {
		movieService.getMovieTitle(1416l);
	}
	
	@Test
	public void testGetIndexMovieList() {
		movieService.getIndexMovieList();
	}
	
}
