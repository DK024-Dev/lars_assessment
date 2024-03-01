import 'package:get_it/get_it.dart';
import '../repository/repo.dart';
import '../service/api_service/api_service.dart';

class Locator {
  static GetIt _i = GetIt.instance;
  static GetIt get instance => _i;

  Locator.setup() {
    _i = GetIt.I;

    ///service
    _i.registerSingleton<ApiService>(ApiService());

    //repository
    _i.registerSingleton<Repo>(Repo());
  }
}
