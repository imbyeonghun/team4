package cafe.app.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class MemberVO {
	private String me_id;
	private String me_pw;
	private String me_email;
	private String me_name;
	private int me_loginCount;
	private int me_fail;
	private String me_st_state;
	private String me_gr_name;
}
