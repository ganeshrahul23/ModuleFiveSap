package com.sapient.tag;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class DisplayTag extends SimpleTagSupport{

	@Override
	public void doTag() throws JspException, IOException {
		JspWriter out = getJspContext().getOut();
		out.println("<h1 style='background-color:wheat;color:orange;padding:10px;text-align:center'>");
		getJspBody().invoke(null);
		out.println("</h1>");		
	}	
}