import 'package:dartz/dartz.dart';
import '../../core/configuration.dart';
import '../../model/news_model.dart';
import '../../model/error_model.dart';
import '../../utils/urls.dart';
import 'api_manager.dart';

class ApiService {
  Future<Either<ErrorModel, NewsModel>> getNewsListApi() async {
    var result = await ApiManager.makeApiCall(
      baseUrl,
      apiCallType: ApiCallType.GET,
    );

    return result.fold((error) => Left(error), (response) {
      return Right(NewsModel.fromJson(response as Map<String, dynamic>));
    });
  }
}
