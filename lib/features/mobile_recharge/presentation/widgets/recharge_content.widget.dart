import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/core/dependencies/dependencies.dart';
import 'package:payment_app/core/design_system/theme/colors.dart';
import 'package:payment_app/core/design_system/widgets/buttons/button.widget.dart';
import 'package:payment_app/core/design_system/widgets/buttons/core_button.widget.dart';
import 'package:payment_app/core/design_system/widgets/texts/text.widget.dart';
import 'package:payment_app/core/navigation/services/dialogs.service.dart';
import 'package:payment_app/core/navigation/services/navigation.service.dart';
import 'package:payment_app/features/authentication/state/authentication/authentication.cubit.dart';
import 'package:payment_app/features/mobile_recharge/domain/dtos/mobile_recharge.dto.dart';
import 'package:payment_app/features/mobile_recharge/domain/models/recharge_option_data.model.dart';
import 'package:payment_app/features/mobile_recharge/state/mobile_recharge/mobile_recharge.cubit.dart';
import 'package:payment_app/features/mobile_recharge/state/mobile_recharge/mobile_recharge.state.dart';
import 'package:payment_app/features/user/domain/models/beneficiary.mode.dart';

class RechargeContent extends StatefulWidget {
  const RechargeContent({
    super.key,
    required this.beneficiary,
  });

  final Beneficiary beneficiary;

  @override
  State<RechargeContent> createState() => _RechargeContentState();
}

class _RechargeContentState extends State<RechargeContent> {
  final List<RechargeOptionData> _rechargeData = [
    RechargeOptionData(
      name: 'AED\n5',
      amount: 5,
    ),
    RechargeOptionData(
      name: 'AED\n10',
      amount: 10,
    ),
    RechargeOptionData(
      name: 'AED\n20',
      amount: 20,
    ),
    RechargeOptionData(
      name: 'AED\n30',
      amount: 30,
    ),
    RechargeOptionData(
      name: 'AED\n50',
      amount: 50,
    ),
    RechargeOptionData(
      name: 'AED\n75',
      amount: 75,
    ),
    RechargeOptionData(
      name: 'AED\n100',
      amount: 100,
    ),
  ];

  RechargeOptionData? _selectedRechargeData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const UIText(
          'Recharge Mobile Phone',
          color: AppColors.primary,
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
        const SizedBox(height: 12),
        const UIText(
          'Benefiary Name',
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        const SizedBox(height: 4),
        const UIText(
          '+372 6272 8025',
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(height: 30),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: List.generate(
            _rechargeData.length,
            (int index) => _buildItemCard(
              rechargeData: _rechargeData[index],
            ),
          ),
        ),
        const SizedBox(height: 30),
        if (_selectedRechargeData != null) ...[
          BlocBuilder<MobileRechargeCubit, MobileRechargeState>(
            builder: (BuildContext context, MobileRechargeState state) {
              return UIButton(
                text: 'Recharge',
                onPressed: _rechargeMobile,
                isLoading: state is MobileRechargeLoadingState,
              );
            },
          ),
        ],
      ],
    );
  }

  Widget _buildItemCard({
    required RechargeOptionData rechargeData,
  }) =>
      UICoreButton(
        onPressed: () => setState(
          () => _selectedRechargeData = rechargeData,
        ),
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              width: 1.5,
              color: _selectedRechargeData == rechargeData
                  ? AppColors.primary
                  : AppColors.border,
            ),
            color: _selectedRechargeData == rechargeData
                ? AppColors.primary
                : AppColors.white,
          ),
          alignment: Alignment.center,
          child: UIText(
            rechargeData.name,
            textAlign: TextAlign.center,
            fontWeight: _selectedRechargeData == rechargeData
                ? FontWeight.bold
                : FontWeight.w400,
            color: _selectedRechargeData == rechargeData
                ? AppColors.background
                : AppColors.onBackground,
          ),
        ),
      );

  Future<void> _rechargeMobile() async {
    if (_selectedRechargeData != null) {
      final MobileRechargeState mobileRechargeState =
          await context.read<MobileRechargeCubit>().rechargeMobile(
                mobileRechargeDto: MobileRechargeDto(
                  amount: _selectedRechargeData!.amount,
                  beneficiary: widget.beneficiary,
                  currentUserBalance: getIt<AuthenticationCubit>().user.balance,
                ),
              );

      if (mobileRechargeState is MobileRechargeSuccessState) {
        getIt<AppNavigationService>().pop();
      }
      if (mobileRechargeState is MobileRechargeErrorState) {
        getIt<AppDialogsService>().showErrorDialog(
          title: 'Recharge Failed',
          text: 'Failed to recharge, please check your internet connection.',
        );
      }
    }
  }
}
