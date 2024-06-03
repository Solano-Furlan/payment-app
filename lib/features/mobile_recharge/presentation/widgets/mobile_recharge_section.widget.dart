import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/core/dependencies/dependencies.dart';
import 'package:payment_app/core/design_system/theme/colors.dart';
import 'package:payment_app/core/design_system/widgets/buttons/toggle_button.widget.dart';
import 'package:payment_app/core/design_system/widgets/indicators/empty_list_indicator.widget.dart';
import 'package:payment_app/core/design_system/widgets/texts/text.widget.dart';
import 'package:payment_app/features/authentication/state/authentication/authentication.cubit.dart';
import 'package:payment_app/features/authentication/state/authentication/authentication.state.dart';
import 'package:payment_app/features/mobile_recharge/presentation/widgets/beneficiary_card.widget.dart';
import 'package:payment_app/features/mobile_recharge/presentation/widgets/recharge_history_item.widget.dart';

class MobileRechargeSection extends StatefulWidget {
  const MobileRechargeSection({super.key});

  @override
  State<MobileRechargeSection> createState() => _MobileRechargeSectionState();
}

class _MobileRechargeSectionState extends State<MobileRechargeSection> {
  ToggleSectionButtonType toggleSectionButtonType =
      ToggleSectionButtonType.section1;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const UIText(
                'Mobile Recharge',
                fontSize: 22,
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 12),
              UIToggleSectionButton(
                toggleSectionButtonType: toggleSectionButtonType,
                section1Text: 'Recharge',
                section2Text: 'History',
                onToggled:
                    (ToggleSectionButtonType newToggleSectionButtonType) {
                  setState(
                    () => toggleSectionButtonType = newToggleSectionButtonType,
                  );
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        _buildRechargeContent(),
      ],
    );
  }

  Widget _buildRechargeContent() {
    switch (toggleSectionButtonType) {
      case ToggleSectionButtonType.section1:
        return SizedBox(
          height: 105,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 4,
            ),
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(width: 8),
            itemCount: getIt<AuthenticationCubit>().user.beneficiaries.length,
            itemBuilder: (BuildContext context, int index) => BeneficiaryCard(
              beneficiary:
                  getIt<AuthenticationCubit>().user.beneficiaries[index],
            ),
          ),
        );
      case ToggleSectionButtonType.section2:
        if (getIt<AuthenticationCubit>().user.rechargeInfos.isEmpty) {
          return const Padding(
            padding: EdgeInsets.only(top: 30),
            child: Center(
              child: UIEmptyListIndicator(
                text: 'You have not done any mobile recharges yet.',
              ),
            ),
          );
        }
        return BlocBuilder<AuthenticationCubit, AuthenticationState>(
          builder: (
            BuildContext context,
            AuthenticationState state,
          ) {
            return Column(
              children: List.generate(
                getIt<AuthenticationCubit>().user.rechargeInfos.length,
                (int index) => Padding(
                  padding: const EdgeInsets.only(
                    right: 12,
                    left: 12,
                    bottom: 4,
                    top: 4,
                  ),
                  child: RechargeHistoryItem(
                    rechargeInfo:
                        getIt<AuthenticationCubit>().user.rechargeInfos[index],
                  ),
                ),
              ),
            );
          },
        );
    }
  }
}
