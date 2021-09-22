/**
 * 
 */
package com.code.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.code.entities.Todo;

/**
 * @author Aqeel
 * @version 1.0
 *
 */

@Controller
public class HomeController {
	
	@Autowired
	ServletContext context;

	@RequestMapping("/home")
	public String home(Model model) {
		
		String strValue = "HOME";
		model.addAttribute("page", strValue);
		
		List<Todo> todoList = (List<Todo>) context.getAttribute("list");
		
		model.addAttribute("todoList", todoList);
		
		return "home";
	}
	
	@RequestMapping("/add")
	public String addTodo(Model model) {
		
		Todo todo = new Todo();
		
		String strValue="add";
		model.addAttribute("page", strValue);
		model.addAttribute("todo", todo);
		
		return "home";
	}
	
	@RequestMapping(value="/saveTodo", method=RequestMethod.POST)
	public String saveTodo(@ModelAttribute("todo") Todo t, Model model) {
		System.out.println(t);
		t.setTodoData(new Date());
		List<Todo> todoList = (List<Todo>) context.getAttribute("list");
		todoList.add(t);
		
		model.addAttribute("msg", "successfully added.");
		return "home";
	}
}
