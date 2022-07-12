package com.jwallet.jwallet.presentation.monitoring.history

import android.graphics.Color
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.fragment.app.Fragment
import com.jwallet.jwallet.R
import com.jwallet.jwallet.databinding.FragmentHistoryBinding

class HistoryFragment : Fragment() {

    private var _binding: FragmentHistoryBinding? = null
    private val binding get() = _binding!!

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        _binding = FragmentHistoryBinding.inflate(inflater, container, false)
        setupListeners()
        return binding.root
    }

    private fun setupListeners() {
        binding.tvAll.setOnClickListener { toggleBackground(it as TextView) }
        binding.tvIncomes.setOnClickListener { toggleBackground(it as TextView) }
        binding.tvExpenses.setOnClickListener { toggleBackground(it as TextView) }
        binding.tvTransfers.setOnClickListener { toggleBackground(it as TextView) }
    }

    private fun toggleBackground(view: TextView) {
        val views = listOf(binding.tvAll, binding.tvIncomes, binding.tvExpenses, binding.tvTransfers)
        views.forEach { textView ->
            if (textView.id == view.id) {
                textView.setBackgroundResource(R.drawable.shape_rectangle_rounded_black_8dp)
                textView.setTextColor(Color.WHITE)
            } else {
                textView.setBackgroundResource(R.drawable.shape_rectangle_rounded_8dp)
                textView.setTextColor(Color.BLACK)
            }
        }
    }

    override fun onDestroyView() {
        super.onDestroyView()
        _binding = null
    }

}