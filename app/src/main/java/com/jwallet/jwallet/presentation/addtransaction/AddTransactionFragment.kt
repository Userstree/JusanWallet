package com.jwallet.jwallet.presentation.addtransaction

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import com.google.android.material.bottomsheet.BottomSheetDialogFragment
import com.jwallet.jwallet.data.database.Transaction
import com.jwallet.jwallet.databinding.FragmentAddTransactionBinding
import com.jwallet.jwallet.presentation.amount.AmountFragment
import java.util.*

class AddTransactionFragment(val onFinish: (Transaction) -> Unit) :
    BottomSheetDialogFragment() {

    private var _binding: FragmentAddTransactionBinding? = null
    private val binding get() = _binding!!

    private var amount: Double = 0.0
    private var paymentName: String = ""
    private val note: String = ""
    private var category: String = ""
    private var recurring: Boolean = false

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        _binding = FragmentAddTransactionBinding.inflate(inflater, container, false)
        setupListeners()
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
                note = note
            )
            onFinish(transaction)
            dismiss()
        }

        binding.ibtnSetAmount.setOnClickListener {
            AmountFragment(::getAmount).show(childFragmentManager, AmountFragment.TAG)
        }
    }

    private fun getAmount(amount: Double) {
        this.amount = amount
        binding.tvAmount.text = amount.toString()
    }

    companion object {
        const val TAG = "ADD_TRANSACTION_FRAGMENT"
    }
}