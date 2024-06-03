import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/core/dependencies/dependencies.dart';
import 'package:payment_app/core/design_system/theme/colors.dart';
import 'package:payment_app/core/design_system/widgets/texts/text.widget.dart';
import 'package:payment_app/features/authentication/state/authentication/authentication.cubit.dart';
import 'package:payment_app/features/authentication/state/authentication/authentication.state.dart';

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 72),
          BlocBuilder<AuthenticationCubit, AuthenticationState>(
            builder: (BuildContext context, AuthenticationState state) {
              return UIText(
                'د.إ ${getIt<AuthenticationCubit>().user.balance.toStringAsFixed(2)}',
                color: AppColors.background,
                fontSize: 48,
                fontWeight: FontWeight.w400,
              );
            },
          ),
          const UIText(
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
