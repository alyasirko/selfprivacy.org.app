part of 'server_detailed_info_cubit.dart';

abstract class ServerDetailsState extends ServerInstallationDependendState {
  const ServerDetailsState();

  @override
  List<Object> get props => [];
}

class ServerDetailsInitial extends ServerDetailsState {}

class ServerDetailsLoading extends ServerDetailsState {}

class ServerDetailsNotReady extends ServerDetailsState {}

class Loading extends ServerDetailsState {}

class Loaded extends ServerDetailsState {
  const Loaded({
    required this.serverInfo,
    required this.serverTimezone,
    required this.autoUpgradeSettings,
    required this.checkTime,
  });
  final HetznerServerInfo serverInfo;

  final TimeZoneSettings serverTimezone;

  final AutoUpgradeSettings autoUpgradeSettings;
  final DateTime checkTime;

  @override
  List<Object> get props => [
        serverInfo,
        serverTimezone,
        autoUpgradeSettings,
        checkTime,
      ];
}
