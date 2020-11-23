import 'package:flutter/foundation.dart';
import '../util/fetch.dart';

class LoadingProvider extends ChangeNotifier {
  String imageURL;

  Future<String> getImageURL() async {
    Map json = await Fetcher.fetch('get', 'api/loading');
    print(json);
    imageURL = json['imageURL'];
    return imageURL;
  }
}
