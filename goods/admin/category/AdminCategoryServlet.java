package www.cmj.goods.admin.category;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import www.cmj.commons.CommonUtils;
import www.cmj.goods.book.service.BookService;
import www.cmj.goods.category.domain.Category;
import www.cmj.goods.category.service.CategoryService;
import www.cmj.servlet.BaseServlet;

public class AdminCategoryServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	private CategoryService categoryService = new CategoryService();
	private BookService bookService = new BookService(); 
	
	/**
	 * 查询所有分类
	 */
	public String findAll(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setAttribute("parents", categoryService.findAll());
		return "f:/adminjsps/admin/category/list.jsp";
	}
	
	/**
	 * 查询是否存在分类名称
	 */
	public String findcname(String cname) {
		String findcname = categoryService.findcname(cname);
		return findcname;
	}
	
	/**
	 * 添加一级分类
	 */
	public String addParent(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String cname = req.getParameter("fucname");
		String findcname = findcname(cname);
		if (findcname !=null) {
			req.setAttribute("msg", "该分类已经存在");
			return "/admin/AdminCategoryServlet?method=findAll";
		}else {
			Category parent = new Category();
			parent.setCname(cname);
			parent.setCid(CommonUtils.uuid());//设置cid
			categoryService.add(parent);
		}
		return findAll(req, resp);
	}
	
	/**
	 * 添加第二分类：第一步
	 */
	public String addChild(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		Category child = CommonUtils.toBean(req.getParameterMap(), Category.class);
		child.setCid(CommonUtils.uuid());
		String pid = req.getParameter("pid");
		String cname = req.getParameter("ercname");
		Category parent = new Category();
		parent.setCid(pid);
		child.setParent(parent);
		child.setCname(cname);
		String findcname = findcname(cname);
		if (findcname !=null) {
			req.setAttribute("cuo", "该分类已存在");
			return "/admin/AdminCategoryServlet?method=findAll";
		}else {
			categoryService.add(child);
			req.setAttribute("dui", "保存成功");
		}
		return findAll(req, resp);
	}
	
	/**
	 * 添加第二分类：第二步
	 */
	public String addChildPre(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String pid = req.getParameter("pid");//当前点击的父分类id
		List<Category> parents = categoryService.findParents();
		req.setAttribute("pid", pid);
		req.setAttribute("parents", parents);
		return "f:/adminjsps/admin/category/add2.jsp";
	}
	
	/**
	 * 修改一级分类：第一步
	 */
	public String editParentPre(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		/*
		 * 1. 获取链接中的cid
		 * 2. 使用cid加载Category
		 * 3. 保存Category
		 * 4. 转发到edit.jsp页面显示Category
		 */
		String cid = req.getParameter("cid");
		Category parent = categoryService.load(cid);
		req.setAttribute("parent", parent);
		return "f:/adminjsps/admin/category/edit.jsp";
	}
	
	/**
	 * 修改一级分类：第二步
	 */
	public String editParent(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		/*
		 * 1. 封装表单数据到Category中
		 * 2. 调用service方法完成修改
		 * 3. 转发到list.jsp显示所有分类（return findAll();）
		 */
		String cname = req.getParameter("fucname2");
		String cid = req.getParameter("cid");
		String findcname = findcname(cname);
		if (findcname !=null) {
			req.setAttribute("cuo", "该分类已存在");
			return "/admin/AdminCategoryServlet?method=findAll";
		}else {
			Category parent = new Category();
			parent.setCname(cname);
			parent.setCid(cid);
			categoryService.edit(parent);
			req.setAttribute("dui", "保存成功");
		}
		return findAll(req, resp);
	}
	
	/**
	 * 修改二级分类：第一步
	 */
	public String editChildPre(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		/*
		 * 1. 获取链接参数cid，通过cid加载Category，保存之
		 * 2. 查询出所有1级分类，保存之
		 * 3. 转发到edit2.jsp
		 */
		String cid = req.getParameter("cid");
		Category child = categoryService.load(cid);
		req.setAttribute("child", child);
		req.setAttribute("parents", categoryService.findParents());
		return "f:/adminjsps/admin/category/edit2.jsp";
	}
	
	/**
	 * 修改二级分类：第二步
	 */
	public String editChild(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		/*
		 * 1. 封装表单参数到Category child
		 * 2. 把表单中的pid封装到child, ...
		 * 3. 调用service.edit()完成修改
		 * 4. 返回到list.jsp
		 */
		String pid = req.getParameter("pid");
		
		String cname = req.getParameter("ercname2");
		String cid = req.getParameter("cid");
		String findcname = findcname(cname);
		if (findcname !=null) {
			req.setAttribute("cuo", "该分类已存在");
			return "/admin/AdminCategoryServlet?method=findAll";
		}else {
			Category child = new Category();
			Category parent = new Category();
			parent.setCid(pid);
			child.setParent(parent);
			child.setCname(cname);
			child.setCid(cid);
			categoryService.edit(child);
			req.setAttribute("dui", "保存成功");
		}
		return findAll(req, resp);
	}
	
	/**
	 * 删除一级分类
	 */
	public String deleteParent(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		/*
		 * 1. 获取链接参数cid，它是一个1级分类的id
		 * 2. 通过cid，查看该父分类下子分类的个数
		 * 3. 如果大于零，说明还有子分类，不能删除。保存错误信息，转发到msg.jsp
		 * 4. 如果等于零，删除之，返回到list.jsp
		 */
		String cid = req.getParameter("cid");
		int cnt = categoryService.findChildrenCountByParent(cid);
		if(cnt > 0) {
			req.setAttribute("msg", "该分类下还有子分类，不能删除！");
			return "f:/adminjsps/admin/category/msg.jsp";
		} else {
			categoryService.delete(cid);
			return findAll(req, resp);
		}
	}
	
	/**
	 * 删除2级分类
	 */
	public String deleteChild(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		/*
		 * 1. 获取cid，即2级分类id
		 * 2. 获取该分类下的图书个数
		 * 3. 如果大于零，保存错误信息，转发到msg.jsp
		 * 4. 如果等于零，删除之，返回到list.jsp
		 */
		String cid = req.getParameter("cid");
		int cnt = bookService.findBookCountByCategory(cid);
		if(cnt > 0) {
			req.setAttribute("msg", "该分类下还存在图书，不能删除！");
			return "f:/adminjsps/admin/category/msg.jsp";
		} else {
			categoryService.delete(cid);
			return findAll(req, resp);
		}
	}
}
