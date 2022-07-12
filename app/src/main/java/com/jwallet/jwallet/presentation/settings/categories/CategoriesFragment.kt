package com.jwallet.jwallet.presentation.settings.categories

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import androidx.fragment.app.viewModels
import com.jwallet.jwallet.databinding.FragmentCategoriesBinding

class CategoriesFragment : Fragment() {

    private var _binding: FragmentCategoriesBinding? = null
    private val binding get() = _binding!!

    private val viewModel: CategoriesViewModel by viewModels()

    private lateinit var expenseCategoriesAdapter: CategoryMiniAdapter
    private lateinit var incomeCategoriesAdapter: CategoryMiniAdapter

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        _binding = FragmentCategoriesBinding.inflate(inflater, container, false)
        setupRecyclerViews()
        return binding.root
    }

    private fun setupRecyclerViews() {
        setupExpenseRecyclerView()
        setupIncomeRecyclerView()
    }

    private fun setupExpenseRecyclerView() {
        val list = viewModel.multiplyList(5, viewModel.getExpenseCategories())
        expenseCategoriesAdapter = CategoryMiniAdapter()
        expenseCategoriesAdapter.submitList(list)
        binding.rvExpenseCategories.adapter = expenseCategoriesAdapter
    }

    private fun setupIncomeRecyclerView() {
        val list = viewModel.multiplyList(5, viewModel.getIncomeCategories())
        incomeCategoriesAdapter = CategoryMiniAdapter()
        incomeCategoriesAdapter.submitList(list)
        binding.rvIncomeCategories.adapter = incomeCategoriesAdapter
    }

    override fun onDestroyView() {
        super.onDestroyView()
        _binding = null
    }
}