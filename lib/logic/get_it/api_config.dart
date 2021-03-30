import 'package:hive/hive.dart';
import 'package:selfprivacy/config/hive_config.dart';
import 'package:selfprivacy/logic/models/backblaze_credential.dart';
import 'package:selfprivacy/logic/models/cloudflare_domain.dart';
import 'package:selfprivacy/logic/models/server_details.dart';

class ApiConfigModel {
  Box _box = Hive.box(BNames.appConfig);

  HetznerServerDetails? get hetznerServer => _hetznerServer;
  String? get hetznerKey => _hetznerKey;
  String? get cloudFlareKey => _cloudFlareKey;
  BackblazeCredential? get backblazeCredential => _backblazeCredential;
  CloudFlareDomain? get cloudFlareDomain => _cloudFlareDomain;

  String? _hetznerKey;
  String? _cloudFlareKey;
  HetznerServerDetails? _hetznerServer;
  BackblazeCredential? _backblazeCredential;
  CloudFlareDomain? _cloudFlareDomain;

  Future<void> storeHetznerKey(String value) async {
    await _box.put(BNames.hetznerKey, value);
    _hetznerKey = value;
  }

  Future<void> storeCloudFlareKey(String value) async {
    await _box.put(BNames.cloudFlareKey, value);
    _cloudFlareKey = value;
  }

  Future<void> storeBackblazeCredential(BackblazeCredential value) async {
    await _box.put(BNames.backblazeKey, value);

    _backblazeCredential = value;
  }

  Future<void> storeCloudFlareDomain(CloudFlareDomain value) async {
    await _box.put(BNames.cloudFlareDomain, value);
    _cloudFlareDomain = value;
  }

  Future<void> storeServerDetails(HetznerServerDetails value) async {
    await _box.put(BNames.hetznerServer, value);
    _hetznerServer = value;
  }

  clear() {
    _hetznerKey = null;
    _cloudFlareKey = null;
    _backblazeCredential = null;
    _cloudFlareDomain = null;
    _hetznerServer = null;
  }

  void init() {
    _hetznerKey = _box.get(BNames.hetznerKey);
    _cloudFlareKey = _box.get(BNames.cloudFlareKey);
    _backblazeCredential = _box.get(BNames.backblazeKey);
    _cloudFlareDomain = _box.get(BNames.cloudFlareDomain);
    _hetznerServer = _box.get(BNames.hetznerServer);
  }
}