import 'package:selfprivacy/logic/api_maps/hetzner.dart';
import 'package:selfprivacy/logic/api_maps/server.dart';
import 'package:selfprivacy/logic/models/json/auto_upgrade_settings.dart';
import 'package:selfprivacy/logic/models/json/hetzner_server_info.dart';
import 'package:selfprivacy/logic/models/timezone_settings.dart';

class ServerDetailsRepository {
  var hetznerAPi = HetznerApi();
  var selfprivacyServer = ServerApi();

  Future<ServerDetailsRepositoryDto> load() async {
    print('load');
    return ServerDetailsRepositoryDto(
      autoUpgradeSettings: await selfprivacyServer.getAutoUpgradeSettings(),
      hetznerServerInfo: await hetznerAPi.getInfo(),
      serverTimezone: await selfprivacyServer.getServerTimezone(),
    );
  }
}

class ServerDetailsRepositoryDto {
  final HetznerServerInfo hetznerServerInfo;

  final TimeZoneSettings serverTimezone;

  final AutoUpgradeSettings autoUpgradeSettings;

  ServerDetailsRepositoryDto({
    required this.hetznerServerInfo,
    required this.serverTimezone,
    required this.autoUpgradeSettings,
  });
}
