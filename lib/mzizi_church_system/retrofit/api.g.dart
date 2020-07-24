// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestClient implements RestClient {
  _RestClient(this._dio) {
    ArgumentError.checkNotNull(_dio, '_dio');
    _dio.options.baseUrl = 'https://api-church.mzizi.co.ke/api';
  }

  final Dio _dio;

  @override
  apiGetAuthenticationUserResponse(request) async {
    ArgumentError.checkNotNull(request, 'request');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request ?? {});
    final _result = await _dio.request('/UserCredentials',
        queryParameters: queryParameters,
        options: RequestOptions(method: 'POST', headers: {}, extra: _extra),
        data: _data);
    var value = AuthenticationUserResponse.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  apiGetPortalDetailedTransactions(request) async {
    ArgumentError.checkNotNull(request, 'request');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request ?? {});
    final _result = await _dio.request('/PortalDetailedTransaction',
        queryParameters: queryParameters,
        options: RequestOptions(method: 'POST', headers: {}, extra: _extra),
        data: _data);
    var value = (_result.data as List)
        .map((i) => PortalDetailedTransaction.fromJson(i))
        .toList();
    return Future.value(value);
  }

  @override
  apiGetFilteredStudentInfo(request) async {
    ArgumentError.checkNotNull(request, 'request');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request ?? {});
    final _result = await _dio.request('/FilteredStudentInfo',
        queryParameters: queryParameters,
        options: RequestOptions(method: 'POST', headers: {}, extra: _extra),
        data: _data);
    var value = PortalFilteredStudentInfo.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  apiGetSyncMyAccount(request) async {
    ArgumentError.checkNotNull(request, 'request');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request ?? {});
    final _result = await _dio.request('/SyncMyAccount',
        queryParameters: queryParameters,
        options: RequestOptions(method: 'POST', headers: {}, extra: _extra),
        data: _data);
    var value = PortalSyncMyAccount.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  apiGetPortalNotificationsReadTracking(request) async {
    ArgumentError.checkNotNull(request, 'request');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request ?? {});
    final _result = await _dio.request('/PortalNotificationsReadTracking',
        queryParameters: queryParameters,
        options: RequestOptions(method: 'POST', headers: {}, extra: _extra),
        data: _data);
    var value = _result.data;
    return Future.value(value);
  }

  @override
  apiGetPortalGlobalSettings(request) async {
    ArgumentError.checkNotNull(request, 'request');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request ?? {});
    final _result = await _dio.request('/PortalGetGlobalSettings',
        queryParameters: queryParameters,
        options: RequestOptions(method: 'POST', headers: {}, extra: _extra),
        data: _data);
    var value = _result.data;
    return Future.value(value);
  }

  @override
  apiGetMziziAppVersion(request) async {
    ArgumentError.checkNotNull(request, 'request');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request ?? {});
    final _result = await _dio.request('/MziziAppVersion',
        queryParameters: queryParameters,
        options: RequestOptions(method: 'POST', headers: {}, extra: _extra),
        data: _data);
    var value = MziziAppVersion.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  apiGetPortalContacts(request) async {
    ArgumentError.checkNotNull(request, 'request');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request ?? {});
    final _result = await _dio.request('/PortalContacts',
        queryParameters: queryParameters,
        options: RequestOptions(method: 'POST', headers: {}, extra: _extra),
        data: _data);
    var value =
        (_result.data as List).map((i) => PortalContacts.fromJson(i)).toList();
    return Future.value(value);
  }

  @override
  apiGetPortalEvents(request) async {
    ArgumentError.checkNotNull(request, 'request');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request ?? {});
    final _result = await _dio.request('/PortalEvents',
        queryParameters: queryParameters,
        options: RequestOptions(method: 'POST', headers: {}, extra: _extra),
        data: _data);
    var value =
        (_result.data as List).map((i) => PortalEvents.fromJson(i)).toList();
    return Future.value(value);
  }

  @override
  apiGetPortalNotifications(request) async {
    ArgumentError.checkNotNull(request, 'request');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request ?? {});
    final _result = await _dio.request('/PortalNotifications',
        queryParameters: queryParameters,
        options: RequestOptions(method: 'POST', headers: {}, extra: _extra),
        data: _data);
    var value = (_result.data as List)
        .map((i) => PortalNotification.fromJson(i))
        .toList();
    return Future.value(value);
  }

  @override
  apiGetPortalSiblings(request) async {
    ArgumentError.checkNotNull(request, 'request');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request ?? {});
    final _result = await _dio.request('/PortalSiblings',
        queryParameters: queryParameters,
        options: RequestOptions(method: 'POST', headers: {}, extra: _extra),
        data: _data);
    var value =
        (_result.data as List).map((i) => PortalSiblings.fromJson(i)).toList();
    return Future.value(value);
  }

  @override
  apiGetPortalStudentDetailedResults(request) async {
    ArgumentError.checkNotNull(request, 'request');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request ?? {});
    final _result = await _dio.request('/PortalStudentDetailedResults',
        queryParameters: queryParameters,
        options: RequestOptions(method: 'POST', headers: {}, extra: _extra),
        data: _data);
    var value = (_result.data as List)
        .map((i) => PortalStudentDetailedResults.fromJson(i))
        .toList();
    return Future.value(value);
  }

  @override
  apiGetPortalStudentInfo(request) async {
    ArgumentError.checkNotNull(request, 'request');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request ?? {});
    final _result = await _dio.request('/PortalStudentInfo',
        queryParameters: queryParameters,
        options: RequestOptions(method: 'POST', headers: {}, extra: _extra),
        data: _data);
    var value = PortalStudentInfo.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  apiGetPortalGetProgressReport(request) async {
    ArgumentError.checkNotNull(request, 'request');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request ?? {});
    final _result = await _dio.request('/PortalGetProgressReport',
        queryParameters: queryParameters,
        options: RequestOptions(method: 'POST', headers: {}, extra: _extra),
        data: _data);
    var value = (_result.data as List)
        .map((i) => PortalProgressReport.fromJson(i))
        .toList();
    return Future.value(value);
  }

  @override
  apiGetPortalParentsChat(request) async {
    ArgumentError.checkNotNull(request, 'request');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request ?? {});
    final _result = await _dio.request('/PortalParentChat',
        queryParameters: queryParameters,
        options: RequestOptions(method: 'POST', headers: {}, extra: _extra),
        data: _data);
    var value = (_result.data as List)
        .map((i) => ParentChatResponse.fromJson(i))
        .toList();
    return Future.value(value);
  }

  @override
  apiGetPortalToDoList(request) async {
    ArgumentError.checkNotNull(request, 'request');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request ?? {});
    final _result = await _dio.request('/PortalToDoList',
        queryParameters: queryParameters,
        options: RequestOptions(method: 'POST', headers: {}, extra: _extra),
        data: _data);
    var value =
        (_result.data as List).map((i) => PortalToDoList.fromJson(i)).toList();
    return Future.value(value);
  }

  @override
  apiGetPortalDetailedToDoList(request) async {
    ArgumentError.checkNotNull(request, 'request');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request ?? {});
    final _result = await _dio.request('/PortalDetailedToDoList',
        queryParameters: queryParameters,
        options: RequestOptions(method: 'POST', headers: {}, extra: _extra),
        data: _data);
    var value = (_result.data as List)
        .map((i) => PortalDetailedTodoList.fromJson(i))
        .toList();
    return Future.value(value);
  }

  @override
  apiGetPortalRecentTransactions(request) async {
    ArgumentError.checkNotNull(request, 'request');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request ?? {});
    final _result = await _dio.request('/PortalRecentTransactions',
        queryParameters: queryParameters,
        options: RequestOptions(method: 'POST', headers: {}, extra: _extra),
        data: _data);
    var value = (_result.data as List)
        .map((i) => PortalRecentTransaction.fromJson(i))
        .toList();
    return Future.value(value);
  }

  @override
  apiGetPortalStudentVisualization(request) async {
    ArgumentError.checkNotNull(request, 'request');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request ?? {});
    final _result = await _dio.request('/PortalStudentVisualization',
        queryParameters: queryParameters,
        options: RequestOptions(method: 'POST', headers: {}, extra: _extra),
        data: _data);
    var value = (_result.data as List)
        .map((i) => PortalStudentVisualization.fromJson(i))
        .toList();
    return Future.value(value);
  }

  @override
  apiGetPortalStudentVisualizationAverage(request) async {
    ArgumentError.checkNotNull(request, 'request');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request ?? {});
    final _result = await _dio.request('/PortalStudentVisualizationAverage',
        queryParameters: queryParameters,
        options: RequestOptions(method: 'POST', headers: {}, extra: _extra),
        data: _data);
    var value = (_result.data as List)
        .map((i) => PortalStudentVisualizationAverage.fromJson(i))
        .toList();
    return Future.value(value);
  }

  @override
  apiGetPortalStudentResultsExtended(request) async {
    ArgumentError.checkNotNull(request, 'request');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request ?? {});
    final _result = await _dio.request('/PortalStudentResults',
        queryParameters: queryParameters,
        options: RequestOptions(method: 'POST', headers: {}, extra: _extra),
        data: _data);
    var value = (_result.data as List)
        .map((i) => PortalStudentResultsExtended.fromJson(i))
        .toList();
    return Future.value(value);
  }
}
