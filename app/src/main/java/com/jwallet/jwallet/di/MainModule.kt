package com.jwallet.jwallet.di

import com.jwallet.jwallet.data.database.TransactionDatabase
import com.jwallet.jwallet.data.repositories.TransactionRepository
import com.jwallet.jwallet.presentation.addtransaction.AddTransactionViewModel
import com.jwallet.jwallet.presentation.home.HomeViewModel
import com.jwallet.jwallet.presentation.main.MainViewModel
import com.jwallet.jwallet.presentation.settings.categories.CategoriesViewModel
import com.jwallet.jwallet.presentation.settings.categories.CategoryViewHolder
import org.koin.android.ext.koin.androidApplication
import org.koin.androidx.viewmodel.dsl.viewModel
import org.koin.dsl.module

val mainModule = module {
    factory { TransactionDatabase.getInstance(androidApplication()) }
    factory { TransactionRepository(get()) }
    viewModel { CategoriesViewModel(get()) }

    viewModel { AddTransactionViewModel(get()) }

    viewModel { MainViewModel(get()) }

    viewModel { HomeViewModel(get()) }
}