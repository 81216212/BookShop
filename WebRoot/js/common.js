function _change() {
	$("#vCode").attr("src", "/cmj/VerifyCodeServlet?" + new Date().getTime());
}