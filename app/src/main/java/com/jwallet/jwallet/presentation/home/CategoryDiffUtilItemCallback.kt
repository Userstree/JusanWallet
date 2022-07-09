package com.jwallet.jwallet.presentation.home

import androidx.recyclerview.widget.DiffUtil
import com.jwallet.jwallet.domain.models.SpendingCategory

class CategoryDiffUtilItemCallback : DiffUtil.ItemCallback<SpendingCategory>() {
    override fun areItemsTheSame(oldItem: SpendingCategory, newItem: SpendingCategory) =
        oldItem.name == newItem.name

    override fun areContentsTheSame(oldItem: SpendingCategory, newItem: SpendingCategory) =
        oldItem == newItem
}