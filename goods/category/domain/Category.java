package www.cmj.goods.category.domain;

import java.util.List;

/**
 * 分类模块的实体类
 */
public class Category {
	private String cid;// 主键
	private String cname;// 分类名称
	private Category parent;// 父分类
	private List<Category> children;// 子分类

	public String getCid() {
		return cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public Category getParent() {
		return parent;
	}

	public void setParent(Category parent) {
		this.parent = parent;
	}

	public List<Category> getChildren() {
		return children;
	}

	public void setChildren(List<Category> children) {
		this.children = children;
	}
}
