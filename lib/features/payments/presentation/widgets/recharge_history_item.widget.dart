import 'package:flutter/cupertino.dart';
import 'package:payment_app/core/design_system/theme/colors.dart';
import 'package:payment_app/core/design_system/widgets/cards/core_card.widget.dart';
import 'package:payment_app/core/design_system/widgets/texts/text.widget.dart';

class RechargeHistoryItem extends StatelessWidget {
  const RechargeHistoryItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const UICoreCard(
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UIText(
                  'Beneficiary',
                  color: AppColors.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 4),
                UIText(
                  '+372 6272 8025',
                  color: AppColors.onBackground,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 4),
                UIText(
                  '14:30 PM',
                  color: AppColors.onBackground,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
          ),
          UIText(
            '€ 40.00',
            color: AppColors.onBackground,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}
