import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart';
import '../api_base_helper/app_exceptions.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import "../utiles/constant.dart";
import "../utiles/utility.dart";
import 'package:http_parser/http_parser.dart';

class ApiBaseHelper {
  final String _baseUrl = baseUrl;

  Future<dynamic> postMultipartRequest(String url, dynamic body) async {
    var responseJson;
    try {
      log('ApiBaseHelper postMultipartRequest url : ${_baseUrl + url}  body : ${body}');

      var urlURi = Uri.parse(_baseUrl + url);
      var request = MultipartRequest("POST", urlURi);
      request.fields.addAll(body);
      final response = await request.send();
      print(response.statusCode);
      if (response.statusCode == 200) {
        responseJson = json.decode(response.stream.toString());
      }
    } on SocketException {
      print('No net');
      throw FetchDataException('Please check your Internet Connection');
    }
    return responseJson;
  }

  Future<dynamic> getGoogle(String url) async {
    var responseJson;
    try {
      var urlURi = Uri.parse(url);
      log('ApiBaseHelper get url : ${url}');
      final response = await http.get(urlURi, headers: {
        //'Content-Type': 'application/json',
        //'Accept': 'application/json',
        //'Authorization': 'Bearer $token',
      });
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    print('api get recieved!');
    return responseJson;
  }

  Future<dynamic> get(String url) async {
    var responseJson;
    try {
      //var token = await Utility.jwtOrEmpty;
      var urlURi = Uri.parse(_baseUrl + url);
      log('ApiBaseHelper get url : ${_baseUrl + url}');
      final response = await http.get(urlURi, headers: {
        //'Content-Type': 'application/json',
        //'Accept': 'application/json',
        //'Authorization': 'Bearer $token',
      });
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('Please check your Internet Connection');
    }
    print('api get recieved!');
    return responseJson;
  }

  Future<dynamic> post(String url, dynamic body) async {
    var responseJson;
    try {
      log('ApiBaseHelper post url : ${_baseUrl + url}  body : ${body}');
      print("body : ${body}");
      //var token = await Utility.jwtOrEmpty;
      var urlURi = Uri.parse(_baseUrl + url);
      final response = await http.post(urlURi, body: body, headers: {
        //'Content-Type': 'application/json',
        //'Accept': 'application/json',
        //'Authorization': 'Bearer $token',
      });
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('Please check your Internet Connection');
    }
    return responseJson;
  }

  Future<dynamic> put(String url, dynamic body) async {
    var responseJson;
    try {
      // var token = await Utility.jwtOrEmpty;
      var urlURi = Uri.parse(_baseUrl + url);
      final response = await http.put(urlURi, body: body, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        //'Authorization': 'Bearer $token',
      });
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('Please check your Internet Connection');
    }
    print('api put.');
    print(responseJson.toString());
    return responseJson;
  }

  Future<dynamic> delete(String url) async {
    var apiResponse;
    //var token = await Utility.jwtOrEmpty;
    try {
      var urlURi = Uri.parse(_baseUrl + url);
      final response = await http.delete(urlURi, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        // 'Authorization': 'Bearer $token',
      });
      apiResponse = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('Please check your Internet Connection');
    }
    print('api delete.');
    return apiResponse;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        //  log(' ApiBaseHelper responseJson: $responseJson');
        return responseJson;
      case 201:
        var responseJson = json.decode(response.body.toString());
        //  log('responseJson: $responseJson');
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());

      case 401:
        var responseJson = json.decode(response.body.toString());

        return responseJson;
      case 404:
        var responseJson = json.decode(response.body.toString());
        // log(" responseJson ${responseJson}");
        return responseJson;
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        // log("response.statusCode ${response.statusCode}");
        // log(" response: ${response.body.toString()}");
        var responseJson = json.decode(response.body.toString());
        //print('responseJson: $responseJson');
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
