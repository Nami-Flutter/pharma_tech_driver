import 'package:url_launcher/url_launcher.dart';
import 'dart:io';

class SocialMediaHelper {

  void openLink(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri,mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }
  void launchPhoneCall(String phoneNumber) async {
    final url = 'tel:$phoneNumber';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void openStore(String? packageName,String? appId) async {
    if (Platform.isIOS) {
      _openAppStore(appId);
    } else if (Platform.isAndroid) {
      _openGooglePlayStore(packageName);
    } else {
      print("Platform not supported for store linking");
    }
  }

  void _openGooglePlayStore(String? packageName) async {
    String url = 'https://play.google.com/store/apps/details?id=${packageName}';
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri,mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _openAppStore(String? appId) async {
    String url = 'https://apps.apple.com/app/$appId';
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri,mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  void  openEmailApp(String userName) async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: userName,
      query: 'subject=&body=',
    );
    final url = params.toString();
    final Uri uri = Uri.parse(url);
    launchUrl(uri);}

  void  openGoogleMap(double latitude, double longitude) async {
    String googleUrl = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';

    final Uri uri = Uri.parse(googleUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri,mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $googleUrl';
    }
  }
  void openGoogleMapByAddress(String address) async {
    // Encode the address for URL formatting
    final encodedAddress = Uri.encodeComponent(address);

    // Construct the Google Maps URL with the encoded address
    final String googleUrl = 'https://www.google.com/maps/place/$encodedAddress';

    final Uri uri = Uri.parse(googleUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch Google Maps with address: $address';
    }
  }


}
