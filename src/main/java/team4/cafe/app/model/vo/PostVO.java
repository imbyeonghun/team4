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
	
<<<<<<< HEAD
	public PostVO(int bo_num, String title, String writer, String content, Date po_date) {
		this.po_bo_num = bo_num;
		this.po_title = title;
		this.po_me_id = writer;
		this.po_content = content;
		this.po_date = po_date;
	}
}
=======
	private BoardVO board;
	private int commentCount;

}
>>>>>>> main
