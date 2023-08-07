import 'dart:convert';
import 'dart:io';
import 'dart:async';

import 'package:http/http.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:http_parser/http_parser.dart';
import '../../main.dart';
import 'config.dart';

Map buildHeader() {
  return {'Content-Type': 'application/json', 'accept': 'application/json'};
}

Future<Response> postRequest(String endPoint, body) async {
  try {
    if (!await isNetworkAvailable()) throw noInternetMsg;

    String url = "$baseURL$endPoint";

    log('URL: $url');
    log('Request: $body');
    String accessToken = appStore.accessToken;
    Response response = await post(Uri.parse(url),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              "Accept": "application/json",
              'Authorization': 'Bearer $accessToken'
            },
            body: jsonEncode(body))
        .timeout(Duration(seconds: timeoutDuration),
            onTimeout: (() => throw "Please try again"));

    // log('Status: ${response.statusCode} $url $body');
    // debuglog(response.body);
    return response;
  } catch (e) {
    log(e);
    if (!await isNetworkAvailable()) {
      throw noInternetMsg;
    } else {
      throw "Please try again";
    }
  }
}

Future<Response> deleteRequest(String endPoint, body) async {
  try {
    if (!await isNetworkAvailable()) throw noInternetMsg;

    String url = "$baseURL$endPoint";

    log('URL: $url');
    log('Request: $body');
    String accessToken = appStore.accessToken;
    Response response = await delete(Uri.parse(url),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              "Accept": "application/json",
              'Authorization': 'Bearer $accessToken'
            },
            body: jsonEncode(body))
        .timeout(Duration(seconds: timeoutDuration),
            onTimeout: (() => throw "Please try again"));

    // log('Status: ${response.statusCode} $url $body');
    // debuglog(response.body);
    return response;
  } catch (e) {
    log(e);
    if (!await isNetworkAvailable()) {
      throw noInternetMsg;
    } else {
      throw "Please try again";
    }
  }
}

Future<StreamedResponse> postMultipartRequest(
    String endPoint, body, List<File> files) async {
  try {
    if (!await isNetworkAvailable()) throw noInternetMsg;

    String url = "$baseURL$endPoint";

    log('URL: $url');
    log('Request: $body');
    String accessToken = appStore.accessToken;
    var request = MultipartRequest("POST", Uri.parse(url));

    request.headers.addAll(
      <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Accept": "application/json",
        'Authorization': 'Bearer $accessToken'
      },
    );

    // ignore: unused_local_variable
    var length = await files.first.length();

    request.files.add(new MultipartFile.fromBytes(
      'images[0]',
      await File.fromUri(Uri.parse(files.first.path)).readAsBytes(),
      contentType: new MediaType('image', 'jpg'),
    ));

    StreamedResponse response = await request.send();
    print(response.statusCode);

    return response;
  } catch (e) {
    log(e);
    if (!await isNetworkAvailable()) {
      throw noInternetMsg;
    } else {
      throw "Please try again";
    }
  }
}

Future<Response> getRequest(String endPoint) async {
  try {
    if (!await isNetworkAvailable()) throw noInternetMsg;

    String url = '$baseURL$endPoint';
    // log(url);
    String accessToken = appStore.accessToken;
    Response response = await get(Uri.parse(url), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      "Accept": "application/json",
      'Authorization': 'Bearer $accessToken'
    }).timeout(Duration(seconds: timeoutDuration),
        onTimeout: (() => throw "Please try again"));

    // log('Code: ${response.statusCode} $url');
    //  debugPrint(response.body);
    return response;
  } catch (e) {
    log('$baseURL$endPoint');
    log(e);
    if (!await isNetworkAvailable()) {
      throw noInternetMsg;
    } else {
      throw "Please try again";
    }
  }
}

Future handleResponse(Response response) async {
  if (response.statusCode.isSuccessful()) {
    return jsonDecode(response.body);
  } else {
    log(response.body);
    if (response.body.isJson()) {
      throw jsonDecode(response.body);
    } else {
      if (!await isNetworkAvailable()) {
        throw noInternetMsg;
      } else {
        throw 'Please try again';
      }
    }
  }
}
