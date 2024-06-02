import 'package:flutter/cupertino.dart';
import 'package:payment_app/core/design_system/theme/colors.dart';
import 'package:payment_app/core/design_system/widgets/texts/text.widget.dart';

class BalanceSection extends StatelessWidget {
  const BalanceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primary,
            AppColors.primary.withOpacity(.8),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: const [0.0, 1.0],
        ),
      ),
      alignment: Alignment.center,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 72),
          UIText(
            '€ 530.40',
            color: AppColors.background,
            fontSize: 48,
            fontWeight: FontWeight.w400,
          ),
          UIText(
            'Your Balance',
            color: AppColors.background,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ],
      ),
    );
  }
}
