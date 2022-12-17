part of 'map_data_bloc.dart';

abstract class MapDataEvent extends Equatable {
  const MapDataEvent();

  @override
  List<Object> get props => [];
}

class LoadMapData extends MapDataEvent {
  final String token;
  const LoadMapData(this.token);
}
