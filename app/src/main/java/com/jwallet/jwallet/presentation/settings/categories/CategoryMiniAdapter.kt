package com.jwallet.jwallet.presentation.settings.categories

import android.view.ViewGroup
import androidx.recyclerview.widget.ListAdapter
import com.jwallet.jwallet.data.database.Category
import com.jwallet.jwallet.presentation.home.CategoryDiffUtilItemCallback

class CategoryMiniAdapter :
    ListAdapter<Category, CategoryMiniViewHolder>(CategoryDiffUtilItemCallback()) {
    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): CategoryMiniViewHolder {
        return CategoryMiniViewHolder.inflateFrom(parent)
    }

    override fun onBindViewHolder(holder: CategoryMiniViewHolder, position: Int) {
        val item = getItem(position)
        holder.bind(item)
    }
}