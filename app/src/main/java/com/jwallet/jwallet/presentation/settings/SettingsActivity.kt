package com.jwallet.jwallet.presentation.settings

import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import androidx.navigation.NavController
import androidx.navigation.fragment.NavHostFragment
import androidx.navigation.ui.AppBarConfiguration
import androidx.navigation.ui.setupWithNavController
import com.jwallet.jwallet.R
import com.jwallet.jwallet.databinding.ActivitySettingsBinding

class SettingsActivity : AppCompatActivity() {

    private lateinit var binding: ActivitySettingsBinding
    private lateinit var navHostFragment: NavHostFragment
    private lateinit var navController: NavController
    private lateinit var appBarConfiguration: AppBarConfiguration

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivitySettingsBinding.inflate(layoutInflater)
        setContentView(binding.root)
        setupNavigation()
    }

    private fun setupNavigation() {
        navHostFragment =
            supportFragmentManager.findFragmentById(R.id.nav_host_fragment_settings) as NavHostFragment
        navController = navHostFragment.navController
        appBarConfiguration = AppBarConfiguration.Builder(navController.graph).build()
        binding.mtbSettings.setupWithNavController(navController, appBarConfiguration)
    }
}