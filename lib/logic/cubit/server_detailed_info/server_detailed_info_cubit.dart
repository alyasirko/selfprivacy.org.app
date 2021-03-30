import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:selfprivacy/config/get_it_config.dart';
import 'package:selfprivacy/logic/cubit/server_detailed_info/server_detailed_info_repository.dart';
import 'package:selfprivacy/logic/models/hetzner_server_info.dart';

part 'server_detailed_info_state.dart';

class ServerDetailsCubit extends Cubit<ServerDetailsState> {
  ServerDetailsCubit() : super(ServerDetailsInitial());

  ServerDetailsRepository repository = ServerDetailsRepository();

  void check() async {
    var isReadyToCheck = getIt<ApiConfigModel>().hetznerServer != null;
    if (isReadyToCheck) {
      emit(ServerDetailsLoading());
      var data = await repository.load();
      emit(Loaded(serverInfo: data, checkTime: DateTime.now()));
    } else {
      emit(ServerDetailsNotReady());
    }
  }
}