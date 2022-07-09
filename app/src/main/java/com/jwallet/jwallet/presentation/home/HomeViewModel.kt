package com.jwallet.jwallet.presentation.home

import androidx.lifecycle.ViewModel
import com.jwallet.jwallet.domain.models.SpendingCategory
import com.jwallet.jwallet.domain.models.Transaction

class HomeViewModel : ViewModel() {

    private var counterT = 0L
    private var counterC = 0L

    fun getCategoriesList(): List<SpendingCategory> {
        val list = mutableListOf<SpendingCategory>()
        repeat(11) { list.add(SpendingCategory(counterC++, "category$it", it)) }
        return list
    }

    fun getTransactionsList(): List<Transaction> {
        val list = mutableListOf<Transaction>()
        repeat(20) {
            list.add(Transaction(counterT++, 0, "Starbucks", "Coffee Company", 30.05, ""))
        }
        return list
    }
}