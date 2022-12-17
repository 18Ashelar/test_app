import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/data/model/map_data/geo_data.dart';

import '../../../../data/repository/login_details_repository.dart';

part 'map_data_event.dart';
part 'map_data_state.dart';

class MapDataBloc extends Bloc<MapDataEvent, MapDataState> {
  LoginDetailsRepository loginDetailsRepository = LoginDetailsRepository();

  MapDataBloc() : super(MapDataInitial()) {
    on<LoadMapData>((event, emit) async {
      try {
        emit(MapDataLoading());

        final loginData = await loginDetailsRepository.getMapData(event.token);
        await Future.delayed(const Duration(seconds: 1));
        emit(MapDataLoaded(loginData));
      } catch (e) {
        emit(MapDataFailure(e.toString()));
      }
    });
  }
}
