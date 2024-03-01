import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:infinite_list_assesment/src/core/configuration.dart';

///Call the [func] after [delay] seconds
void delayedStart(VoidCallback fun, {Duration? duration}) {
  Future.delayed(duration ?? const Duration(seconds: 2), () => fun());
}

///keyboard hide
void keyBoardHide(BuildContext context) {
  FocusScope.of(context).unfocus();
}

//this function helps to check internet connectivity
Future<bool> isConnectedToInternet() async {
  final connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile ||
      connectivityResult == ConnectivityResult.wifi ||
      connectivityResult == ConnectivityResult.ethernet) {
    return true;
  } else {
    return false;
  }
}
