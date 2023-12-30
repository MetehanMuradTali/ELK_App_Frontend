import 'dart:convert';

import 'package:http/http.dart' as http;

class ElkApiService {
  searchColumn(
      {required String columnName,
      required String value,
      int pageNumber = 1}) async {
    var searchUrl = Uri.http('127.0.0.1:5020', 'search/page');
    var encoded = json.encode(
        {"column": columnName, "value": value, "pageNumber": pageNumber});

    try {
      var rawResponse = await http.post(searchUrl,
          headers: {"Content-Type": "application/json"}, body: encoded);
      Map<String, dynamic> decodedResponse = json.decode(rawResponse.body);
      return decodedResponse;
    } catch (error) {
      return {"result": "connection_error"};
    }
  }

  getCountOfResults({required String columnName, required String value}) async {
    var searchUrl = Uri.http('127.0.0.1:5020', 'search/count');
    var encoded = json.encode({"column": columnName, "value": value});

    try {
      var rawResponse = await http.post(searchUrl,
          headers: {"Content-Type": "application/json"}, body: encoded);
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
    var searchUrl = Uri.http('127.0.0.1:5020', 'search/aggregations');
    var encoded =
        json.encode({"column": columnName, "value": value, "sort": sort});

    try {
      var rawResponse = await http.post(searchUrl,
          headers: {"Content-Type": "application/json"}, body: encoded);
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
    var searchUrl =
        Uri.http('127.0.0.1:5020', '/search/aggregations/getAddresses');
    var encoded = json.encode({
      "column": columnName,
      "colValue": colValue,
      "categoryType": categoryType
    });

    try {
      var rawResponse = await http.post(searchUrl,
          headers: {"Content-Type": "application/json"}, body: encoded);
      Map<String, dynamic> decodedResponse = json.decode(rawResponse.body);
      return decodedResponse;
    } catch (error) {
      return {"result": "connection_error"};
    }
  }

  searchLast1Hour({required String categoryType}) async {
    var searchUrl = Uri.http('127.0.0.1:5020', 'search/lasthour/$categoryType');
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
        Uri.http('127.0.0.1:5020', 'search/latesthour/$categoryType');
    try {
      var rawResponse = await http.get(searchUrl);
      Map<String, dynamic> decodedResponse = json.decode(rawResponse.body);
      return decodedResponse;
    } catch (error) {
      return {"result": "connection_error"};
    }
  }

  sendTheReport({required List<dynamic> aggregationList}) async {
    var searchUrl = Uri.http('127.0.0.1:5020', '/status/update/list');
    var encoded = json.encode({"list": aggregationList});
    try {
      var rawResponse = await http.post(searchUrl,
          headers: {"Content-Type": "application/json"}, body: encoded);
      Map<String, dynamic> decodedResponse = json.decode(rawResponse.body);
      return decodedResponse;
    } catch (error) {
      return {"result": "connection_error"};
    }
  }

  sendTheIps({required String saddr,required String daddr}) async {
    var searchUrl = Uri.http('127.0.0.1:5020', '/status/update/one');
    var encoded = json.encode({"saddr": saddr,"daddr":daddr});
    try {
      var rawResponse = await http.post(searchUrl,
          headers: {"Content-Type": "application/json"}, body: encoded);
      Map<String, dynamic> decodedResponse = json.decode(rawResponse.body);
      return decodedResponse;
    } catch (error) {
      return {"result": "connection_error"};
    }
  }
  getStatus(
      {required String sourceAdress,
      required String destinationAdress,
      required String status,
      int pageNumber = 1}) async {
    var searchUrl = Uri.http('127.0.0.1:5020', 'status/get/page');
    var encoded = json.encode({
      "saddr": sourceAdress,
      "daddr": destinationAdress,
      "status": status,
      "pageNumber": pageNumber
    });

    try {
      var rawResponse = await http.post(searchUrl,
          headers: {"Content-Type": "application/json"}, body: encoded);
      Map<String, dynamic> decodedResponse = json.decode(rawResponse.body);
      return decodedResponse;
    } catch (error) {
      return {"result": "connection_error"};
    }
  }

  getCountOfStatusResults(
      {required String sourceAdress,
      required String destinationAdress,
      required String status}) async {
    var searchUrl = Uri.http('127.0.0.1:5020', 'status/get/count');
    var encoded = json.encode(
        {"saddr": sourceAdress, "daddr": destinationAdress, "status": status});

    try {
      var rawResponse = await http.post(searchUrl,
          headers: {"Content-Type": "application/json"}, body: encoded);
      Map<String, dynamic> decodedResponse = json.decode(rawResponse.body);
      return decodedResponse;
    } catch (error) {
      return {"result": "connection_error"};
    }
  }
}
