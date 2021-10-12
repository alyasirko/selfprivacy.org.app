import 'package:get_it/get_it.dart';
import 'package:selfprivacy/logic/get_it/api_config.dart';
import 'package:selfprivacy/logic/get_it/console.dart';
import 'package:selfprivacy/logic/get_it/navigation.dart';
import 'package:selfprivacy/logic/get_it/ssh.dart';
import 'package:selfprivacy/logic/get_it/timer.dart';

export 'package:selfprivacy/logic/get_it/api_config.dart';
export 'package:selfprivacy/logic/get_it/console.dart';
export 'package:selfprivacy/logic/get_it/navigation.dart';
export 'package:selfprivacy/logic/get_it/timer.dart';

final getIt = GetIt.instance;

Future<void> getItSetup() async {
  getIt.registerSingleton<NavigationService>(NavigationService());

  getIt.registerSingleton<ConsoleModel>(ConsoleModel());
  getIt.registerSingleton<TimerModel>(TimerModel());
  getIt.registerSingleton<SSHModel>(SSHModel()..init());
  getIt.registerSingleton<ApiConfigModel>(ApiConfigModel()..init());

  await getIt.allReady();
}
