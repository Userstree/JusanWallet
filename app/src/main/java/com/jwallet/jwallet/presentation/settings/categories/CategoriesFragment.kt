package com.jwallet.jwallet.presentation.settings.categories

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import com.jwallet.jwallet.data.database.TransactionDatabase
import com.jwallet.jwallet.databinding.FragmentCategoriesBinding
import org.koin.androidx.viewmodel.ext.android.viewModel

class CategoriesFragment : Fragment() {

    private var _binding: FragmentCategoriesBinding? = null
    private val binding get() = _binding!!

    private val viewModel: CategoriesViewModel by viewModel()

    private lateinit var expenseCategoriesAdapter: CategoryAdapter
    private lateinit var incomeCategoriesAdapter: CategoryAdapter

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        _binding = FragmentCategoriesBinding.inflate(inflater, container, false)
        setupRecyclerViews()
        setupObservers()
        return binding.root
    }

    private fun setupRecyclerViews() {
        setupExpenseRecyclerView()
        setupIncomeRecyclerView()
    }

    private fun setupObservers() {
        viewModel.incomeCategories.observe(viewLifecycleOwner) {
            incomeCategoriesAdapter.submitList(it)
        }
        viewModel.expenseCategories.observe(viewLifecycleOwner) {
            expenseCategoriesAdapter.submitList(it)
        }
    }

    private fun setupExpenseRecyclerView() {
        expenseCategoriesAdapter = CategoryAdapter()
        binding.rvExpenseCategories.adapter = expenseCategoriesAdapter
    }

    private fun setupIncomeRecyclerView() {
        incomeCategoriesAdapter = CategoryAdapter()
        binding.rvIncomeCategories.adapter = incomeCategoriesAdapter
    }

    override fun onDestroyView() {
        super.onDestroyView()
        _binding = null
    }
}