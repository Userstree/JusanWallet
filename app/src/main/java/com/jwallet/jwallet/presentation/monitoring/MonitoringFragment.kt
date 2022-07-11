package com.jwallet.jwallet.presentation.monitoring

import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.navigation.NavController
import androidx.navigation.fragment.NavHostFragment
import com.jwallet.jwallet.R
import com.jwallet.jwallet.databinding.FragmentMonitoringBinding

class MonitoringFragment : Fragment() {

    private var _binding: FragmentMonitoringBinding? = null
    private val binding get() = _binding!!

    private lateinit var navHostFragment: NavHostFragment
    private lateinit var navController: NavController

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        _binding = FragmentMonitoringBinding.inflate(inflater, container, false)
        setupNavigation()
        setupListeners()
        return binding.root
    }

    override fun onDestroyView() {
        super.onDestroyView()
        _binding = null
    }

    private fun setupNavigation() {
        navHostFragment = childFragmentManager.findFragmentById(R.id.nav_host_fragment_monitoring) as NavHostFragment
        navController = navHostFragment.navController
    }

    private fun setupListeners() {
        binding.tvStatistics.setOnClickListener {
            navController.navigate(R.id.statisticsFragment)
        }

        binding.tvHistory.setOnClickListener {
            navController.navigate(R.id.historyFragment)
        }
    }
}