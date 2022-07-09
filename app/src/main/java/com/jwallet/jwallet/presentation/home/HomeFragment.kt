package com.jwallet.jwallet.presentation.home

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import androidx.fragment.app.viewModels
import com.jwallet.jwallet.databinding.FragmentHomeBinding
import com.jwallet.jwallet.domain.models.SpendingCategory

class HomeFragment : Fragment() {

    private var _binding: FragmentHomeBinding? = null
    private val binding get() = _binding!!

    private val viewModel: HomeViewModel by viewModels()

    private lateinit var categoryAdapter: CategoryAdapter
    private lateinit var transactionAdapter: TransactionAdapter

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        _binding = FragmentHomeBinding.inflate(inflater, container, false)
        setupCategoriesRecyclerView()
        setupTransactionsRecyclerView()
        return binding.root
    }

    private fun setupCategoriesRecyclerView() {
        categoryAdapter = CategoryAdapter()
        categoryAdapter.submitList(viewModel.getCategoriesList())
        binding.rvCategories.adapter = categoryAdapter
    }

    private fun setupTransactionsRecyclerView() {
        transactionAdapter = TransactionAdapter()
        transactionAdapter.submitList(viewModel.getTransactionsList())
        binding.rvTransactions.adapter = transactionAdapter
    }

    private fun setupLayout() {
        binding.ibtnAddCategory.setOnClickListener {
            val category = viewModel.getCategory()
        }

        binding.ibtnAddTransaction.setOnClickListener {
            val transaction = viewModel.getTransaction()
        }
    }

    override fun onDestroyView() {
        super.onDestroyView()
        _binding = null
    }
}