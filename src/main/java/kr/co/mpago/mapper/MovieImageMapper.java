package kr.co.mpago.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import kr.co.mpago.domain.MovieImage;

// 테스트 완료
public interface MovieImageMapper {
	
	MovieImage selectMovieImage(String backdroppath); // 이미지 select (
	void insertMovieImage(MovieImage movieImage); // 영화 이미지 추가
	int deleteMovieImage(String backdroppath); // 영화 이미지 삭제
	int deleteAllMovieImage(Long mno); // 영화 이미지 전체삭제
	int updateMovieImage(MovieImage movieImage);
	List<MovieImage> selectMovieImageList(Long mno);
	MovieImage selectMovieImageListByImageCategory(@Param("mno") Long mno, @Param("imagecate") String imagecate);
	int selectMovieImageTotal(Long mno); // mno번 영화의 이미지 갯수
	List<Map<String, Object>> selectGenreListByMovieWithImages(Long gno);
	List<Map<String, Object>> selectMovieGenreImg(String imagecate);
	
	
	
}
