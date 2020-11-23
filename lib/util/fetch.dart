import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../constants.dart';

class Fetcher {
  static String auth;
  static FlutterSecureStorage _storage;

  static Future<String> _init() async {
    Codec<String, String> toBase64 = utf8.fuse(base64);
    _storage = FlutterSecureStorage();
    String user = await _storage.read(key: 'user');
    //String user = 'user1';
    String hash = await _storage.read(key: 'hash');
    //String hash = '573c5e885a733dc4cd3d0bc4f740717d301fe2194c620b6b5a611c6b7d35f988c96372296cc7913663e9ac4989b86cfe06937adad9e77b61af2d43d583def331';
    String encoded = toBase64.encode('$user:$hash');
    auth = 'Basic $encoded';
    return auth;
  }

  static Future<http.Response> authenticate(method, String url,
      {Map body, Map headers, int counter = 1}) async {
    if (counter > 2) throw Exception('too many attempts ($counter)');

    await _init();

    headers ??= Map<String, String>();
    headers.update('Authorization', (_) => auth, ifAbsent: () => auth);

    http.Response res = method == 'post'
        ? await http.post(url, headers: headers, body: jsonEncode(body))
        : await http.get(url, headers: headers);
    if (res.statusCode == 401)
      throw Exception('unauthorized');
    else
      return res;
  }

  static Future<Map> fetch(String method, String endpoint,
      {Map headers, Map body}) async {
    String url = '$globalHost/$endpoint';

    http.Response response;

    response = await authenticate(method, url, headers: headers, body: body);
    Map json = jsonDecode(response.body);
    print(json);
    if (json['status'] == 'failure')
      throw (json['msg']);
    else
      return json;
  }

  static Future<bool> get loggedIn async {
    try {
      await fetch('get', 'api/loading');
      return true;
    } catch (e) {
      return false;
    }
  }
}
