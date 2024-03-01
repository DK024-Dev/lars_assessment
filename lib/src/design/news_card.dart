import '../core/configuration.dart';
import '../model/news_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../utils/date_time_utils.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    super.key,
    required this.news,
    this.onTap,
  });
  final Articles news;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(21),
        ),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(21),
                  child: CachedNetworkImage(
                    imageUrl: news.urlToImage ?? '',
                    placeholder: (context, url) => const SizedBox(
                      height: 200,
                      width: double.infinity,
                      child: Center(child: CircularProgressIndicator()),
                    ),
                    errorWidget: (context, url, error) => const SizedBox(
                      height: 200,
                      width: double.infinity,
                      child: Icon(Icons.error_outline_rounded),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(bottom: 20, left: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(21),
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: <Color>[Colors.transparent, Colors.black],
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          news.author ?? '',
                          style: AppTextStyle.smallTextStyle.copyWith(
                            fontSize: 14,
                            color: ColorConstant.whiteColor,
                          ),
                        ),
                        Text(
                          news.source?.name ?? '',
                          style: AppTextStyle.regularTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: ColorConstant.whiteColor,
                          ),
                        ),
                        Text(
                          customDateFormat(
                              convertStringToDateTime(news.publishedAt ?? '')!,
                              isUtc: true),
                          style: AppTextStyle.smallTextStyle.copyWith(
                            color: ColorConstant.greyColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 16,
                left: 19,
                right: 19,
                bottom: 24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    news.title ?? '',
                    style: AppTextStyle.regularTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    news.content ?? '',
                    style: AppTextStyle.smallTextStyle.copyWith(fontSize: 14),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    news.description ?? '',
                    style: AppTextStyle.smallTextStyle.copyWith(
                      color: ColorConstant.blackColor.withOpacity(0.3),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
