import 'package:flutter/material.dart';
import 'app_colors.dart'; 

class AppTextStyle { 
  static TextStyle get title => const TextStyle(
        fontFamily: 'Poppins',
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimary,  
      );
 
  static TextStyle get subtitle => const TextStyle(
        fontFamily: 'Poppins',
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: AppColors.textSecondary, 
      );
 
  static TextStyle get body => const TextStyle(
        fontFamily: 'Poppins',
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: AppColors.textPrimary,  
      );
 
  static TextStyle get caption => const TextStyle(
        fontFamily: 'Poppins',
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.textAccent,  
      );
 
  static TextStyle get button => const TextStyle(
        fontFamily: 'Poppins',
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: AppColors.buttonPrimary,  
      );
 
  static TextStyle get smallText => const TextStyle(
        fontFamily: 'Poppins',
        fontSize: 12,
        fontWeight: FontWeight.w300,
        color: AppColors.textSecondary, 
      );
 
  static TextStyle get header => const TextStyle(
        fontFamily: 'Poppins',
        fontSize: 28,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary, 
      );
 
  static TextStyle get error => const TextStyle(
        fontFamily: 'Poppins',
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.error,  
      );
 
  static TextStyle get appBarTitle => const TextStyle(
        fontFamily: 'Poppins',
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: AppColors.cardBackground, 
      );
}
