import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_list_assesment/src/core/configuration.dart';
import 'package:infinite_list_assesment/src/design/news_card.dart';
import 'package:infinite_list_assesment/src/model/news_model.dart';

import '../bloc/news/news_bloc.dart';
import 'common_widget/custom_scaffold.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with WidgetsBindingObserver {
  late double height;
  late double width;
  final TextEditingController _searchController = TextEditingController();
  List<Articles> articles = [];

  @override
  void initState() {
    BlocProvider.of<NewsBloc>(context).add(const GetNewsEvent());
    super.initState();
  }

  ///search from recent list
  void search(String search, List<Articles> news) async {
    ///refreshing list view
    final tempList = news
        .where((element) =>
            element.source!.name!.toLowerCase().contains(search.toLowerCase()))
        .toList();

    log('${tempList.length}length search');

    setState(() {
      articles = tempList;
    });
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return CustomScaffold(
      appBarColor: ColorConstant.kPrimaryLightRed,
      title: homeAppBar,
      actions: [
        IconButton(
          onPressed: () =>
              BlocProvider.of<NewsBloc>(context).add(const GetNewsEvent()),
          icon: Icon(
            Icons.refresh_rounded,
            color: ColorConstant.whiteColor,
          ),
        )
      ],
      body: Column(
        children: [
          searchTextfield(),
          Expanded(child: newsView()),
        ],
      ),
    );
  }

  Widget searchTextfield() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
      child: TextFormField(
        controller: _searchController,
        onChanged: (val) {
          search(val, articles);
        },
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide.none,
          ),
          fillColor: ColorConstant.greyColor,
          filled: true,
          hintText: 'Search source..',
          suffixIcon: IconButton(
            onPressed: () {
              _searchController.clear();
              BlocProvider.of<NewsBloc>(context).add(const GetNewsEvent());
            },
            icon: const Icon(Icons.cancel),
          ),
        ),
      ),
    );
  }

  Widget newsView() {
    return BlocConsumer<NewsBloc, NewsState>(
      listener: (context, state) {
        if (state is GetNewsState &&
            state.newsStatus == ProviderStatus.success) {
          articles = state.news?.articles ?? [];
        }
      },
      builder: (context, state) {
        if (state is GetNewsState &&
            state.newsStatus == ProviderStatus.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return articles.isNotEmpty
            ? ListView.builder(
                shrinkWrap: true,
                itemCount: articles.length,
                itemBuilder: (ctx, index) => NewsCard(news: articles[index]),
              )
            : Container(
                alignment: Alignment.center,
                height: height,
                child: Text(
                  noNews,
                  style: AppTextStyle.regularTextStyle.copyWith(fontSize: 16),
                ),
              );
      },
    );
  }
}
