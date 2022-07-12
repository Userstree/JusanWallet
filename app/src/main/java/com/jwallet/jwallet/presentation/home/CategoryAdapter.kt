package com.jwallet.jwallet.presentation.home

import android.view.ViewGroup
import androidx.recyclerview.widget.ListAdapter
import com.jwallet.jwallet.data.database.Category

class CategoryAdapter :
    ListAdapter<Category, CategoryViewHolder>(CategoryDiffUtilItemCallback()) {
    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): CategoryViewHolder {
        return CategoryViewHolder.inflateFrom(parent)
    }

    override fun onBindViewHolder(holder: CategoryViewHolder, position: Int) {
        val category = getItem(position)
        holder.bind(category)
    }
}