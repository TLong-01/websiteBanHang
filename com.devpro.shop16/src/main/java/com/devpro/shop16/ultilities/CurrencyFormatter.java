package com.devpro.shop16.ultilities;

import java.text.NumberFormat;
import java.util.Locale;

public class CurrencyFormatter {
    public static String formatToVND(double amount) {
        NumberFormat formatter = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));
        return formatter.format(amount);
    }
}
