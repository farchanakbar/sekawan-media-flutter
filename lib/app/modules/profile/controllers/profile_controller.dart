import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileController extends GetxController {
  Future<void> gotoLink(String url) async {
    Uri link = Uri.parse(url);
    await launchUrl(link);
  }
}
