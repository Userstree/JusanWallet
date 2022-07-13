package com.jwallet.jwallet.presentation.monitoring.investing

import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.recyclerview.widget.LinearLayoutManager
import com.jwallet.jwallet.databinding.FragmentInvestingBinding
import com.jwallet.jwallet.presentation.monitoring.investing.model.Stock


class InvestingFragment : Fragment() {

    private var _binding: FragmentInvestingBinding? = null
    private val binding get() = _binding!!

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        _binding = FragmentInvestingBinding.inflate(inflater, container, false)

        setupRecyclerView()
        return binding.root
    }

    private fun setupRecyclerView() {
        val investingAdapter = InvestingAdapter()
        binding.rvStocks.adapter = investingAdapter
        binding.rvStocks.layoutManager = LinearLayoutManager(requireContext())
        investingAdapter.setStocks(getLocalStocks())
    }

    private fun getLocalStocks(): List<Stock> {
        val intel = Stock(name = "Intel", symbol = "INTC", price = 173.64f)
        val google = Stock(name = "Google INC", symbol = "GOOG", price = 479.25f)
        val netflix = Stock(name = "Netflix", symbol = "NFLX", price = 367.14f)
        val cisco = Stock(name = "Cisco", symbol = "CSCO", price = 42.1f)
        val hewlett = Stock(name = "Hewlett Packard", symbol = "HPE", price = 13.12f)
        return listOf(intel, google, netflix, cisco, hewlett)
    }

    override fun onDestroyView() {
        super.onDestroyView()
        _binding = null
    }
}