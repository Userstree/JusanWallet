package com.jwallet.jwallet.presentation.home

import androidx.lifecycle.ViewModel
import com.jwallet.jwallet.data.database.Category
import com.jwallet.jwallet.data.database.Transaction

class HomeViewModel : ViewModel() {

    private var counterT = 0L
    private var counterC = 0L

    fun getCategory() : Category {
        return Category( "Bills & Pills", 0)
    }

    fun getCategoriesList(): List<Category> {
        val list = mutableListOf<Category>()
        repeat(11) { list.add(Category( "category$it", it)) }
        return list
    }

    fun getTransaction() : Transaction {
        return Transaction(counterT, "", "Coffee Boom", "Cafe", 12.10, "")
    }

    fun getTransactionsList(): List<Transaction> {
        val list = mutableListOf<Transaction>()
        repeat(20) {
            list.add(Transaction(counterT++, "", "Starbucks", "Coffee Company", 30.05, ""))
        }
        return list
    }
}