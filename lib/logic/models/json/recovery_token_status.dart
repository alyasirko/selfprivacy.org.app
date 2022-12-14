import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'recovery_token_status.g.dart';

@JsonSerializable()
class RecoveryKeyStatus extends Equatable {
  factory RecoveryKeyStatus.fromJson(final Map<String, dynamic> json) =>
      _$RecoveryKeyStatusFromJson(json);
  const RecoveryKeyStatus({
    required this.exists,
    required this.valid,
    this.date,
    this.expiration,
    this.usesLeft,
  });

  final bool exists;
  final DateTime? date;
  final DateTime? expiration;
  @JsonKey(name: 'uses_left')
  final int? usesLeft;
  final bool valid;

  @override
  List<Object?> get props => [
        exists,
        date,
        expiration,
        usesLeft,
        valid,
      ];
}
