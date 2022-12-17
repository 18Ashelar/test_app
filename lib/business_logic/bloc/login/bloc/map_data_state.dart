part of 'map_data_bloc.dart';

abstract class MapDataState extends Equatable {
  const MapDataState();

  @override
  List<Object> get props => [];
}

class MapDataInitial extends MapDataState {}

class MapDataLoading extends MapDataState {}

class MapDataLoaded extends MapDataState {
  final List<GeoData> data;
  const MapDataLoaded(this.data);
}

class MapDataFailure extends MapDataState {
  final String message;
  const MapDataFailure(this.message);
}
