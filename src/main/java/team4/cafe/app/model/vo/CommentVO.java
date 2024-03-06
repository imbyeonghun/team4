package team4.cafe.app.model.vo;

import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
public class CommentVO {
	private int co_num;
	private String co_content;
	private Date co_date;
	private String co_id;
	private int co_po_num;
}
