package team4.cafe.app.pagination;

public class BoardCriteria extends Criteria {
	private int bo_co_num;

	public BoardCriteria(int page,int perPageNum,int bo_co_num) {
		super(page,perPageNum);
		this.bo_co_num = bo_co_num;
	}
	
}
