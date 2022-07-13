package com.jwallet.jwallet.presentation.home

import androidx.lifecycle.ViewModel
import com.jwallet.jwallet.data.database.Category
import com.jwallet.jwallet.data.database.Transaction

class HomeViewModel : ViewModel() {

    private var counterT = 0L

    fun getTransactionsList(): List<Transaction> {
        val list = mutableListOf<Transaction>()
        repeat(20) {
            list.add(Transaction(counterT++, "", "Starbucks", "Coffee Company", 30.05, ""))
        }
        return list
    }
}