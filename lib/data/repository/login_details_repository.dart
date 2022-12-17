import '../data_provider/login_details_api.dart';
import '../model/login/login_data.dart';
import '../model/map_data/geo_data.dart';

class LoginDetailsRepository {
  final loginDetailsApi = LoginDetailsApi();

  //Getting login response
  Future<LoginData> getLoginDetails(String username, String password) {
    return loginDetailsApi.getLoginDetails(username, password);
  }

  Future<List<GeoData>> getMapData(String token) {
    return loginDetailsApi.getMapData(token);
  }
}
