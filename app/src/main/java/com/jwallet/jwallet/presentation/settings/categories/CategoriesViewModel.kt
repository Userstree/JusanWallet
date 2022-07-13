package com.jwallet.jwallet.presentation.settings.categories

import androidx.lifecycle.LiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.jwallet.jwallet.R
import com.jwallet.jwallet.data.database.Category
import com.jwallet.jwallet.data.repositories.TransactionRepository
import kotlinx.coroutines.launch

class CategoriesViewModel(
    private val repo: TransactionRepository
) : ViewModel() {


    private val _incomeCategories = repo.getIncomeCategories()
    val incomeCategories: LiveData<List<Category>> = _incomeCategories

    private val _expenseCategories = repo.getExpenseCategories()
    val expenseCategories: LiveData<List<Category>> = _expenseCategories

    init {
        addCategories(createIncomeCategories())
        addCategories(createExpenseCategories())
    }

    fun addCategories(categories: List<Category>) {
        viewModelScope.launch {
            repo.addCategories(categories)
        }
    }

    fun createExpenseCategories(): List<Category> {
        val list = mutableListOf<Category>()
        val type = TransactionRepository.EXPENSE
        list.add(Category("Car", R.drawable.directions_car_48px, type))
        list.add(Category("Bills", R.drawable.receipt_long_48px, type))
        list.add(Category("Entertainment", R.drawable.sports_esports_48px, type))
        list.add(Category("Groceries", R.drawable.shopping_basket_48px, type))
        list.add(Category("Transport", R.drawable.directions_bus_48px, type))
        list.add(Category("Health", R.drawable.favorite_48px, type))
        list.add(Category("Eating out", R.drawable.dining_48px, type))
        list.add(Category("Other", R.drawable.description_48px, type))
        return list
    }

    fun createIncomeCategories(): List<Category> {
        val list = mutableListOf<Category>()
        val type = TransactionRepository.INCOME
        list.add(Category("Salary", R.drawable.wallet_48px, type))
        list.add(Category("Business", R.drawable.store_48px, type))
        list.add(Category("Side job", R.drawable.work_48px, type))
        list.add(Category("Passive", R.drawable.percent_48px, type))
        list.add(Category("Rental", R.drawable.bedroom_parent_48px, type))
        list.add(Category("Dividents", R.drawable.candlestick_chart_48px, type))
        list.add(Category("Other", R.drawable.description_48px, type))
        return list
    }
}