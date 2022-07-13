package com.jwallet.jwallet.presentation.settings.categories

import android.util.Log
import android.view.ViewGroup
import androidx.recyclerview.widget.ListAdapter
import androidx.recyclerview.widget.RecyclerView
import com.jwallet.jwallet.data.database.Category

class CategoryAdapter() :
    ListAdapter<Category, RecyclerView.ViewHolder>(CategoryDiffUtilItemCallback()) {

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): RecyclerView.ViewHolder {
        return if (viewType == VIEW_TYPE_CATEGORY) {
            CategoryViewHolder.inflateFrom(parent)
        } else {
            AddCategoryViewHolder.inflateFrom(parent)
        }
    }

    override fun onBindViewHolder(holder: RecyclerView.ViewHolder, position: Int) {
        if (position == itemCount - 1) {
            (holder as AddCategoryViewHolder).bind {
                Log.e("Category Adapter", "add category button clicked")
            }
        } else {
            val item = getItem(position)
            (holder as CategoryViewHolder).bind(item)
        }
    }

    override fun getItemViewType(position: Int): Int {
        return if (position == itemCount - 1) VIEW_TYPE_BUTTON else VIEW_TYPE_CATEGORY
    }

    companion object {
        const val VIEW_TYPE_CATEGORY = 1
        const val VIEW_TYPE_BUTTON = 2
    }

    override fun getItemCount(): Int {
        return super.getItemCount() + 1
    }
}