package com.jwallet.jwallet.presentation.selectcategoryfragment

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.lifecycle.LiveData
import com.google.android.material.bottomsheet.BottomSheetDialogFragment
import com.jwallet.jwallet.data.database.Category
import com.jwallet.jwallet.databinding.FragmentSelectCategoryBinding

class SelectCategoryFragment(
    private val categories: LiveData<List<Category>>,
    private val onClick: (Category) -> Unit
) : BottomSheetDialogFragment() {

    private var _binding: FragmentSelectCategoryBinding? = null
    private val binding get() = _binding!!

    private lateinit var adapter: CategorySelectorAdapter

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        _binding = FragmentSelectCategoryBinding.inflate(inflater, container, false)
        setupRecyclerView()

        categories.observe(viewLifecycleOwner) { adapter.submitList(it) }
        return binding.root
    }

    private fun setupRecyclerView() {
        adapter = CategorySelectorAdapter(this::onItemClick)
        binding.rvCategories.adapter = adapter
    }

    override fun onDestroyView() {
        super.onDestroyView()
        _binding = null
    }

    private fun onItemClick(category: Category) {
        onClick(category)
        dismiss()
    }

    companion object {
        const val TAG = "SELECT_CATEGORY_FRAGMENT"
    }
}