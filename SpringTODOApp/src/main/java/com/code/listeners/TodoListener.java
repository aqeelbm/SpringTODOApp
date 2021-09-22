/**
 * 
 */
package com.code.listeners;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.code.entities.Todo;

/**
 * @author Aqeel
 * @version 1.0
 *
 */
public class TodoListener implements ServletContextListener {

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		
	}

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		System.out.println("contextInitialized called ....");
		List<Todo> list = new ArrayList<>();
		ServletContext context = sce.getServletContext();
		context.setAttribute("list", list);
	}
	
}
