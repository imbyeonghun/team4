package team4.cafe.app.model.vo;

import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class PostVO {
	
	private int po_num;
	private Date po_date;
	private String po_title;
	private String po_content;
	private int po_view;
	private int po_bo_num;
	private String po_me_id;
	private int po_pt_num;
	private String po_bo_name;
	private String po_me_name;
	
	// 지우지 말아주세요
	private int commentCount;
	private BoardVO board;
	
	public PostVO(int bo_num, int pt_num, String title, String userName, String content, Date po_date) {
		this.po_bo_num = bo_num;
		this.po_pt_num = pt_num;
		this.po_title = title;
		this.po_me_id = userName;
		this.po_content = content;
		this.po_date = po_date;
	}
}