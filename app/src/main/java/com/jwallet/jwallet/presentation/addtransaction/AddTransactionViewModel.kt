package com.jwallet.jwallet.presentation.addtransaction

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import com.jwallet.jwallet.data.database.Category
import com.jwallet.jwallet.data.repositories.TransactionRepository

class AddTransactionViewModel(private val repo: TransactionRepository) : ViewModel() {

    enum class CategoryType { INCOME, EXPENSE, TRANSFER }

    private val _categoryType = MutableLiveData<CategoryType>()
    val categoryType: LiveData<CategoryType> = _categoryType

    fun setCategoryType(categoryType: CategoryType) {
        _categoryType.value = categoryType
    }

    fun getCategories(): LiveData<List<Category>>? {
        val type = _categoryType.value ?: return null
        val list = when (type) {
            CategoryType.INCOME -> repo.getIncomeCategories()
            CategoryType.EXPENSE -> repo.getExpenseCategories()
            CategoryType.TRANSFER -> repo.getTransferCategories()
        }
        return list
    }

    fun getCategoryTypeString() : String {
        return when(categoryType.value) {
            CategoryType.INCOME -> TransactionRepository.INCOME
            CategoryType.EXPENSE -> TransactionRepository.EXPENSE
            CategoryType.TRANSFER -> TransactionRepository.TRANSFER
            null -> ""
        }
    }
}