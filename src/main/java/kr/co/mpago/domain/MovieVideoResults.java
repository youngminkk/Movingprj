package kr.co.mpago.domain;

import java.util.List;

import com.google.gson.annotations.SerializedName;

import lombok.Data;

@Data
public class MovieVideoResults {
	@SerializedName("results")
	private List<MovieVideo> results;
}
