package com.jwallet.jwallet.presentation.addtransaction

import android.os.Bundle
import android.text.Editable
import android.text.TextWatcher
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import com.google.android.material.bottomsheet.BottomSheetDialogFragment
import com.jwallet.jwallet.R
import com.jwallet.jwallet.data.database.Category
import com.jwallet.jwallet.data.database.Transaction
import com.jwallet.jwallet.databinding.FragmentAddTransactionBinding
import com.jwallet.jwallet.presentation.addtransaction.AddTransactionViewModel.CategoryType.*
import com.jwallet.jwallet.presentation.amount.AmountFragment
import com.jwallet.jwallet.presentation.selectcategoryfragment.SelectCategoryFragment
import org.koin.androidx.viewmodel.ext.android.viewModel
import java.util.*

class AddTransactionFragment(val onFinish: (Transaction) -> Unit) :
    BottomSheetDialogFragment() {

    private var _binding: FragmentAddTransactionBinding? = null
    private val binding get() = _binding!!

    private var amount: Double = 0.0
    private var paymentName: String = ""
    private var note: String = ""
    private var category: String = ""
    private var recurring: Boolean = false

    private val viewModel: AddTransactionViewModel by viewModel()

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        _binding = FragmentAddTransactionBinding.inflate(inflater, container, false)
        setupListeners()
        setupObservers()
        return binding.root
    }

    override fun onDestroyView() {
        super.onDestroyView()
        _binding = null
    }

    private fun setupListeners() {
        binding.btnFinish.setOnClickListener {
            val transaction = Transaction(
                category = category,
                title = paymentName,
                price = amount,
                date = Date(),
                recurring = recurring,
                note = note,
                categoryType = viewModel.getCategoryTypeString()
            )
            onFinish(transaction)
            dismiss()
        }

        binding.ibtnSetAmount.setOnClickListener {
            AmountFragment(::getAmount).show(childFragmentManager, AmountFragment.TAG)
        }

        binding.btnChooseCategory.setOnClickListener {
            val list = viewModel.getCategories() ?: return@setOnClickListener
            Log.e(TAG, "$list ${viewModel.categoryType.value}")
            SelectCategoryFragment(list, ::getCategory).show(
                childFragmentManager,
                SelectCategoryFragment.TAG
            )
        }

        binding.btnExpense.setOnClickListener { viewModel.setCategoryType(EXPENSE) }
        binding.btnIncome.setOnClickListener { viewModel.setCategoryType(INCOME) }
        binding.btnTransfers.setOnClickListener { viewModel.setCategoryType(TRANSFER) }

        binding.edtPaymentName.addTextChangedListener(object : TextWatcher {
            override fun beforeTextChanged(s: CharSequence?, start: Int, count: Int, after: Int) {}
            override fun onTextChanged(s: CharSequence?, start: Int, before: Int, count: Int) {}
            override fun afterTextChanged(s: Editable?) {
                if (s == null || s.toString().isEmpty()) return
                paymentName = s.toString()
            }
        })

        binding.edtNote.addTextChangedListener(object : TextWatcher {
            override fun beforeTextChanged(s: CharSequence?, start: Int, count: Int, after: Int) {}
            override fun onTextChanged(s: CharSequence?, start: Int, before: Int, count: Int) {}
            override fun afterTextChanged(s: Editable?) {
                if (s == null || s.toString().isEmpty()) return
                note = s.toString()
            }
        })

        binding.switchRecurring.setOnCheckedChangeListener { _, isChecked -> recurring = isChecked }
    }

    private fun setupObservers() {
        viewModel.categoryType.observe(viewLifecycleOwner) {
            when (it) {
                INCOME -> {
                    binding.btnIncome.background =
                        requireContext().getDrawable(R.drawable.shape_rectangle_gradient_green_8dp)
                    binding.btnExpense.background =
                        requireContext().getDrawable(R.drawable.shape_rectangle_rounded_8dp)
                    binding.btnTransfers.background =
                        requireContext().getDrawable(R.drawable.shape_rectangle_rounded_8dp)
                }
                EXPENSE -> {
                    binding.btnIncome.background =
                        requireContext().getDrawable(R.drawable.shape_rectangle_rounded_8dp)
                    binding.btnExpense.background =
                        requireContext().getDrawable(R.drawable.shape_rectangle_gradient_red_8dp)
                    binding.btnTransfers.background =
                        requireContext().getDrawable(R.drawable.shape_rectangle_rounded_8dp)
                }
                TRANSFER -> {
                    binding.btnIncome.background =
                        requireContext().getDrawable(R.drawable.shape_rectangle_rounded_8dp)
                    binding.btnExpense.background =
                        requireContext().getDrawable(R.drawable.shape_rectangle_rounded_8dp)
                    binding.btnTransfers.background =
                        requireContext().getDrawable(R.drawable.shape_rectangle_gradient_blue_8dp)
                }
            }
        }
    }

    private fun getAmount(amount: Double) {
        this.amount = amount
        binding.tvAmount.text = amount.toString()
    }

    private fun getCategory(category: Category) {
        this.category = category.name
        binding.btnChooseCategory.text = category.name
    }

    companion object {
        const val TAG = "ADD_TRANSACTION_FRAGMENT"
    }
}