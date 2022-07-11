package com.jwallet.jwallet.presentation.monitoring.statistics

import android.graphics.Color
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.fragment.app.Fragment
import com.jwallet.jwallet.R
import com.jwallet.jwallet.databinding.FragmentStatisticsBinding

class StatisticsFragment : Fragment() {

    private var _binding: FragmentStatisticsBinding? = null
    private val binding get() = _binding!!

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        _binding = FragmentStatisticsBinding.inflate(inflater, container, false)
        setupListeners()
        return binding.root
    }

    private fun setupListeners() {
        binding.tvStatisticsIncome.setOnClickListener {
            toggleBackground(it as TextView)
        }
        binding.tvStatisticsExpense.setOnClickListener {
            toggleBackground(it as TextView)
        }
        binding.tvStatisticsTransfers.setOnClickListener {
            toggleBackground(it as TextView)
        }
    }

    private fun toggleBackground(view: TextView) {
        val views = listOf(
            binding.tvStatisticsIncome,
            binding.tvStatisticsExpense,
            binding.tvStatisticsTransfers
        )
        views.forEachIndexed { index, textView ->
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