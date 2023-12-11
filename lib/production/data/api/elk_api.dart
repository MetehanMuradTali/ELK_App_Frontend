import 'dart:convert';

import 'package:http/http.dart' as http;

class ElkApiService {
  searchColumn(
      {required String columnName,
      required String value,
      int pageNumber = 1}) async {
    var searchUrl = Uri.http(
        '127.0.0.1:5000', 'search/page/$columnName/$value/$pageNumber');
    try {
      var rawResponse = await http.get(searchUrl);
      Map<String, dynamic> decodedResponse =
          json.decode(rawResponse.body.replaceAll("NaN", '"Not a Number"'));
      return decodedResponse;
    } catch (error) {
      return {"result": "connection_error"};
    }
  }

  getCountOfResults({required String columnName, required String value}) async {
    var searchUrl =
        Uri.http('127.0.0.1:5000', 'search/count/$columnName/$value');
    try {
      var rawResponse = await http.get(searchUrl);
      Map<String, dynamic> decodedResponse = json.decode(rawResponse.body);
      return decodedResponse;
    } catch (error) {
      return {"result": "connection_error"};
    }
  }

  getAggregations(
      {required String columnName,
      required String value,
      required String sort}) async {
    var searchUrl = Uri.http(
        '127.0.0.1:5000', 'search/aggregations/$columnName/$value/$sort');
    try {
      var rawResponse = await http.get(searchUrl);
      Map<String, dynamic> decodedResponse = json.decode(rawResponse.body);
      return decodedResponse;
    } catch (error) {
      return {"result": "connection_error"};
    }
  }

  getReportAggregations(
      {required String columnName,
      required String colValue,
      required String categoryType}) async {
    var searchUrl = Uri.http('127.0.0.1:5000',
        'report/get/aggregations/$columnName/$colValue/$categoryType');
    try {
      var rawResponse = await http.get(searchUrl);
      Map<String, dynamic> decodedResponse = json.decode(rawResponse.body);
      return decodedResponse;
    } catch (error) {
      return {"result": "connection_error"};
    }
  }

  sendTheReport({required List<dynamic> aggregationList}) async {
    var searchUrl =
        Uri.http('127.0.0.1:5000', 'report/post/aggregations/$aggregationList');
    try {
      var rawResponse = await http.get(searchUrl);
      Map<String, dynamic> decodedResponse = json.decode(rawResponse.body);
      return decodedResponse;
    } catch (error) {
      return {"result": "connection_error"};
    }
  }

  searchLast1Hour({required String categoryType}) async {
    var searchUrl = Uri.http('127.0.0.1:5000', 'search/lasthour/$categoryType');
    try {
      var rawResponse = await http.get(searchUrl);
      Map<String, dynamic> decodedResponse = json.decode(rawResponse.body);
      return decodedResponse;
    } catch (error) {
      return {"result": "connection_error"};
    }
  }

  searchLatest1Hour({required String categoryType}) async {
    var searchUrl =
        Uri.http('127.0.0.1:5000', 'search/latesthour/$categoryType');
    try {
      var rawResponse = await http.get(searchUrl);
      Map<String, dynamic> decodedResponse = json.decode(rawResponse.body);
      return decodedResponse;
    } catch (error) {
      return {"result": "connection_error"};
    }
  }
}
