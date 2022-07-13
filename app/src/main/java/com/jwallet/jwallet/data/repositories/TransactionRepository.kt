package com.jwallet.jwallet.data.repositories

import androidx.lifecycle.LiveData
import com.jwallet.jwallet.data.database.Category
import com.jwallet.jwallet.data.database.TransactionDatabase
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext

class TransactionRepository(private val database: TransactionDatabase) {

    fun getIncomeCategories(): LiveData<List<Category>> {
        return database.categoryDao.getCategoriesByType(INCOME)
    }

    fun getExpenseCategories(): LiveData<List<Category>> {
        return database.categoryDao.getCategoriesByType(EXPENSE)
    }

    suspend fun addCategory(category: Category) {
        withContext(Dispatchers.IO) {
            database.categoryDao.add(category)
        }
    }

    suspend fun addCategories(categories: List<Category>) {
        withContext(Dispatchers.IO) {
            database.categoryDao.addAll(categories)
        }
    }

    companion object {
        const val INCOME = "INCOME"
        const val EXPENSE = "EXPENSE"
    }
}