import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class BuscarUsuariosCall {
  static Future<ApiCallResponse> call({
    String? searchString = '',
    String? userId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'buscarUsuarios',
      apiUrl:
          'https://sgtgeiavmkvrdqqdwtsp.supabase.co/rest/v1/usuario?email=ilike.*${searchString}*&id=not.eq.${userId}&select=*',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNndGdlaWF2bWt2cmRxcWR3dHNwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjU1NDAxODMsImV4cCI6MjA0MTExNjE4M30.tfmsCa52F5DFHlvzzAzY-0KRfWCrQ8qkRGsA46vdgKk',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNndGdlaWF2bWt2cmRxcWR3dHNwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjU1NDAxODMsImV4cCI6MjA0MTExNjE4M30.tfmsCa52F5DFHlvzzAzY-0KRfWCrQ8qkRGsA46vdgKk',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AddMembrosCall {
  static Future<ApiCallResponse> call({
    String? searchString = '',
    String? currentMembersUid = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'AddMembros',
      apiUrl:
          'https://sgtgeiavmkvrdqqdwtsp.supabase.co/rest/v1/usuario?email=ilike.*${searchString}*&id=not.in.(${currentMembersUid})&select=*',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNndGdlaWF2bWt2cmRxcWR3dHNwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjU1NDAxODMsImV4cCI6MjA0MTExNjE4M30.tfmsCa52F5DFHlvzzAzY-0KRfWCrQ8qkRGsA46vdgKk',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNndGdlaWF2bWt2cmRxcWR3dHNwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjU1NDAxODMsImV4cCI6MjA0MTExNjE4M30.tfmsCa52F5DFHlvzzAzY-0KRfWCrQ8qkRGsA46vdgKk',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
