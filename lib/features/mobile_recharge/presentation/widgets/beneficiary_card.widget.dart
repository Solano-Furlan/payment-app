import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/core/dependencies/dependencies.dart';
import 'package:payment_app/core/design_system/helpers/screen_size.widget.helper.dart';
import 'package:payment_app/core/design_system/theme/colors.dart';
import 'package:payment_app/core/design_system/widgets/buttons/button.widget.dart';
import 'package:payment_app/core/design_system/widgets/cards/core_card.widget.dart';
import 'package:payment_app/core/design_system/widgets/texts/text.widget.dart';
import 'package:payment_app/core/event_bus/event_bus.service.dart';
import 'package:payment_app/core/navigation/services/dialogs.service.dart';
import 'package:payment_app/features/mobile_recharge/data/mobile_recharge.repository.dart';
import 'package:payment_app/features/mobile_recharge/presentation/widgets/recharge_content.widget.dart';
import 'package:payment_app/features/mobile_recharge/state/mobile_recharge/mobile_recharge.cubit.dart';
import 'package:payment_app/features/user/domain/models/beneficiary.mode.dart';

class BeneficiaryCard extends StatelessWidget {
  const BeneficiaryCard({
    required this.beneficiary,
    super.key,
  });

  final Beneficiary beneficiary;

  @override
  Widget build(BuildContext context) {
    final double cardWidth =
        ScreenSizeHelper.getScreenWidth(context: context) * 0.35;

    return UICoreCard(
      width: cardWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UIText(
            beneficiary.name,
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
            fontSize: 14,
            maxLines: 1,
          ),
          const SizedBox(height: 6),
          UIText(
            beneficiary.phoneNumber,
            color: AppColors.onBackground,
            fontWeight: FontWeight.w400,
            fontSize: 12,
            maxLines: 1,
          ),
          const Spacer(),
          UIButton(
            text: 'Recharge Now',
            onPressed: () => getIt<AppDialogsService>().showCoreBottomSheet(
              content: BlocProvider(
                create: (context) => MobileRechargeCubit(
                  mobileRechargeRepository: getIt<MobileRechargeRepository>(),
                  eventBus: getIt<EventBus>(),
                ),
                child: RechargeContent(
                  beneficiary: beneficiary,
                ),
              ),
            ),
            height: 26,
            fontSize: 12,
          ),
        ],
      ),
    );
  }
}
