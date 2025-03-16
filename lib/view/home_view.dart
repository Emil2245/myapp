import 'package:flutter/material.dart';
import 'package:sleeepy_time/view/components/settings_button.dart';
import 'package:sleeepy_time/view/widgets/custom_button.dart';

import '../controller/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, required this.title});

  final String title;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TimeOfDay? selectedTime;
  late HomeController _controller;

  @override
  void initState() {
    super.initState();
    _controller = HomeController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
            (MediaQuery.of(context).size.height * 0.10) + kToolbarHeight),
        child: AppBar(
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
                  child: Column(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "¿Cuál horario elegirás?",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                      fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          actions: [SettingsButton(title: widget.title)],
        ),
      ),
      body: Container(
        color: Theme.of(context).colorScheme.primary,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _controller.sleepAtTimeStrategy,
                  _controller.wakeUpAtTimeStrategy,
                  _controller.sleepNowStrategy,
                  _controller.napStrategy
                ]
                    .map((sleepStrategy) => Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 16.0),
                          child: CustomButton(
                            onPressed: () =>
                                sleepStrategy.onPressed(context, widget.title),
                            iconPath: sleepStrategy.getIcon(),
                            topText: sleepStrategy.getDescription(),
                            bottomText: sleepStrategy.getActionText(),
                          ),
                        ))
                    .toList()),
          ),
        ),
      ),
    );
  }
}
