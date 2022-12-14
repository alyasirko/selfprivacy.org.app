part of 'server.dart';

mixin ServicesApi on ApiMap {
  Future<List<Service>> getAllServices() async {
    QueryResult<Query$AllServices> response;
    List<Service> services = [];
    try {
      final GraphQLClient client = await getClient();
      response = await client.query$AllServices();
      if (response.hasException) {
        print(response.exception.toString());
      }
      services = response.parsedData?.services.allServices
              .map<Service>((final service) => Service.fromGraphQL(service))
              .toList() ??
          [];
    } catch (e) {
      print(e);
    }
    return services;
  }

  Future<GenericMutationResult> enableService(final String serviceId) async {
    try {
      final GraphQLClient client = await getClient();
      final variables = Variables$Mutation$EnableService(serviceId: serviceId);
      final mutation = Options$Mutation$EnableService(variables: variables);
      final response = await client.mutate$EnableService(mutation);
      return GenericMutationResult(
        success: response.parsedData?.enableService.success ?? false,
        code: response.parsedData?.enableService.code ?? 0,
        message: response.parsedData?.enableService.message,
      );
    } catch (e) {
      print(e);
      return GenericMutationResult(
        success: false,
        code: 0,
        message: e.toString(),
      );
    }
  }

  Future<GenericMutationResult> disableService(final String serviceId) async {
    try {
      final GraphQLClient client = await getClient();
      final variables = Variables$Mutation$DisableService(serviceId: serviceId);
      final mutation = Options$Mutation$DisableService(variables: variables);
      final response = await client.mutate$DisableService(mutation);
      return GenericMutationResult(
        success: response.parsedData?.disableService.success ?? false,
        code: response.parsedData?.disableService.code ?? 0,
        message: response.parsedData?.disableService.message,
      );
    } catch (e) {
      print(e);
      return GenericMutationResult(
        success: false,
        code: 0,
        message: e.toString(),
      );
    }
  }

  Future<GenericMutationResult> stopService(final String serviceId) async {
    try {
      final GraphQLClient client = await getClient();
      final variables = Variables$Mutation$StopService(serviceId: serviceId);
      final mutation = Options$Mutation$StopService(variables: variables);
      final response = await client.mutate$StopService(mutation);
      return GenericMutationResult(
        success: response.parsedData?.stopService.success ?? false,
        code: response.parsedData?.stopService.code ?? 0,
        message: response.parsedData?.stopService.message,
      );
    } catch (e) {
      print(e);
      return GenericMutationResult(
        success: false,
        code: 0,
        message: e.toString(),
      );
    }
  }

  Future<GenericMutationResult> startService(final String serviceId) async {
    try {
      final GraphQLClient client = await getClient();
      final variables = Variables$Mutation$StartService(serviceId: serviceId);
      final mutation = Options$Mutation$StartService(variables: variables);
      final response = await client.mutate$StartService(mutation);
      return GenericMutationResult(
        success: response.parsedData?.startService.success ?? false,
        code: response.parsedData?.startService.code ?? 0,
        message: response.parsedData?.startService.message,
      );
    } catch (e) {
      print(e);
      return GenericMutationResult(
        success: false,
        code: 0,
        message: e.toString(),
      );
    }
  }

  Future<GenericMutationResult> restartService(final String serviceId) async {
    try {
      final GraphQLClient client = await getClient();
      final variables = Variables$Mutation$RestartService(serviceId: serviceId);
      final mutation = Options$Mutation$RestartService(variables: variables);
      final response = await client.mutate$RestartService(mutation);
      return GenericMutationResult(
        success: response.parsedData?.restartService.success ?? false,
        code: response.parsedData?.restartService.code ?? 0,
        message: response.parsedData?.restartService.message,
      );
    } catch (e) {
      print(e);
      return GenericMutationResult(
        success: false,
        code: 0,
        message: e.toString(),
      );
    }
  }

  Future<GenericJobMutationReturn> moveService(
    final String serviceId,
    final String destination,
  ) async {
    try {
      final GraphQLClient client = await getClient();
      final variables = Variables$Mutation$MoveService(
        input: Input$MoveServiceInput(
          serviceId: serviceId,
          location: destination,
        ),
      );
      final mutation = Options$Mutation$MoveService(variables: variables);
      final response = await client.mutate$MoveService(mutation);
      final jobJson = response.parsedData?.moveService.job?.toJson();
      return GenericJobMutationReturn(
        success: response.parsedData?.moveService.success ?? false,
        code: response.parsedData?.moveService.code ?? 0,
        message: response.parsedData?.moveService.message,
        job: jobJson != null ? ServerJob.fromJson(jobJson) : null,
      );
    } catch (e) {
      print(e);
      return GenericJobMutationReturn(
        success: false,
        code: 0,
        message: e.toString(),
        job: null,
      );
    }
  }
}
