import 'package:flutter/cupertino.dart';
import 'package:payment_app/core/design_system/helpers/date.helper.dart';
import 'package:payment_app/core/design_system/theme/colors.dart';
import 'package:payment_app/core/design_system/widgets/cards/core_card.widget.dart';
import 'package:payment_app/core/design_system/widgets/texts/text.widget.dart';
import 'package:payment_app/features/user/domain/models/recharge_info.model.dart';

class RechargeHistoryItem extends StatelessWidget {
  const RechargeHistoryItem({
    required this.rechargeInfo,
    super.key,
  });

  final RechargeInfo rechargeInfo;

  @override
  Widget build(BuildContext context) {
    return UICoreCard(
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UIText(
                  rechargeInfo.beneficiary.name,
                  color: AppColors.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 4),
                UIText(
                  rechargeInfo.beneficiary.phoneNumber,
                  color: AppColors.onBackground,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 4),
                UIText(
                  DateFormatterHelper.smartDate(
                    date: rechargeInfo.date,
                  ),
                  color: AppColors.onBackground,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
          ),
          UIText(
            'د.إ ${rechargeInfo.amount.toStringAsFixed(2)}',
            color: AppColors.onBackground,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}
