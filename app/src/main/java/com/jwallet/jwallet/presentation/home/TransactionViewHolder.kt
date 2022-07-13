package com.jwallet.jwallet.presentation.home

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.jwallet.jwallet.databinding.ItemTransactionBinding
import com.jwallet.jwallet.data.database.Transaction
import com.jwallet.jwallet.data.repositories.TransactionRepository

class TransactionViewHolder(val binding: ItemTransactionBinding) : RecyclerView.ViewHolder(binding.root) {

    fun bind(item: Transaction) {
        val sign = if (item.categoryType == TransactionRepository.EXPENSE) "-" else ""

        binding.tvTransactionTitle.text = item.title
        binding.tvTransactionMessage.text = item.category
        binding.tvTransactionPrice.text = "$sign${item.price}"
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