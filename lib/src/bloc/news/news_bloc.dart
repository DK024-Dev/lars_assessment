import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_list_assesment/src/model/news_model.dart';
import '../../core/configuration.dart';
import '../../core/locator.dart';
import '../../repository/repo.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(NewsInitialState()) {
    on<NewsEvent>((event, emit) {
      emit(NewsInitialState());
    });

    ///get employees
    on<GetNewsEvent>((event, emit) async {
      emit(const GetNewsState(newsStatus: ProviderStatus.loading));

      final result = await Locator.instance.get<Repo>().getNews();

      final GetNewsState state = result.fold((fail) {
        return const GetNewsState(newsStatus: ProviderStatus.error);
      }, (employees) {
        return GetNewsState(
          newsStatus: ProviderStatus.success,
          news: employees,
        );
      });
      emit(state);
    });
  }
}
