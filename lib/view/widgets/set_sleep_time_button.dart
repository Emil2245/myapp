import 'package:flutter/material.dart';
import 'package:myapp/view/widgets/settings_bottom_sheet.dart';

class SetSleepTimeButton extends StatelessWidget {
  final ValueChanged<int> onValueChanged;
  final int currentSleepTime;

  const SetSleepTimeButton({
    super.key,
    required this.onValueChanged,
    required this.currentSleepTime,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimaryFixedVariant,
          borderRadius: const BorderRadius.all(Radius.circular(24)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 6,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Text(
                "Cambia el tiempo que tardas en quedarte dormida",
                softWrap: true,
                maxLines: null,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      fontWeight: FontWeight.normal,
                    ),
              ),
            ),
            SizedBox(width: 15),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimaryFixedVariant,
                borderRadius: BorderRadius.circular(40),
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
                  onPressed: () async {
                    final newValue = await showModalBottomSheet<int>(
                      isScrollControlled: true,
                      context: context,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      builder: (BuildContext context) {
                        return SettingsBottomSheet(initialValue: currentSleepTime);
                      },
                    );
                    if (newValue != null) {
                      onValueChanged(newValue);
                    }
                  },
                  icon: Icon(
                    Icons.bedtime,
                    color: Theme.of(context).colorScheme.primaryContainer,
                    size: 30,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
