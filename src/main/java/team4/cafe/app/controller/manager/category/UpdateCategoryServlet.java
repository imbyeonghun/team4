package team4.cafe.app.controller.manager.category;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import team4.cafe.app.model.vo.CategoryVO;
import team4.cafe.app.service.BoardService;
import team4.cafe.app.service.BoardServiceImp;


@WebServlet("/manager/category/update")
public class UpdateCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	  private BoardService bs=new BoardServiceImp();
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int co_num;
		try {
			co_num=Integer.parseInt(request.getParameter("num")); 
		} catch (Exception e) {
			co_num=0;
		}
		String co_name=request.getParameter("update");
		CategoryVO category=new CategoryVO(co_num,co_name);
		boolean res=bs.updateCategory(category);
		if(res) {
			request.setAttribute("msg","수정 완료");
		}else {
			request.setAttribute("msg","수정 실패");
		}
		request.setAttribute("url","/manager/category");
		request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
	}

}
