package com.jwallet.jwallet.presentation.selectcategoryfragment

import android.view.ViewGroup
import androidx.recyclerview.widget.ListAdapter
import com.jwallet.jwallet.data.database.Category
import com.jwallet.jwallet.presentation.settings.categories.CategoryDiffUtilItemCallback
import com.jwallet.jwallet.presentation.settings.categories.CategoryViewHolder

class CategorySelectorAdapter(private val onClick: (Category) -> Unit) :
    ListAdapter<Category, CategoryViewHolder>(CategoryDiffUtilItemCallback()) {
    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): CategoryViewHolder {
        return CategoryViewHolder.inflateFrom(parent)
    }

    override fun onBindViewHolder(holder: CategoryViewHolder, position: Int) {
        val item = getItem(position)
        holder.bind(item)
        holder.binding.ivCategoryIcon.setOnClickListener { onClick(item) }
        holder.binding.tvCategoryName.setOnClickListener { onClick(item) }
        holder.binding.root.setOnClickListener { onClick(item) }
    }
}