package kr.co.mpago.service;

import java.util.List;

import kr.co.mpago.domain.Cast;
import kr.co.mpago.mapper.CastMapper;
import kr.co.mpago.util.DBUtils;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@NoArgsConstructor(access = AccessLevel.PRIVATE)
public class CastService {
	@Getter
	private static CastService castService = new CastService();
	private CastMapper castMapper = DBUtils.sqlSessionFactory().openSession(true).getMapper(CastMapper.class);
	
	/**
	 * 배우 추가
	 * @param cast
	 */
	public void addCast(Cast cast) {
		castMapper.insertCast(cast);
	}
	
	/**
	 * 배우 단일조회
	 * @param castno
	 * @return cast
	 */
	public Cast getCast(Long castno) {
		return castMapper.selectCast(castno);
	}

	/**
	 * 배우 단일삭제
	 * @param castno
	 * @return true이면 삭제
	 */
	public boolean removeCast(Long castno) {
		return castMapper.deleteCast(castno) > 0;
	}
	
	/**
	 * 배우 단일변경
	 * @param cast
	 * @return true이면 변경
	 */
	public boolean modifyCast(Cast cast) {
		return castMapper.updateCast(cast) > 0;
	}
	
	/**
	 * 배우 리스트조회
	 * @return List<Cast>
	 */
	public List<Cast> getCastList() {
		return castMapper.selectCastList();
	}
	
	
	/**
	 * 통합검색 배우
	 * @param search
	 * @return
	 */
	public List<Cast> getSearch(String search) {
		return castMapper.searchCastMain(search);
	}
	
	/**
	 * 검색결과 배우만
	 * @param search
	 * @return
	 */
	public List<Cast> getSearchList(String search) {
		return castMapper.searchCastList(search);
	}
}
