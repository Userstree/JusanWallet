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

    private lateinit var expenseCategoriesAdapter: CategoryAdapter
    private lateinit var incomeCategoriesAdapter: CategoryAdapter

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
        expenseCategoriesAdapter = CategoryAdapter()
        expenseCategoriesAdapter.submitList(viewModel.getExpenseCategories())
        binding.rvExpenseCategories.adapter = expenseCategoriesAdapter
    }

    private fun setupIncomeRecyclerView() {
        incomeCategoriesAdapter = CategoryAdapter()
        incomeCategoriesAdapter.submitList(viewModel.getIncomeCategories())
        binding.rvIncomeCategories.adapter = incomeCategoriesAdapter
    }

    override fun onDestroyView() {
        super.onDestroyView()
        _binding = null
    }
}