package com.lsousa.safetravels.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lsousa.safetravels.models.Expense;
import com.lsousa.safetravels.repos.ExpenseRepo;

@Service
public class ExpenseService {
	//Instantiates a repo object so we can peform crud queries
//	private final ExpenseRepo repo;
//	
//	public ExpenseService(ExpenseRepo repo) {
//		this.repo = repo;
//	}
	
	//Shorthand for the above
	@Autowired
	private ExpenseRepo repo;

	// ========== Create / Update ================

	public Expense save(Expense e) {
		return repo.save(e);
	}

	// ========== Read ===========================

	public List<Expense> getAllExpenses() {
		return repo.findAll();
	}
	
	public Expense getOneExpense(Long id) {
		Optional<Expense> optionalExpense = repo.findById(id);
		
		if (optionalExpense.isPresent()) {
			return optionalExpense.get();
		} else {
			return null;
		}
	}

	// ========== Delete =========================

	public void deleteOneExpense(Long id) {
		repo.deleteById(id);
	}

	// ========== Relationships ==================

}
