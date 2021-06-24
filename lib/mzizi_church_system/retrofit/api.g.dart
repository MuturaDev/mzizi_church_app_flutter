// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestClient implements RestClient {
  _RestClient(this._dio) {
    ArgumentError.checkNotNull(_dio, '_dio');
  }

  final Dio _dio;

  final String baseUrl = 'https://api-church.mzizi.co.ke/api';

  @override
  apiGetAuthenticationUserResponse(request) async {
    ArgumentError.checkNotNull(request, 'request');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request ?? <String, dynamic>{});
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/UserCredentials',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = AuthenticationUserResponse.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  apiGetPortalDetailedTransactions(request) async {
    ArgumentError.checkNotNull(request, 'request');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request ?? <String, dynamic>{});
    final Response<List<dynamic>> _result = await _dio.request(
        '/PortalDetailedTransaction',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) =>
            PortalDetailedTransaction.fromJson(i as Map<String, dynamic>))
        .toList();
    return Future.value(value);
  }

  @override
  apiGetFilteredStudentInfo(request) async {
    ArgumentError.checkNotNull(request, 'request');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request ?? <String, dynamic>{});
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/FilteredStudentInfo',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = PortalFilteredStudentInfo.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  apiGetSyncMyAccount(request) async {
    ArgumentError.checkNotNull(request, 'request');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request ?? <String, dynamic>{});
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/SyncMyAccount',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = PortalSyncMyAccount.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  apiGetPortalNotificationsReadTracking(request) async {
    ArgumentError.checkNotNull(request, 'request');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request ?? <String, dynamic>{});
    final Response<String> _result = await _dio.request(
        '/PortalNotificationsReadTracking',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return Future.value(value);
  }

  @override
  apiGetPortalGlobalSettings(request) async {
    ArgumentError.checkNotNull(request, 'request');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request ?? <String, dynamic>{});
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/PortalGetGlobalSettings',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = PortalGlobalSettingResponse.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  apiGetMziziAppVersion(request) async {
    ArgumentError.checkNotNull(request, 'request');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request ?? <String, dynamic>{});
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/MziziAppVersion',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = MziziAppVersion.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  apiGetPortalContacts(request) async {
    ArgumentError.checkNotNull(request, 'request');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request ?? <String, dynamic>{});
    final Response<List<dynamic>> _result = await _dio.request(
        '/PortalContacts',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => PortalContacts.fromJson(i as Map<String, dynamic>))
        .toList();
    return Future.value(value);
  }

  @override
  apiGetPortalEvents(request) async {
    ArgumentError.checkNotNull(request, 'request');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request ?? <String, dynamic>{});
    final Response<List<dynamic>> _result = await _dio.request('/PortalEvents',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => PortalEvents.fromJson(i as Map<String, dynamic>))
        .toList();
    return Future.value(value);
  }

  @override
  apiGetPortalNotifications(request) async {
    ArgumentError.checkNotNull(request, 'request');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request ?? <String, dynamic>{});
    final Response<List<dynamic>> _result = await _dio.request(
        '/PortalNotifications',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) =>
            PortalNotification.fromJson(i as Map<String, dynamic>))
        .toList();
    return Future.value(value);
  }

  @override
  apiGetPortalSiblings(request) async {
    ArgumentError.checkNotNull(request, 'request');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request ?? <String, dynamic>{});
    final Response<List<dynamic>> _result = await _dio.request(
        '/PortalSiblings',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => PortalSiblings.fromJson(i as Map<String, dynamic>))
        .toList();
    return Future.value(value);
  }

  @override
  apiGetPortalStudentDetailedResults(request) async {
    ArgumentError.checkNotNull(request, 'request');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request ?? <String, dynamic>{});
    final Response<List<dynamic>> _result = await _dio.request(
        '/PortalStudentDetailedResults',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) =>
            PortalStudentDetailedResults.fromJson(i as Map<String, dynamic>))
        .toList();
    return Future.value(value);
  }

  @override
  apiGetPortalStudentInfo(request) async {
    ArgumentError.checkNotNull(request, 'request');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request ?? <String, dynamic>{});
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/PortalStudentInfo',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = PortalStudentInfo.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  apiGetPortalGetProgressReport(request) async {
    ArgumentError.checkNotNull(request, 'request');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request ?? <String, dynamic>{});
    final Response<List<dynamic>> _result = await _dio.request(
        '/PortalGetProgressReport',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) =>
            PortalProgressReport.fromJson(i as Map<String, dynamic>))
        .toList();
    return Future.value(value);
  }

  @override
  apiGetPortalParentsChat(request) async {
    ArgumentError.checkNotNull(request, 'request');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request ?? <String, dynamic>{});
    final Response<List<dynamic>> _result = await _dio.request(
        '/PortalParentChat',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) =>
            ParentChatResponse.fromJson(i as Map<String, dynamic>))
        .toList();
    return Future.value(value);
  }

  @override
  apiGetPortalToDoList(request) async {
    ArgumentError.checkNotNull(request, 'request');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request ?? <String, dynamic>{});
    final Response<List<dynamic>> _result = await _dio.request(
        '/PortalToDoList',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => PortalToDoList.fromJson(i as Map<String, dynamic>))
        .toList();
    return Future.value(value);
  }

  @override
  apiGetPortalDetailedToDoList(request) async {
    ArgumentError.checkNotNull(request, 'request');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request ?? <String, dynamic>{});
    final Response<List<dynamic>> _result = await _dio.request(
        '/PortalDetailedToDoList',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) =>
            PortalDetailedTodoList.fromJson(i as Map<String, dynamic>))
        .toList();
    return Future.value(value);
  }

  @override
  apiGetPortalRecentTransactions(request) async {
    ArgumentError.checkNotNull(request, 'request');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request ?? <String, dynamic>{});
    final Response<List<dynamic>> _result = await _dio.request(
        '/PortalRecentTransactions',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) =>
            PortalRecentTransaction.fromJson(i as Map<String, dynamic>))
        .toList();
    return Future.value(value);
  }

  @override
  apiGetPortalStudentVisualization(request) async {
    ArgumentError.checkNotNull(request, 'request');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request ?? <String, dynamic>{});
    final Response<List<dynamic>> _result = await _dio.request(
        '/PortalStudentVisualization',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) =>
            PortalStudentVisualization.fromJson(i as Map<String, dynamic>))
        .toList();
    return Future.value(value);
  }

  @override
  apiGetPortalStudentVisualizationAverage(request) async {
    ArgumentError.checkNotNull(request, 'request');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request ?? <String, dynamic>{});
    final Response<List<dynamic>> _result = await _dio.request(
        '/PortalStudentVisualizationAverage',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => PortalStudentVisualizationAverage.fromJson(
            i as Map<String, dynamic>))
        .toList();
    return Future.value(value);
  }

  @override
  apiGetPortalStudentResultsExtended(request) async {
    ArgumentError.checkNotNull(request, 'request');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request ?? <String, dynamic>{});
    final Response<List<dynamic>> _result = await _dio.request(
        '/PortalStudentResults',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) =>
            PortalStudentResultsExtended.fromJson(i as Map<String, dynamic>))
        .toList();
    return Future.value(value);
  }

  @override
  apiGetPortalSMSHistory(request) async {
    ArgumentError.checkNotNull(request, 'request');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request ?? <String, dynamic>{});
    final Response<List<dynamic>> _result = await _dio.request(
        '/PortalSMSHistory',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) =>
            PortalNotification.fromJson(i as Map<String, dynamic>))
        .toList();
    return Future.value(value);
  }

  @override
  apiGetPortalChargeTypes(request) async {
    ArgumentError.checkNotNull(request, 'request');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request ?? <String, dynamic>{});
    final Response<List<dynamic>> _result = await _dio.request('/ChargeTypes',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) =>
            PortalChargeTypeResponseModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return Future.value(value);
  }

  @override
  apiGetPortalServiceTypes(request) async {
    ArgumentError.checkNotNull(request, 'request');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request ?? <String, dynamic>{});
    final Response<List<dynamic>> _result = await _dio.request(
        '/PortalServiceTypes',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) =>
            ServiceTypesModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return Future.value(value);
  }

  @override
  apiPostMakeaPledge(request) async {
    ArgumentError.checkNotNull(request, 'request');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request ?? <String, dynamic>{});
    final Response<String> _result = await _dio.request('/Contributions',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return Future.value(value);
  }

  @override
  apiGetPortalChurchServices(request) async {
    ArgumentError.checkNotNull(request, 'request');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request ?? <String, dynamic>{});
    final Response<List<dynamic>> _result = await _dio.request(
        '/PortalChurchServices',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) =>
            PortalChurchServices.fromJson(i as Map<String, dynamic>))
        .toList();
    return Future.value(value);
  }

  @override
  apiGetPortalCompanyLogo(request) async {
    ArgumentError.checkNotNull(request, 'request');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request ?? <String, dynamic>{});
    final Response<String> _result = await _dio.request(
        '/PortalGetCompanyImage',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return Future.value(value);
  }

  @override
  apiGetPortalVideoGallery(request) async {
    ArgumentError.checkNotNull(request, 'request');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request ?? <String, dynamic>{});
    final Response<List<dynamic>> _result = await _dio.request(
        '/PortalYoutubeVideoGallery',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) =>
            PortalVideoGalleryResponseModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return Future.value(value);
  }

  @override
  apiGetPortalMemberProfile(request) async {
    ArgumentError.checkNotNull(request, 'request');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request ?? <String, dynamic>{});
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/PortalStudentProfile',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = PortalMemberProfileModel.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  apiGetPortalEnquiryTypes(request) async {
    ArgumentError.checkNotNull(request, 'request');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request ?? <String, dynamic>{});
    final Response<List<dynamic>> _result = await _dio.request(
        '/PortalEnquiryTypes',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) =>
            PortalEnquiryTypes.fromJson(i as Map<String, dynamic>))
        .toList();
    return Future.value(value);
  }

  @override
  apiGetListOnboarding(request) async {
    ArgumentError.checkNotNull(request, 'request');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request ?? <String, dynamic>{});
    final Response<List<dynamic>> _result = await _dio.request(
        '/PortalListOnboarding',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => PortalListOnboardingResponseModel.fromJson(
            i as Map<String, dynamic>))
        .toList();
    return Future.value(value);
  }

  @override
  apiGetPortalDeviceFCMToken(request) async {
    ArgumentError.checkNotNull(request, 'request');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request ?? <String, dynamic>{});
    final Response<String> _result = await _dio.request('/PortalDeviceFCMToken',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return Future.value(value);
  }

  @override
  apiGetPortalMziziAppVersion(request) async {
    ArgumentError.checkNotNull(request, 'request');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request ?? <String, dynamic>{});
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/MziziAppVersion',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = MziziAppVersion.fromJson(_result.data);
    return Future.value(value);
  }
}
