import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myapp/app_icons.dart';
import 'package:myapp/view/widgets/confirmation_bottom_sheet.dart';

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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
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
