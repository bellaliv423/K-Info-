import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class GuideCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;
  final Color? iconColor;
  final Color? backgroundColor;
  final bool isEnabled;

  const GuideCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.onTap,
    this.iconColor,
    this.backgroundColor,
    this.isEnabled = true,
  }) : super(key: key);

  @override
  State<GuideCard> createState() => _GuideCardState();
}

class _GuideCardState extends State<GuideCard> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: widget.isEnabled
          ? (_) {
              setState(() => _isPressed = true);
            }
          : null,
      onTapUp: widget.isEnabled
          ? (_) {
              setState(() => _isPressed = false);
            }
          : null,
      onTapCancel: widget.isEnabled
          ? () {
              setState(() => _isPressed = false);
            }
          : null,
      onTap: widget.isEnabled ? widget.onTap : null,
      child: AnimatedScale(
        scale: _isPressed ? 0.95 : 1.0,
        duration: const Duration(milliseconds: 150),
        child: Card(
          elevation: _isPressed ? 4 : 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          color: widget.isEnabled
              ? (widget.backgroundColor ?? AppColors.card)
              : AppColors.grey100,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: AppColors.border.withOpacity(0.2),
                width: 1,
              ),
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Icon container
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: (widget.iconColor ?? AppColors.primary)
                        .withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Icon(
                      widget.icon,
                      color:
                          widget.isEnabled
                              ? (widget.iconColor ?? AppColors.primary)
                              : AppColors.grey400,
                      size: 28,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Title
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: widget.isEnabled
                        ? AppColors.textPrimary
                        : AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 8),
                // Subtitle
                Text(
                  widget.subtitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 13,
                    color: widget.isEnabled
                        ? AppColors.textSecondary
                        : AppColors.grey500,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 12),
                // Arrow icon (optional)
                if (widget.isEnabled)
                  Icon(
                    Icons.arrow_forward_rounded,
                    size: 18,
                    color: AppColors.primary.withOpacity(0.6),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
