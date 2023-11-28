package kr.co.mpago.domain;

import java.util.List;

import com.google.gson.annotations.SerializedName;

import lombok.Data;

@Data
public class Casts {
	@SerializedName("cast")
	private List<Cast> casts;
	
	@SerializedName("crew")
	private List<Cast> crews;
}
