package com.jwallet.jwallet.presentation.home

import android.view.ViewGroup
import androidx.recyclerview.widget.ListAdapter
import com.jwallet.jwallet.domain.models.SpendingCategory

class CategoryAdapter :
    ListAdapter<SpendingCategory, CategoryViewHolder>(CategoryDiffUtilItemCallback()) {
    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): CategoryViewHolder {
        return CategoryViewHolder.inflateFrom(parent)
    }

    override fun onBindViewHolder(holder: CategoryViewHolder, position: Int) {
        val category = getItem(position)
        holder.bind(category)
    }
}