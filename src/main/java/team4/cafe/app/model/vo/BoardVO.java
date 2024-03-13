package team4.cafe.app.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class BoardVO {
	private int bo_num;
	private String bo_name;
	private int bo_co_num;

	public BoardVO(String bo_name, int bo_co_num) {
		this.bo_name = bo_name;
		this.bo_co_num = bo_co_num;
	}

	public BoardVO(int bo_num, String bo_name, int bo_co_num) {
		this.bo_name = bo_name;
		this.bo_co_num = bo_co_num;
		this.bo_num = bo_num;
	}
}
