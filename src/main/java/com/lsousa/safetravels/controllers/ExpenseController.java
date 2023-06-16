package com.lsousa.safetravels.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.lsousa.safetravels.models.Expense;
import com.lsousa.safetravels.services.ExpenseService;

import jakarta.validation.Valid;

@Controller
public class ExpenseController {
	@Autowired
	private ExpenseService service;

	// ========== Display ========================

	@GetMapping("/")
	public String index(Model model, @ModelAttribute("expense") Expense expense) {
		model.addAttribute("listOfExpenses", service.getAllExpenses());
		return "index.jsp";
	}
	
	@GetMapping("/expenses/{id}")
	public String details(Model model, @PathVariable("id") Long id) {
		model.addAttribute("expense", service.getOneExpense(id));
		return "details.jsp";
	}
	
	@GetMapping("/expenses/{id}/edit")
	public String editExpense(Model model, @PathVariable("id") Long id) {
		model.addAttribute("expense", service.getOneExpense(id));
		return "edit.jsp";
	}

	// ========== Action =========================
	
	@PostMapping("/expenses")
	public String createExpense(@Valid @ModelAttribute("expense") Expense expense, BindingResult result, Model model) {
		model.addAttribute("listOfExpenses", service.getAllExpenses());
		if (result.hasErrors()) {
			return "index.jsp";
		}
		
		service.save(expense);
		
		return "redirect:/";
	}
	
	@PutMapping("/expenses/{id}")
	public String update(@Valid @ModelAttribute("expense") Expense expense, BindingResult result, Model model) {
		if (result.hasErrors()) {
			model.addAttribute("expense", expense);
			return "edit.jsp";
		}
		
		Expense editedExpense = service.save(expense);
		
		return "redirect:/expenses/" + editedExpense.getId();
	}
	
	@DeleteMapping("/expenses/{id}")
	public String deleteExpense(@PathVariable("id") Long id) {
		service.deleteOneExpense(id);
		
		return "redirect:/";
	}
}
