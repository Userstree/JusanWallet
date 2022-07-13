package com.jwallet.jwallet.presentation.home

import android.content.Intent
import android.os.Bundle
import android.view.*
import android.widget.Toast
import androidx.core.view.MenuHost
import androidx.core.view.MenuProvider
import androidx.fragment.app.Fragment
import androidx.fragment.app.viewModels
import com.jwallet.jwallet.R
import com.jwallet.jwallet.databinding.FragmentHomeBinding
import com.jwallet.jwallet.presentation.settings.SettingsActivity
import org.koin.androidx.viewmodel.ext.android.viewModel

class HomeFragment : Fragment() {

    private var _binding: FragmentHomeBinding? = null
    private val binding get() = _binding!!

    private val viewModel: HomeViewModel by viewModel()

    private lateinit var transactionAdapter: TransactionAdapter
    private lateinit var menuHost: MenuHost
    private lateinit var menuProvider: MenuProvider

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        _binding = FragmentHomeBinding.inflate(inflater, container, false)
        setupTransactionsRecyclerView()
        setupObservers()
        setupToolbarMenu()
        return binding.root
    }

    private fun setupTransactionsRecyclerView() {
        transactionAdapter = TransactionAdapter()
        binding.rvTransactions.adapter = transactionAdapter
    }

    private fun setupObservers() {
        viewModel.transaction.observe(viewLifecycleOwner) {
            transactionAdapter.submitList(it)
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
                R.id.item_profile -> onProfileClick()
            }
            return true
        }
    }

    private fun onProfileClick() {
        val intent = Intent(requireContext(), SettingsActivity::class.java)
        startActivity(intent)
    }

    private fun displayToast(msg: String = "Message") {
        Toast.makeText(requireContext(), msg, Toast.LENGTH_SHORT).show()
    }

    override fun onDestroyView() {
        super.onDestroyView()
        menuHost.removeMenuProvider(menuProvider)
        _binding = null
    }
}