// ignore_for_file: always_specify_types

part of 'recovery_key_cubit.dart';

class RecoveryKeyState extends ServerInstallationDependendState {
  const RecoveryKeyState(this._status, this.loadingStatus);

  const RecoveryKeyState.initial()
      : this(const RecoveryKeyStatus(exists: false, valid: false),
            LoadingStatus.refreshing,);

  final RecoveryKeyStatus _status;
  final LoadingStatus loadingStatus;

  bool get exists => _status.exists;
  bool get isValid => _status.valid;
  DateTime? get generatedAt => _status.date;
  DateTime? get expiresAt => _status.expiration;
  int? get usesLeft => _status.usesLeft;
  @override
  List<Object> get props => [_status, loadingStatus];

  RecoveryKeyState copyWith({
    final RecoveryKeyStatus? status,
    final LoadingStatus? loadingStatus,
  }) => RecoveryKeyState(
      status ?? _status,
      loadingStatus ?? this.loadingStatus,
    );
}
