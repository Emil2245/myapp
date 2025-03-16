import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleeepy_time/app_icons.dart';
import 'package:sleeepy_time/controller/shared_state.dart';
import 'package:sleeepy_time/repository/model/nap.dart';
import 'package:sleeepy_time/repository/model/strategy/abs_sleep_strategy.dart';
import 'package:sleeepy_time/view/components/kind_sleep_text.dart';
import 'package:sleeepy_time/view/components/reminder_bottom_text.dart';
import 'package:sleeepy_time/view/widgets/alarm_button.dart';

import 'components/settings_button.dart';

class TimeSelectionView extends StatefulWidget {
  const TimeSelectionView(
      {super.key,
      required this.title,
      required this.time,
      required this.strategy});

  final String title;

  final SleepStrategy strategy;
  final TimeOfDay? time;

  @override
  State<TimeSelectionView> createState() => _TimeSelectionViewState();
}

class _TimeSelectionViewState extends State<TimeSelectionView> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    int? sleepTime = Provider.of<SharedState>(context).sleepTime;

    return Scaffold(
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight((screenHeight * 0.20) + kToolbarHeight),
          child: AppBar(
              actions: [SettingsButton(title: widget.title)],
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  AppIcons.back,
                  color: Theme.of(context).colorScheme.onPrimary,
                  size: 34,
                ),
              ),
              title: Text(
                widget.title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontWeight: FontWeight.normal),
              ),
              centerTitle: true,
              automaticallyImplyLeading: false,
              backgroundColor: Theme.of(context).primaryColor,
              flexibleSpace: SafeArea(
                child: Column(
                  children: [
                    SizedBox(height: kToolbarHeight),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 40),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              widget.strategy.getTitle(),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                      fontWeight: FontWeight.normal),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimaryFixedVariant,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .tertiaryContainer
                                            .withOpacity(0.2),
                                      ),
                                    ],
                                  ),
                                  child: IconButton(
                                    onPressed: () async {
                                      await widget.strategy.onPressedRetry(
                                          context, widget.title);
                                    },
                                    icon: Icon(
                                      Icons.autorenew,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primaryContainer,
                                      size:
                                          24, // Ajusta el tamaño del ícono si es necesario
                                    ),
                                    padding: EdgeInsets
                                        .zero, // Reduce el padding interno del IconButton
                                  ),
                                ),
                                TextButton(
                                  onPressed: () async {
                                    await widget.strategy
                                        .onPressedRetry(context, widget.title);
                                  },
                                  child: Text(
                                    widget.time?.format(context) ?? "--:--",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onPrimary,
                                            fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              widget.strategy.getSubtitle(),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                      fontWeight: FontWeight.normal),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: SingleChildScrollView(
            child: Center(
          child: Column(
            children: widget.strategy is NapStrategy
                ? [
                    AlarmButton(
                        time: widget.strategy
                            .addTimes(widget.time as TimeOfDay, 0, sleepTime),
                        num: 0),
                    Row(
                      children: [
                        Expanded(
                          child: ReminderBottomText(),
                        ),
                      ],
                    ),
                  ]
                    .map(
                      (button) => Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 12.0),
                        child: button,
                      ),
                    )
                    .toList()
                : [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        KindSleepText(
                            textHeadline: "Para un descanso eficiente"),
                      ],
                    ),
                    AlarmButton(
                        time: widget.strategy
                            .addTimes(widget.time as TimeOfDay, 6, sleepTime),
                        num: 6),
                    AlarmButton(
                        time: widget.strategy
                            .addTimes(widget.time as TimeOfDay, 5, sleepTime),
                        num: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        KindSleepText(textHeadline: "Para un descanso regular"),
                      ],
                    ),
                    AlarmButton(
                        time: widget.strategy
                            .addTimes(widget.time as TimeOfDay, 4, sleepTime),
                        num: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        KindSleepText(
                            textHeadline: "Para un descanso deficiente"),
                      ],
                    ),
                    AlarmButton(
                        time: widget.strategy
                            .addTimes(widget.time as TimeOfDay, 3, sleepTime),
                        num: 3),
                    AlarmButton(
                        time: widget.strategy
                            .addTimes(widget.time as TimeOfDay, 2, sleepTime),
                        num: 2),
                    AlarmButton(
                        time: widget.strategy
                            .addTimes(widget.time as TimeOfDay, 1, sleepTime),
                        num: 1),
                    ReminderBottomText()
                  ]
                    .map(
                      (button) => Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 12.0),
                        child: button,
                      ),
                    )
                    .toList(),
          ),
        )));
  }
}
