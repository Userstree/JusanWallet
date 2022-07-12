package com.jwallet.jwallet.presentation.settings.categories

import androidx.lifecycle.ViewModel
import com.jwallet.jwallet.R
import com.jwallet.jwallet.data.database.Category

class CategoriesViewModel : ViewModel() {

    fun getExpenseCategories(): List<Category> {
        val list = mutableListOf<Category>()
        list.add(Category("Car", R.drawable.directions_car_48px))
        list.add(Category("Bills", R.drawable.receipt_long_48px))
        list.add(Category("Entertainment", R.drawable.sports_esports_48px))
        list.add(Category("Groceries", R.drawable.shopping_basket_48px))
        list.add(Category("Transport", R.drawable.directions_bus_48px))
        list.add(Category("Health", R.drawable.favorite_48px))
        list.add(Category("Eating out", R.drawable.dining_48px))
        list.add(Category("Other", R.drawable.description_48px))
        return list
    }

    fun <T> multiplyList(count: Int, l: List<T>): List<T> {
        val list = mutableListOf<T>()
        repeat(count) { list.addAll(l) }
        return list
    }

    fun getIncomeCategories(): List<Category> {
        val list = mutableListOf<Category>()
        list.add(Category("Salary", R.drawable.wallet_48px))
        list.add(Category("Business", R.drawable.store_48px))
        list.add(Category("Side job", R.drawable.work_48px))
        list.add(Category("Passive", R.drawable.percent_48px))
        list.add(Category("Rental", R.drawable.bedroom_parent_48px))
        list.add(Category("Dividents", R.drawable.candlestick_chart_48px))
        list.add(Category("Other", R.drawable.description_48px))
        return list
    }
}