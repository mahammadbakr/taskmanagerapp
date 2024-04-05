import 'dart:convert';

import 'package:async/async.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:taskmanagerapp/core/logger.dart';

import 'local_storage.dart';

// live domain
// const String apiDomain = 'https://task-manager.onrender.com/api/v1';

// dev domain
// const String apiDomain = 'https://task-manager.onrender.com/api/v1';

// local host
const String apiDomain = "http://localhost:8080/api/v1";

class RemoteSources {
  static Future<Response> get(String route) async {
    try {
      final token = await localStorageGetString('token');

      final response = await http.get(
        Uri.parse('$apiDomain$route'),
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
        },
      );
      LoggerApp.logger.i(
          "GET[Route:'$route'][Status:${response.statusCode}][Body:${response.body}]");
      return response;
    } catch (e) {
      LoggerApp.logger.e("GET Error [Route:'$apiDomain$route'] [Error: $e]");
      return Response('', 500);
    }
  }

  static Future<Response> post(String route, {dynamic body = const {}}) async {
    try {
      final token = await localStorageGetString('token');
      final response = await http.post(
        Uri.parse('$apiDomain$route'),
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
        },
        body: json.encode(body),
      );
      LoggerApp.logger.i(
          "POST[Route:'$route'][Status:${response.statusCode}][Body:${response.body}]");
      return response;
    } catch (e) {
      LoggerApp.logger.e("POST Error [Route:'$apiDomain$route'] [Error: $e]");
      return Response('', 500);
    }
  }

  static Future<Response> patch(String route, {dynamic body = const {}}) async {
    try {
      final token = await localStorageGetString('token');
      final response = await http.patch(
        Uri.parse('$apiDomain$route'),
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
        },
        body: json.encode(body),
      );
      LoggerApp.logger.i(
          "POST[Route:'$route'][Status:${response.statusCode}][Body:${response.body}]");
      return response;
    } catch (e) {
      LoggerApp.logger.e("PATCH [Route:'$apiDomain$route'] [Error: $e]");
      rethrow;
    }
  }

  static Future<Response> put(String route, {dynamic body = const {}}) async {
    try {
      final token = await localStorageGetString('token');
      final response = await http.put(
        Uri.parse('$apiDomain$route'),
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
        },
        body: json.encode(body),
      );
      LoggerApp.logger.i(
          "POST[Route:'$route'][Status:${response.statusCode}][Body:${response.body}]");
      return response;
    } catch (e) {
      LoggerApp.logger.e("PATCH [Route:'$apiDomain$route'] [Error: $e]");
      rethrow;
    }
  }

  static Future<Response> delete(String route, {dynamic body}) async {
    try {
      final token = await localStorageGetString('token');
      final response = await http.delete(
        Uri.parse('$apiDomain$route'),
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
        },
        body: json.encode(body),
      );
      LoggerApp.logger.i(
          "POST[Route:'$route'][Status:${response.statusCode}][Body:${response.body}]");
      return response;
    } catch (e) {
      LoggerApp.logger.e("DELETE Error [Route:'$apiDomain$route'] [Error: $e]");
      rethrow;
    }
  }

  static CancelableOperation? _cancellableOperation;
  static Future<http.Response> getAndCancelPreviousRequest(String route) async {
    _cancellableOperation?.cancel();

    try {
      final token = await localStorageGetString('token');
      _cancellableOperation = CancelableOperation.fromFuture(
        http.get(
          Uri.parse('$apiDomain$route'),
          headers: {
            "Authorization": "Bearer $token",
            'Content-type': 'application/json',
          },
        ),
        onCancel: () {
          LoggerApp.logger.i("POST[Route:'$route']");
        },
      );
      final response = await _cancellableOperation?.value;
      return response;
    } catch (e) {
      LoggerApp.logger.e("DELETE Error [Route:'$apiDomain$route'] [Error: $e]");
      rethrow;
    }
  }
}
