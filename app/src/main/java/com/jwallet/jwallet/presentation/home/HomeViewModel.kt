package com.jwallet.jwallet.presentation.home

import androidx.lifecycle.ViewModel
import com.jwallet.jwallet.domain.models.SpendingCategory

class HomeViewModel : ViewModel() {

    fun getCategoriesList() : List<SpendingCategory> {
        val list = mutableListOf<SpendingCategory>()
        repeat(11) { list.add(SpendingCategory("category$it", it))}
        return list
    }
}