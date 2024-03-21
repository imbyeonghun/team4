package team4.cafe.app.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;

import team4.cafe.app.model.vo.MemberVO;

@WebFilter({"/manager/board","/manager/member","/manager/category","/manager/postType"})
public class ManagerFilter extends HttpFilter implements Filter {

	private static final long serialVersionUID = 1L;
	private String admin="운영자";
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest httpServletRequest = (HttpServletRequest)request;
		MemberVO user = (MemberVO)httpServletRequest.getSession().getAttribute("user");	
		if(user==null||!user.getMe_gr_name().equals(admin)) {
			request.setAttribute("msg", "운영자만 사용 가능합니다.");
			request.setAttribute("url", "");
			request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(httpServletRequest, response);
			return;
		}
		chain.doFilter(request, response);
	}
}
