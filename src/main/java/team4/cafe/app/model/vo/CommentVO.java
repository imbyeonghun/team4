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
}