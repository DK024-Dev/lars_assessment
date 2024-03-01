// all providers should initialized here..

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_list_assesment/src/bloc/news/news_bloc.dart';

final List<BlocProvider> providers = [
  BlocProvider<NewsBloc>(create: (BuildContext context) => NewsBloc()),
];
