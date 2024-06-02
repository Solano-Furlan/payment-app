import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:payment_app/core/design_system/helpers/screen_size.widget.helper.dart';
import 'package:payment_app/core/design_system/theme/colors.dart';
import 'package:payment_app/core/design_system/widgets/buttons/core_button.widget.dart';
import 'package:payment_app/core/design_system/widgets/texts/text.widget.dart';

enum ToggleSectionButtonType {
  section1,
  section2,
}

class UIToggleSectionButton extends StatelessWidget {
  const UIToggleSectionButton({
    required this.toggleSectionButtonType,
    super.key,
    required this.section1Text,
    required this.section2Text,
    required this.onToggled,
  });

  final ToggleSectionButtonType toggleSectionButtonType;
  final String section1Text;
  final String section2Text;
  final Function(ToggleSectionButtonType) onToggled;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 46,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: AppColors.dark3,
      ),
      padding: const EdgeInsets.all(4),
      child: Stack(
        children: [
          Row(
            children: [
              _buildToggleButton(
                text: section1Text,
                onPressed: () => onToggled(
                  ToggleSectionButtonType.section1,
                ),
              ),
              _buildToggleButton(
                text: section2Text,
                onPressed: () => onToggled(
                  ToggleSectionButtonType.section2,
                ),
              ),
            ],
          ),
          AnimatedAlign(
            alignment: _getAlignment,
            duration: const Duration(
              milliseconds: 300,
            ),
            child: Container(
              width: ScreenSizeHelper.getScreenWidth(context: context) / 2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  30,
                ),
                color: AppColors.background,
              ),
              alignment: Alignment.center,
              child: UIText(
                _getButtonText,
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildToggleButton({
    required String text,
    required VoidCallback onPressed,
  }) =>
      Expanded(
        child: UICoreButton(
          onPressed: onPressed,
          child: Center(
            child: UIText(
              text,
              color: AppColors.dark2,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ),
      );

  AlignmentGeometry get _getAlignment {
    switch (toggleSectionButtonType) {
      case ToggleSectionButtonType.section1:
        return Alignment.centerLeft;
      case ToggleSectionButtonType.section2:
        return Alignment.centerRight;
    }
  }

  String get _getButtonText {
    switch (toggleSectionButtonType) {
      case ToggleSectionButtonType.section1:
        return section1Text;
      case ToggleSectionButtonType.section2:
        return section2Text;
    }
  }
}
