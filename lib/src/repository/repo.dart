import 'package:dartz/dartz.dart';
import 'package:infinite_list_assesment/src/model/news_model.dart';

import '../core/locator.dart';
import '../model/error_model.dart';
import '../service/api_service/api_service.dart';

class Repo {
  ///Get Employee
  Future<Either<ErrorModel, NewsModel>> getNews() async =>
      await Locator.instance.get<ApiService>().getNewsListApi();
}
