package com.jwallet.jwallet.presentation.settings.categories

import androidx.recyclerview.widget.DiffUtil
import com.jwallet.jwallet.data.database.Category

class CategoryDiffUtilItemCallback : DiffUtil.ItemCallback<Category>() {
    override fun areItemsTheSame(oldItem: Category, newItem: Category) =
        oldItem.name == newItem.name

    override fun areContentsTheSame(oldItem: Category, newItem: Category) =
        oldItem == newItem
}