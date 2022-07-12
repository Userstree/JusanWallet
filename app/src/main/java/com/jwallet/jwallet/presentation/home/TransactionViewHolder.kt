package com.jwallet.jwallet.presentation.home

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.jwallet.jwallet.databinding.ItemTransactionBinding
import com.jwallet.jwallet.data.database.Transaction

class TransactionViewHolder(val binding: ItemTransactionBinding) : RecyclerView.ViewHolder(binding.root) {

    fun bind(item: Transaction) {
        binding.tvTransactionTitle.text = item.title
        binding.tvTransactionMessage.text = item.message
        binding.tvTransactionPrice.text = "-$${item.price}"
        binding.tvTransactionDate.text = "1:30 PM"
    }

    companion object {
        fun inflateFrom(parent: ViewGroup) : TransactionViewHolder {
            val inflater = LayoutInflater.from(parent.context)
            val binding = ItemTransactionBinding.inflate(inflater, parent, false)
            return TransactionViewHolder(binding)
        }
    }
}