package team4.cafe.app.model.vo;

import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CommentVO {

	private int cm_num;
	private String cm_content;
	private Date cm_date;
	private String cm_me_id;
	private int cm_po_num;
	
	private PostVO post;
	
	public CommentVO(int po_num, String content, String me_id) {
		this.cm_po_num = po_num;
		this.cm_content = content;
		this.cm_me_id = me_id;
	}
}