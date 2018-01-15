package com.sapient.tag;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class CheckTag extends SimpleTagSupport {
	private int age;
	private String var;
	
	public void setAge(int age) {
		this.age = age;
	}

	public void setVar(String var) {
		this.var = var;
	}

	@Override
	public void doTag() throws JspException, IOException {
		if(age >= 18)
			getJspContext().setAttribute(var, "<span style='color:blue;margin: 0 auto'>Eligible</span>");
		else
			getJspContext().setAttribute(var, "<span style='color:red;margin: 0 auto'>Not Eligible</span>");
		getJspBody().invoke(null);
	}

}
