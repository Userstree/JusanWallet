package com.jwallet.jwallet.presentation.main

import android.os.Bundle
import android.util.Log
import androidx.appcompat.app.AppCompatActivity
import androidx.navigation.NavController
import androidx.navigation.fragment.NavHostFragment
import androidx.navigation.ui.AppBarConfiguration
import androidx.navigation.ui.setupWithNavController
import com.google.android.material.bottomnavigation.BottomNavigationItemView
import com.google.android.material.bottomnavigation.BottomNavigationMenuView
import com.jwallet.jwallet.R
import com.jwallet.jwallet.data.database.Transaction
import com.jwallet.jwallet.databinding.ActivityMainBinding
import com.jwallet.jwallet.presentation.addtransaction.AddTransactionFragment
import org.koin.androidx.viewmodel.ext.android.viewModel

class MainActivity : AppCompatActivity() {

    private lateinit var binding: ActivityMainBinding
    private lateinit var navHostFragment: NavHostFragment
    private lateinit var navController: NavController
    private lateinit var appBarConfiguration: AppBarConfiguration

    private val viewModel: MainViewModel by viewModel()

    private val TAG = javaClass.simpleName

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)
        setSupportActionBar(binding.mtbMain)
        setupNavigation()
        setupBottomNav()
        viewModel
    }

    private fun setupNavigation() {
        navHostFragment =
            supportFragmentManager.findFragmentById(R.id.nav_host_fragment_main) as NavHostFragment
        navController = navHostFragment.navController
        appBarConfiguration = AppBarConfiguration.Builder(navController.graph).build()
        binding.mtbMain.setupWithNavController(navController, appBarConfiguration)
        binding.bnvMain.setupWithNavController(navController)
    }

    private fun setupBottomNav() {
        val menuView = binding.bnvMain.menuView as BottomNavigationMenuView
        val menuItem = menuView.getChildAt(2) as BottomNavigationItemView
        menuItem.setIconSize(48.dp)
        menuItem.setOnClickListener {
            addTransaction()
        }
    }

    private fun addTransaction() {
        AddTransactionFragment(::getTransaction).show(
            supportFragmentManager,
            AddTransactionFragment.TAG
        )
    }

    private fun getTransaction(transaction: Transaction) {
        Log.e(TAG, transaction.toString())
        viewModel.addTransaction(transaction)
    }
}