package com.jwallet.jwallet.presentation.home

import android.os.Bundle
import android.view.*
import androidx.core.view.MenuHost
import androidx.core.view.MenuProvider
import androidx.fragment.app.Fragment
import androidx.fragment.app.viewModels
import com.jwallet.jwallet.R
import com.jwallet.jwallet.databinding.FragmentHomeBinding

class HomeFragment : Fragment() {

    private var _binding: FragmentHomeBinding? = null
    private val binding get() = _binding!!

    private val viewModel: HomeViewModel by viewModels()

    private lateinit var categoryAdapter: CategoryAdapter
    private lateinit var transactionAdapter: TransactionAdapter
    private lateinit var menuHost: MenuHost
    private lateinit var menuProvider: MenuProvider

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        _binding = FragmentHomeBinding.inflate(inflater, container, false)
        setupCategoriesRecyclerView()
        setupTransactionsRecyclerView()
        setupLayout()
        setupToolbarMenu()
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

    private fun setupToolbarMenu() {
        menuHost = requireActivity()
        menuProvider = getMenuProvider()
        menuHost.addMenuProvider(menuProvider)
    }

    private fun getMenuProvider() = object : MenuProvider {
        override fun onCreateMenu(menu: Menu, menuInflater: MenuInflater) {
            menuInflater.inflate(R.menu.menu_toolbar_home, menu)
        }

        override fun onMenuItemSelected(menuItem: MenuItem): Boolean {
            when (menuItem.itemId) {
                R.id.item_profile -> ""
            }
            return true
        }

    }

    override fun onDestroyView() {
        super.onDestroyView()
        menuHost.removeMenuProvider(menuProvider)
        _binding = null
    }
}