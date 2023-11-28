package kr.co.mpago.domain;

import java.util.ArrayList;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Criteria {
	@Builder.Default
	private int pageNum = 1; // 페이지 번호
	@Builder.Default
	private int amount = 10; // 페이지당 보여지는 갯수
	@Builder.Default
	private int category = 1; // 카테고리 
	@Builder.Default
	private String type = ""; // 검색 조건
	@Builder.Default
	private String keyword =""; // 검색 키워드
	
	public int getOffset() {
		return (pageNum - 1) * amount;
	}
	
	public String getLink() {
		List<String>list = new ArrayList<>();
		list.add("pageNum="+pageNum);
		list.add("amount="+amount);
		list.add("category="+category);
		list.add("type="+type);
		list.add("keyword="+keyword);
		return String.join("&", list);		
	}
	public String getPageLink() {
		List<String>list = new ArrayList<>();
		list.add("amount="+amount);
		list.add("category="+category);
		list.add("type="+type);
		list.add("keyword="+keyword);
		return String.join("&", list);		
	}
	public String getPagesLink() {
		List<String>list = new ArrayList<>();
		list.add("pageNum="+pageNum);
		list.add("amount="+amount);
		list.add("keyword="+keyword);
	return String.join("&", list);
	}
	public String[] getTypeArr() {
		return type.split(",");
	}

	public Criteria(int i, int j, String string) {
		return;
	}
}