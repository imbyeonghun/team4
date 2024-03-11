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
	private CommentVO comment;
}
