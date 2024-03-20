package team4.cafe.app.pagination;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CommentCriteria extends Criteria{

	private int poNum;
	
	public CommentCriteria(int page, int perPageNum, int po_num) {
		super(page, perPageNum);
		this.poNum = po_num;
	}
}
