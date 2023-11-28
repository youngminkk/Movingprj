package kr.co.mpago.domain;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.google.gson.annotations.SerializedName;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class Movie {
	@SerializedName("id")
	private Long mno;	// 영화 번호
	
	@SerializedName("title")
	private String title;	// 영화 제목
	
	@SerializedName("runtime")
	private Integer runningTime; // 영화의 러닝타임.
	
	@SerializedName("release_date")
	private Date mdate;	// 영화 출시일
	
	private String rated;	// 시청 연령
	
	@SerializedName("original_language")
	private String language;	// 언어
	
	@SerializedName("overview")
	private String outline;	// 개요
	
	private String status;	// 상태(개봉 여부 등)
	
	private String img; // 검색 이미지
	
	/**
	 * @return mdate 필드의 날짜를 "yyyy-MM-dd" 형식의 문자열로 반환하는 getter
	 */
	public String getFormattedMdate() {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy/MM/dd");
        return simpleDateFormat.format(mdate);
	}
	
	/**
	 * mdate 작성시 Date 객체로 변환하고 mdate 필드에 저장
	 * @param formattedMdate ("yyyy-MM-dd" 꼴의 문자열)
	 */
	public void setFormattedMdate(String formattedMdate) {
	    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy/MM/dd");
	        try {
				this.mdate = simpleDateFormat.parse(formattedMdate);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

	}
	


}
