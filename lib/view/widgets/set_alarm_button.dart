import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sleeepy_time/app_icons.dart';
import 'package:sleeepy_time/view/widgets/confirmation_bottom_sheet.dart';

class SetAlarmButton extends StatelessWidget {
  final VoidCallback onPressed;
  final TimeOfDay? time;

  const SetAlarmButton({
    super.key,
    required this.onPressed,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimaryFixedVariant,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context)
                .colorScheme
                .tertiaryContainer
                .withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 2,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: IconButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return ConfirmationBottomSheet(
                  time: time,
                );
              },
            );
          },
          icon: ColorFiltered(
            colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.primaryContainer,
              BlendMode.srcIn,
            ),
            child: SvgPicture.asset(
              AppIcons.alarm,
              height: 40,
              width: 40,
            ),
          ),
        ),
      ),
    );
  }
}
