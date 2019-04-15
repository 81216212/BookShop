package www.cmj.goods.admin.order;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import www.cmj.goods.order.domain.Order;
import www.cmj.goods.order.service.OrderService;
import www.cmj.goods.pager.PageBean;
import www.cmj.goods.user.domain.User;
import www.cmj.servlet.BaseServlet;

public class AdminOrderServlet extends BaseServlet {

	private static final long serialVersionUID = 1L;
	private OrderService orderService = new OrderService();
	
	/**
	 * 获取当前页码
	 */
	private int getPc(HttpServletRequest req) {
		int pc = 1;
		String param = req.getParameter("pc");
		if(param != null && !param.trim().isEmpty()) {
			try {
				pc = Integer.parseInt(param);
			} catch(RuntimeException e) {}
		}
		return pc;
	}
	
	/**
	 * 截取url，页面中的分页导航中需要使用它做为超链接的目标！
	 */
	/*
	 * http://localhost:8080/goods/BookServlet?methed=findByCategory&cid=xxx&pc=3
	 * /goods/BookServlet + methed=findByCategory&cid=xxx&pc=3
	 */
	private String getUrl(HttpServletRequest req) {
		String url = req.getRequestURI() + "?" + req.getQueryString();
		/*
		 * 如果url中存在pc参数，截取掉，如果不存在那就不用截取。
		 */
		int index = url.lastIndexOf("&pc=");
		if(index != -1) {
			url = url.substring(0, index);
		}
		return url;
	}
	
	/**
	 * 查看所有订单
	 */
	public String findAll(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		int pc = getPc(req);
		String url = getUrl(req);
		PageBean<Order> pb = orderService.findAll(pc);
		pb.setUrl(url);
		req.setAttribute("pb", pb);
		req.setAttribute("status", "0");
		req.setAttribute("order", "时间排序");
		return "f:/adminjsps/admin/order/list.jsp";
	}
	
	/**
	 * 查看所有订单按金额排序
	 */
	public String findAllmoney(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		int pc = getPc(req);
		String url = getUrl(req);
		PageBean<Order> pb = orderService.findAllmoney(pc);
		pb.setUrl(url);
		req.setAttribute("pb", pb);
		req.setAttribute("order", "金额排序");
		return "f:/adminjsps/admin/order/list.jsp";
	}
	
	/**
	 * 按订单号查询
	 */
	public String findByoid(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		int pc = getPc(req);
		String url = getUrl(req);
		String oid = req.getParameter("oid");
		PageBean<Order> pb = orderService.findByoid(oid, pc);
		pb.setUrl(url);
		req.setAttribute("pb", pb);
		req.setAttribute("dingdanoid", oid);
		req.setAttribute("order", "时间排序");
		return "f:/adminjsps/admin/order/list.jsp";
	}
	
	/**
	 * 按订单时间查询
	 */
	public String findBytime(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		int pc = getPc(req);
		String url = getUrl(req);
		String ordertime = req.getParameter("ordertime");
		PageBean<Order> pb = orderService.findBytime(ordertime, pc);
		pb.setUrl(url);
		req.setAttribute("pb", pb);
		req.setAttribute("dingdantime", ordertime);
		req.setAttribute("order", "时间排序");
		return "f:/adminjsps/admin/order/list.jsp";
	}
	
	/**
	 * 按状态查询
	 */
	public String findByStatus(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		int pc = getPc(req);
		String url = getUrl(req);
		int status = Integer.parseInt(req.getParameter("status"));
		PageBean<Order> pb = orderService.findByStatus(status, pc);
		pb.setUrl(url);
		req.setAttribute("pb", pb);
		req.setAttribute("status", status);
		req.setAttribute("order", "时间排序");
		return "f:/adminjsps/admin/order/list.jsp";
	}
	
	/**
	 * 按状态查询并且按金额排序
	 */
	public String findByStatusmoney(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		int pc = getPc(req);
		String url = getUrl(req);
		int status = Integer.parseInt(req.getParameter("status"));
		PageBean<Order> pb = orderService.findByStatusmoney(status, pc);
		pb.setUrl(url);
		req.setAttribute("pb", pb);
		req.setAttribute("status", status);
		req.setAttribute("order", "金额排序");
		return "f:/adminjsps/admin/order/list.jsp";
	}
	
	/**
	 * 按状态查询并且按时间排序
	 */
	public String findByStatustime(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		int pc = getPc(req);
		String url = getUrl(req);
		int status = Integer.parseInt(req.getParameter("status"));
		PageBean<Order> pb = orderService.findByStatus(status, pc);
		pb.setUrl(url);
		req.setAttribute("pb", pb);
		req.setAttribute("status", status);
		req.setAttribute("order", "时间排序");
		return "f:/adminjsps/admin/order/list.jsp";
	}
	
	
	/**
	 * 查看订单详细信息
	 */
	public String load(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String oid = req.getParameter("oid");
		Order order = orderService.load(oid);
		User owner = orderService.loaduser(oid);
		order.setOwner(owner);
		req.setAttribute("order", order);
		String btn = req.getParameter("btn");
		req.setAttribute("btn", btn);
		return "f:/adminjsps/admin/order/desc.jsp";
	}
	
	/**
	 * 取消订单
	 */
	public String cancel(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String oid = req.getParameter("oid");
		/*
		 * 校验订单状态
		 */
		int status = orderService.findStatus(oid);
		if(status != 1) {
			req.setAttribute("code", "error");
			req.setAttribute("msg", "状态不对，无法取消！");
			return "f:/adminjsps/msg.jsp";
		}
		orderService.updateStatus(oid, 5);//设置状态为取消！
		req.setAttribute("code", "success");
		req.setAttribute("msg", "您的订单已取消！");
		return "f:/adminjsps/msg.jsp";		
	}
	
	/**
	 * 发货功能
	 */
	public String deliver(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String oid = req.getParameter("oid");
		/*
		 * 校验订单状态
		 */
		int status = orderService.findStatus(oid);
		if(status != 2) {
			req.setAttribute("code", "error");
			req.setAttribute("msg", "状态不对，无法发货！");
			return "f:/adminjsps/msg.jsp";
		}
		orderService.updateStatus(oid, 3);//设置状态为取消！
		req.setAttribute("code", "success");
		req.setAttribute("msg", "您的订单已发货，请查看物流！");
		return "f:/adminjsps/msg.jsp";		
	}
	
	public String delete(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String oid = req.getParameter("oid");
		orderService.delete(oid);
		req.setAttribute("success", "删除订单成功");
		return "f:/adminjsps/admin/order/msg.jsp";
	}
	
}
