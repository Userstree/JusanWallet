package com.jwallet.jwallet.presentation.monitoring.investing

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.jwallet.jwallet.R
import com.jwallet.jwallet.presentation.monitoring.investing.model.Stock

class InvestingAdapter : RecyclerView.Adapter<InvestingViewHolder>() {

    private val stocks = mutableListOf<Stock>()

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): InvestingViewHolder {
        val layoutInflater = LayoutInflater.from(parent.context)
        val view = layoutInflater.inflate(R.layout.item_stock, parent, false)
        return InvestingViewHolder(view)
    }

    override fun onBindViewHolder(holder: InvestingViewHolder, position: Int) {
        holder.bind(stocks[position])
    }

    override fun getItemCount(): Int = stocks.size

    fun setStocks(myLocalStocks: List<Stock>) {
        stocks.clear()
        stocks.addAll(myLocalStocks)
        notifyDataSetChanged()
    }

}