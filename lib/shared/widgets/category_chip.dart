import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class CategoryChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback? onTap;
  final Color? selectedColor;
  final Color? unselectedColor;
  final Color? selectedTextColor;
  final Color? unselectedTextColor;

  const CategoryChip({
    Key? key,
    required this.label,
    this.isSelected = false,
    this.onTap,
    this.selectedColor,
    this.unselectedColor,
    this.selectedTextColor,
    this.unselectedTextColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final backgroundColor =
        isSelected ? (selectedColor ?? AppColors.primary) : (unselectedColor ?? AppColors.grey100);
    final textColor =
        isSelected
            ? (selectedTextColor ?? AppColors.textOnPrimary)
            : (unselectedTextColor ?? AppColors.textPrimary);

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected
                ? (selectedColor ?? AppColors.primary)
                : AppColors.border.withOpacity(0.3),
            width: isSelected ? 0 : 1,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: (selectedColor ?? AppColors.primary)
                        .withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
