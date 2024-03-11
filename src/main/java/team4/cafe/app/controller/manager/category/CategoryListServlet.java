package team4.cafe.app.controller.manager.category;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import team4.cafe.app.model.vo.CategoryVO;
import team4.cafe.app.service.BoardService;
import team4.cafe.app.service.BoardServiceImp;


@WebServlet("/manager/category/select")
public class CategoryListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService bs=new BoardServiceImp();
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<CategoryVO> list=bs.getCategoryList();
		JSONObject jobj = new JSONObject();
		jobj.put("list",list);
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(jobj);
	}

}
