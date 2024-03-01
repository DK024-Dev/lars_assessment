part of 'news_bloc.dart';

abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

class LoadingState extends NewsState {}

class NewsInitialState extends NewsState {}

class GetNewsState extends NewsState {
  final ProviderStatus newsStatus;
  final NewsModel? news;
  const GetNewsState({required this.newsStatus, this.news});
  @override
  List<Object> get props => [newsStatus];
}
