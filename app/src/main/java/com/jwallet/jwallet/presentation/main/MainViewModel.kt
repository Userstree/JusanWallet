package com.jwallet.jwallet.presentation.main

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.jwallet.jwallet.R
import com.jwallet.jwallet.data.database.Category
import com.jwallet.jwallet.data.database.Transaction
import com.jwallet.jwallet.data.repositories.TransactionRepository
import kotlinx.coroutines.launch

class MainViewModel(private val repo: TransactionRepository) : ViewModel() {

    init {
        addCategories(createIncomeCategories())
        addCategories(createExpenseCategories())
        addCategories(createTransferCategories())
    }

    fun addCategories(categories: List<Category>) {
        viewModelScope.launch {
            repo.addCategories(categories)
        }
    }

    fun addTransaction(transaction: Transaction) {
        viewModelScope.launch {
            repo.addTransaction(transaction)
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

    fun createTransferCategories(): List<Category> {
        val list = mutableListOf<Category>()
        val type = TransactionRepository.TRANSFER
        list.add(Category("Wallets", R.drawable.wallet_48px, type))
        list.add(Category("Withdrawal", R.drawable.payments_48px, type))
        return list
    }

}