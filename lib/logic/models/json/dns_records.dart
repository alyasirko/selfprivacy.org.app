import 'package:json_annotation/json_annotation.dart';

part 'dns_records.g.dart';

@JsonSerializable(createToJson: true, createFactory: false)
class DnsRecord {
  DnsRecord({
    required this.type,
    required this.name,
    required this.content,
    this.ttl = 3600,
    this.priority = 10,
    this.proxied = false,
  });

  final String type;
  final String? name;
  final String? content;
  final int ttl;
  final int priority;
  final bool proxied;

  Map<String, dynamic> toJson() => _$DnsRecordToJson(this);
}