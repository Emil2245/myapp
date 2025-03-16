import 'package:sleeepy_time/repository/model/nap.dart';
import 'package:sleeepy_time/repository/model/sleep_at_time.dart';
import 'package:sleeepy_time/repository/model/sleep_now.dart';
import 'package:sleeepy_time/repository/model/wakeup_at_time.dart';

class HomeController {
  NapStrategy napStrategy = NapStrategy();
  SleepAtTimeStrategy sleepAtTimeStrategy = SleepAtTimeStrategy();
  SleepNowStrategy sleepNowStrategy= SleepNowStrategy();
  WakeUpAtTimeStrategy wakeUpAtTimeStrategy = WakeUpAtTimeStrategy();
}