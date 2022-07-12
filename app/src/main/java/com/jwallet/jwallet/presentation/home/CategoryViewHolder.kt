package com.jwallet.jwallet.presentation.home

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.jwallet.jwallet.databinding.ItemCategoryBinding
import com.jwallet.jwallet.data.database.Category

class CategoryViewHolder(val binding: ItemCategoryBinding) : RecyclerView.ViewHolder(binding.root) {

    fun bind(category: Category) {

    }

    companion object {
        fun inflateFrom(parent: ViewGroup) : CategoryViewHolder {
            val inflater = LayoutInflater.from(parent.context)
            val binding = ItemCategoryBinding.inflate(inflater, parent, false)
            return CategoryViewHolder(binding)
        }
    }
}