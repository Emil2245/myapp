import 'package:flutter/material.dart';
import 'package:myapp/view/components/kind_sleep_text.dart';
import 'package:myapp/view/settings_view.dart';
import 'package:myapp/view/widgets/alarm_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../app_icons.dart';

class TimeSelectionView extends StatefulWidget {
  const TimeSelectionView(
      {super.key,
      required this.title,
      required this.time,
      required this.mode,
      required this.preTime});

  final String title;
  final int mode;
  final TimeOfDay? time;
  final int preTime;

  @override
  State<TimeSelectionView> createState() => _TimeSelectionViewState();
}

class _TimeSelectionViewState extends State<TimeSelectionView> {
  @override
  void initState() {
    super.initState();
    _loadSleepTime();
  }

  late int _sleepTime;
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(screenHeight * 0.27),
          child: AppBar(
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => SettingsView(
                          title: widget.title,
                        ),
                      ),
                    ).then((_) {
                      _loadSleepTime();
                    });
                  },
                  icon: Icon(
                    Icons.settings,
                    size: 25,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ],
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
                    // Additional Content
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              {
                                    1: "Despertando a las",
                                    2: "Durmiendo a las",
                                    3: "Durmiendo ahora",
                                    4: "Tomando una siesta ahora"
                                  }[widget.mode] ??
                                  "Texto por defecto",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
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
                                  decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimaryFixedVariant,
                                    borderRadius: BorderRadius.circular(40),
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
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.autorenew,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primaryContainer,
                                        size: 30,
                                      )),
                                ),
                                TextButton(
                                  onPressed: () {},
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
                              {
                                    1: "deberías dormir en una de las siguientes horas:",
                                    2: "deberías despertar en una de las siguientes horas:",
                                    3: "deberías despertar en una de las siguientes horas:",
                                    4: "deberías despertar a las:"
                                  }[widget.mode] ??
                                  "Texto por defecto",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
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
            children: widget.mode == 4
                ? [
                    AlarmButton(
                        onPressed: () {},
                        time: addTimes(
                            widget.time as TimeOfDay, 6, widget.preTime),
                        num: 6),
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
                        KindSleep(textHeadline: "Para un descanso eficiente"),
                      ],
                    ),
                    AlarmButton(
                        onPressed: () {},
                        time: addTimes(
                            widget.time as TimeOfDay, 6, widget.preTime),
                        num: 6),
                    AlarmButton(
                        onPressed: () {},
                        time: addTimes(
                            widget.time as TimeOfDay, 5, widget.preTime),
                        num: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        KindSleep(textHeadline: "Para un descanso regular"),
                      ],
                    ),
                    AlarmButton(
                        onPressed: () {},
                        time: addTimes(
                            widget.time as TimeOfDay, 4, widget.preTime),
                        num: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        KindSleep(textHeadline: "Para un descanso deficiente"),
                      ],
                    ),
                    AlarmButton(
                        onPressed: () {},
                        time: addTimes(
                            widget.time as TimeOfDay, 3, widget.preTime),
                        num: 3),
                    AlarmButton(
                        onPressed: () {},
                        time: addTimes(
                            widget.time as TimeOfDay, 2, widget.preTime),
                        num: 2),
                    AlarmButton(
                        onPressed: () {},
                        time: addTimes(
                            widget.time as TimeOfDay, 1, widget.preTime),
                        num: 1),
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

  Future<void> _loadSleepTime() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _sleepTime = prefs.getInt('timeToSleep') ?? 30;
    });
  }

  TimeOfDay addTimes(TimeOfDay time, int num, int pretime) {
    final horita = DateTime.now();
    final nuevaHora = horita.copyWith(hour: time.hour, minute: time.minute);

    Duration preTimeToAdd = Duration(minutes: pretime);
    Duration timeAdded = widget.mode == 4
        ? Duration(minutes: 26)
        : Duration(
            hours: (num * 1.5).floor().toInt(),
            minutes: !(num % 2 == 0) ? 30 : 0);

    final resultado = {
          1: nuevaHora.subtract(timeAdded).subtract(preTimeToAdd)
        }[widget.mode] ??
        nuevaHora.add(timeAdded).add(preTimeToAdd);

    return TimeOfDay(hour: resultado.hour, minute: resultado.minute);
  }
}
