package com.jwallet.jwallet.presentation.settings.categories

import androidx.lifecycle.LiveData
import androidx.lifecycle.ViewModel
import com.jwallet.jwallet.data.database.Category
import com.jwallet.jwallet.data.repositories.TransactionRepository

class CategoriesViewModel(
    repo: TransactionRepository
) : ViewModel() {

    private val _incomeCategories = repo.getIncomeCategories()
    val incomeCategories: LiveData<List<Category>> = _incomeCategories

    private val _expenseCategories = repo.getExpenseCategories()
    val expenseCategories: LiveData<List<Category>> = _expenseCategories
}