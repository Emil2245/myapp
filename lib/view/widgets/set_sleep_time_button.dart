import 'package:flutter/material.dart';
import 'package:myapp/view/widgets/bottom_sheet.dart';

class SetSleepTimeButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SetSleepTimeButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: const BorderRadius.all(Radius.circular(24)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
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
                  onPressed: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      builder: (BuildContext context) {
                        return SettingsBottomSheet();
                      },
                    );
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
