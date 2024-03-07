package team4.cafe.app.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CategoryVO {
	private int co_num;
	private String co_name;
	
	public CategoryVO(int co_num, String co_name) {
		this.co_num = co_num;
		this.co_name = co_name;
	}
}
