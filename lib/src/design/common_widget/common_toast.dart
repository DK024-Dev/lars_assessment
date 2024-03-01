import 'package:infinite_list_assesment/main.dart';
import 'package:infinite_list_assesment/src/core/configuration.dart';

void showSnackBar({String? msg}) =>
    ScaffoldMessenger.of(globalNavigatorKey.currentContext!)
        .showSnackBar(SnackBar(content: Text(msg!)));
