package com.jwallet.jwallet.presentation.home

import androidx.lifecycle.LiveData
import androidx.lifecycle.ViewModel
import com.jwallet.jwallet.data.database.Transaction
import com.jwallet.jwallet.data.repositories.TransactionRepository

class HomeViewModel(repo: TransactionRepository) : ViewModel() {
    private val _transactions = repo.getAllTransactions()
    val transaction: LiveData<List<Transaction>> = _transactions
}