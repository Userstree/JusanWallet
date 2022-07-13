package com.jwallet.jwallet.presentation.amount

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.constraintlayout.widget.ConstraintLayout
import androidx.lifecycle.MutableLiveData
import com.google.android.material.bottomsheet.BottomSheetDialogFragment
import com.jwallet.jwallet.databinding.FragmentAmountBinding
import com.jwallet.jwallet.databinding.ItemBackBtnBinding
import com.jwallet.jwallet.databinding.ItemNumBtnBinding

class AmountFragment(private val onClick: (Double) -> Unit) : BottomSheetDialogFragment() {

    private var _binding: FragmentAmountBinding? = null
    private val binding get() = _binding!!

    private val amount = MutableLiveData("")

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        _binding = FragmentAmountBinding.inflate(inflater, container, false)
        setupObservers()
        setupListeners()
        setupNumPad()
        return binding.root
    }

    private fun setupObservers() {
        amount.observe(viewLifecycleOwner) { binding.tvAmount.text = it }
    }

    private fun setupListeners() {
        binding.btnContinue.setOnClickListener {
            val amount = binding.tvAmount.text.toString().toDoubleOrNull() ?: 0.0
            onClick(amount)
            dismiss()
        }
    }

    private fun setupNumPad() {
        for (i in 1..9) binding.glNumBtns.addView(getNumBtn(i.toString()))
        binding.glNumBtns.addView(getNumBtn("."))
        binding.glNumBtns.addView(getNumBtn("0"))
        binding.glNumBtns.addView(getBackBtn())
    }

    private fun getNumBtn(digit: String) : ConstraintLayout {
        val btn = ItemNumBtnBinding.inflate(layoutInflater, binding.glNumBtns, false)
        btn.tvNumBtn.text = digit
        btn.tvNumBtn.setOnClickListener {
            val length = amount.value?.length ?: return@setOnClickListener
            if (length > 7) return@setOnClickListener
            amount.value = amount.value + digit
        }
        return btn.root
    }

    private fun getBackBtn() : ConstraintLayout {
        val btn = ItemBackBtnBinding.inflate(layoutInflater, binding.glNumBtns, false)
        btn.ivNumBtn.setOnClickListener {
            val length = amount.value?.length ?: return@setOnClickListener
            if (length == 0) return@setOnClickListener
            if (length == 1) amount.value = ""
            else amount.value = amount.value?.slice(0..length - 2)
        }
        return btn.root
    }

    override fun onDestroyView() {
        super.onDestroyView()
        _binding = null
    }

    companion object {
        const val TAG = "AMOUNT_FRAGMENT"
    }
}