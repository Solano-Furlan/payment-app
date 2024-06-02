import 'package:flutter/cupertino.dart';
import 'package:payment_app/core/design_system/theme/colors.dart';
import 'package:payment_app/core/design_system/widgets/buttons/button.widget.dart';
import 'package:payment_app/core/design_system/widgets/buttons/core_button.widget.dart';
import 'package:payment_app/core/design_system/widgets/texts/text.widget.dart';
import 'package:payment_app/features/mobile_recharge/domain/recharge_data.model.dart';

class RechargeContent extends StatefulWidget {
  const RechargeContent({super.key});

  @override
  State<RechargeContent> createState() => _RechargeContentState();
}

class _RechargeContentState extends State<RechargeContent> {
  final List<RechargeData> rechargeData = [
    RechargeData(
      name: 'AED\n5',
      value: 5,
    ),
    RechargeData(
      name: 'AED\n10',
      value: 10,
    ),
    RechargeData(
      name: 'AED\n20',
      value: 20,
    ),
    RechargeData(
      name: 'AED\n30',
      value: 30,
    ),
    RechargeData(
      name: 'AED\n50',
      value: 50,
    ),
    RechargeData(
      name: 'AED\n75',
      value: 75,
    ),
    RechargeData(
      name: 'AED\n100',
      value: 100,
    ),
  ];

  RechargeData? selectedRechargeData;

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
            rechargeData.length,
            (int index) => _buildItemCard(
              rechargeData: rechargeData[index],
            ),
          ),
        ),
        const SizedBox(height: 30),
        if (selectedRechargeData != null) ...[
          UIButton(
            text: 'Recharge',
            onPressed: () {},
          ),
        ],
      ],
    );
  }

  Widget _buildItemCard({
    required RechargeData rechargeData,
  }) =>
      UICoreButton(
        onPressed: () => setState(
          () => selectedRechargeData = rechargeData,
        ),
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              width: 1.5,
              color: selectedRechargeData == rechargeData
                  ? AppColors.primary
                  : AppColors.border,
            ),
            color: selectedRechargeData == rechargeData
                ? AppColors.primary
                : AppColors.white,
          ),
          alignment: Alignment.center,
          child: UIText(
            rechargeData.name,
            textAlign: TextAlign.center,
            fontWeight: selectedRechargeData == rechargeData
                ? FontWeight.bold
                : FontWeight.w400,
            color: selectedRechargeData == rechargeData
                ? AppColors.background
                : AppColors.onBackground,
          ),
        ),
      );
}
