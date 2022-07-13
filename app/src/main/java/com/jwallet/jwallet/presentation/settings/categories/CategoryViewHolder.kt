package com.jwallet.jwallet.presentation.settings.categories

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.jwallet.jwallet.data.database.Category
import com.jwallet.jwallet.databinding.ItemCategoryBinding

class CategoryViewHolder(val binding: ItemCategoryBinding) :
    RecyclerView.ViewHolder(binding.root) {

    fun bind(item: Category) {
        binding.ivCategoryIcon.setImageResource(item.image)
        binding.tvCategoryName.text = item.name
    }

    companion object {
        fun inflateFrom(parent: ViewGroup): CategoryViewHolder {
            val inflater = LayoutInflater.from(parent.context)
            val binding = ItemCategoryBinding.inflate(inflater, parent, false)
            return CategoryViewHolder(binding)
        }
    }
}