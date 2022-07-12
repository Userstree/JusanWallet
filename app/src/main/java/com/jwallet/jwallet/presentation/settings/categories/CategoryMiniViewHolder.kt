package com.jwallet.jwallet.presentation.settings.categories

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.jwallet.jwallet.data.database.Category
import com.jwallet.jwallet.databinding.ItemCategoryMiniBinding

class CategoryMiniViewHolder(val binding: ItemCategoryMiniBinding) :
    RecyclerView.ViewHolder(binding.root) {

    fun bind(item: Category) {
        binding.ivCategoryIcon.setImageResource(item.image)
        binding.tvCategoryName.text = item.name
    }

    companion object {
        fun inflateFrom(parent: ViewGroup) : CategoryMiniViewHolder {
            val inflater = LayoutInflater.from(parent.context)
            val binding = ItemCategoryMiniBinding.inflate(inflater, parent, false)
            return CategoryMiniViewHolder(binding)
        }
    }
}