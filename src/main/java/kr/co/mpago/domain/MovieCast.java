package kr.co.mpago.domain;

import com.google.gson.annotations.SerializedName;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class MovieCast {
	private Long mcno;	// 장르 영화 Mapping Tbl 번호
	
	private Long mno;	// 영화 번호
	
	@SerializedName("id")
	private Long castno;	// 배우 번호
	
	@SerializedName("character")
	private String casting;	// 배우 배역이름
	
	@SerializedName("known_for_department")
	private String castType;	// 타입 (주연, 조연, 감독)
	
	@SerializedName("order")
	private Long order; 	// 상세정보 페이지에서 확인 시 배우 순서 번호
}
