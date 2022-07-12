package com.jwallet.jwallet.presentation.home

import android.view.ViewGroup
import androidx.recyclerview.widget.ListAdapter
import com.jwallet.jwallet.data.database.Transaction

class TransactionAdapter :
    ListAdapter<Transaction, TransactionViewHolder>(TransactionDiffUtilItemCallback()) {
    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): TransactionViewHolder {
        return TransactionViewHolder.inflateFrom(parent)
    }

    override fun onBindViewHolder(holder: TransactionViewHolder, position: Int) {
        val item = getItem(position)
        holder.bind(item)
    }
}