import 'package:flutter/material.dart';
import 'package:payment_app/core/design_system/theme/colors.dart';
import 'package:payment_app/core/design_system/widgets/buttons/core_button.widget.dart';

class UICoreCard extends StatelessWidget {
  const UICoreCard({
    required this.child,
    this.onPressed,
    this.padding = 12,
    this.width,
    super.key,
  });

  final Widget child;
  final VoidCallback? onPressed;
  final double padding;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return UICoreButton(
      onPressed: onPressed != null ? onPressed! : () {},
      child: Container(
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: EdgeInsets.all(padding),
            child: child,
          ),
        ),
      ),
    );
  }
}
