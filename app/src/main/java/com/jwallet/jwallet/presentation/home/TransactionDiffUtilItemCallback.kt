package com.jwallet.jwallet.presentation.home

import androidx.recyclerview.widget.DiffUtil
import com.jwallet.jwallet.domain.models.Transaction

class TransactionDiffUtilItemCallback : DiffUtil.ItemCallback<Transaction>() {
    override fun areItemsTheSame(oldItem: Transaction, newItem: Transaction): Boolean {
        return oldItem.id == newItem.id
    }

    override fun areContentsTheSame(oldItem: Transaction, newItem: Transaction): Boolean {
        return oldItem == newItem
    }
}