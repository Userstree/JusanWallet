package com.jwallet.jwallet.presentation.settings.categories

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.jwallet.jwallet.databinding.ItemAddCategoryBinding

class AddCategoryViewHolder(val binding: ItemAddCategoryBinding) :
    RecyclerView.ViewHolder(binding.root) {

    fun bind(onClick: () -> Unit) {
        binding.ivAddCategory.setOnClickListener { onClick() }
    }

    companion object {
        fun inflateFrom(parent: ViewGroup): AddCategoryViewHolder {
            val inflater = LayoutInflater.from(parent.context)
            val binding = ItemAddCategoryBinding.inflate(inflater, parent, false)
            return AddCategoryViewHolder(binding)
        }
    }
}