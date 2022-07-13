package com.jwallet.jwallet.presentation.monitoring.investing

import android.view.View
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import com.jwallet.jwallet.R
import com.jwallet.jwallet.presentation.monitoring.investing.model.Stock

class InvestingViewHolder(view: View) : RecyclerView.ViewHolder(view) {

    private val stockNameTV: TextView = view.findViewById(R.id.stock_name)
    private val stockSymbolTV: TextView = view.findViewById(R.id.stock_symbol)
    private val stockPriceTV: TextView = view.findViewById(R.id.stock_price)

    fun bind(stock: Stock) {
        stockNameTV.text = stock.name
        stockSymbolTV.text = stock.symbol
        stockPriceTV.text = "$ ${stock.price}"
    }

}