import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payment_app/core/dependencies/dependencies.dart';
import 'package:payment_app/core/design_system/helpers/screen_size.widget.helper.dart';
import 'package:payment_app/core/design_system/theme/colors.dart';
import 'package:payment_app/core/design_system/widgets/buttons/button.widget.dart';
import 'package:payment_app/core/design_system/widgets/cards/core_card.widget.dart';
import 'package:payment_app/core/design_system/widgets/texts/text.widget.dart';
import 'package:payment_app/core/navigation/services/dialogs.service.dart';
import 'package:payment_app/features/mobile_recharge/presentation/widgets/recharge_content.widget.dart';

class BeneficiaryCard extends StatelessWidget {
  const BeneficiaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    final double cardWidth =
        ScreenSizeHelper.getScreenWidth(context: context) * 0.35;

    return UICoreCard(
      width: cardWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const UIText(
            'Beneficiary',
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
            fontSize: 14,
            maxLines: 1,
          ),
          const SizedBox(height: 6),
          const UIText(
            '+372 6272 8025',
            color: AppColors.onBackground,
            fontWeight: FontWeight.w400,
            fontSize: 12,
            maxLines: 1,
          ),
          const Spacer(),
          UIButton(
            text: 'Recharge Now',
            onPressed: () => getIt<AppDialogsService>().showCoreBottomSheet(
              content: const RechargeContent(),
            ),
            height: 26,
            fontSize: 12,
          ),
        ],
      ),
    );
  }
}
