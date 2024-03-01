import '../../core/configuration.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    this.title,
    required this.body,
    this.actions,
    this.backgroundColor,
    this.appBarColor,
    this.resizeToAvoidBottomInset = false,
    this.backWidget,
  });

  final String? title;
  final Widget body;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final Color? appBarColor;
  final bool? resizeToAvoidBottomInset;
  final Widget? backWidget;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanDown: (_) => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: backgroundColor ?? ColorConstant.kBackgroundColor,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        appBar: AppBar(
          backgroundColor:
              appBarColor ?? backgroundColor ?? ColorConstant.kBackgroundColor,
          elevation: 0.0,
          leadingWidth: 60,
          leading: backWidget ??
              (ModalRoute.of(context)!.canPop
                  ? IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back_rounded),
                    )
                  : null),
          actions: actions,
          centerTitle: true,
          title: title != null
              ? Text(
                  title!,
                  style: AppTextStyle.appBarTextStyle
                      .copyWith(color: ColorConstant.whiteColor),
                )
              : null,
        ),
        body: body,
      ),
    );
  }
}
