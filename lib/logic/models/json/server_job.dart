import 'package:json_annotation/json_annotation.dart';
import 'package:selfprivacy/logic/api_maps/graphql_maps/schema/server_api.graphql.dart';

part 'server_job.g.dart';

@JsonSerializable()
class ServerJob {
  factory ServerJob.fromJson(final Map<String, dynamic> json) =>
      _$ServerJobFromJson(json);
  ServerJob({
    required this.name,
    required this.description,
    required this.status,
    required this.uid,
    required this.updatedAt,
    required this.createdAt,
    final this.error,
    final this.progress,
    final this.result,
    final this.statusText,
    final this.finishedAt,
  });

  ServerJob.fromGraphQL(final Query$GetApiJobs$jobs$getJobs serverJob)
      : this(
          createdAt: serverJob.createdAt,
          description: serverJob.description,
          error: serverJob.error,
          finishedAt: serverJob.finishedAt,
          name: serverJob.name,
          progress: serverJob.progress,
          result: serverJob.result,
          status: serverJob.status,
          statusText: serverJob.statusText,
          uid: serverJob.uid,
          updatedAt: serverJob.updatedAt,
        );
  final String name;
  final String description;
  final String status;
  final String uid;
  final DateTime updatedAt;
  final DateTime createdAt;

  final String? error;
  final int? progress;
  final String? result;
  final String? statusText;
  final DateTime? finishedAt;
}