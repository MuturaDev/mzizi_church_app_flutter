import 'package:sqflite/sqflite.dart';

import 'package:mzizichurchsystem/mzizi_church_system/models/model_classes/app_notification_count.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/mzizi_app_version_response_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_authentication_response_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_contacts_response_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_detailed_todo_list_response.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_events_response_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_fee_transaction_response_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_filtered_student_info_response_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_notification_response_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_parent_chat_response_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_progress_report_response_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_recent_transaction_response.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_siblings_response_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_student_detailed_results_response_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_student_info_response_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_student_results_extended_response.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_student_visualization_average_response.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_student_visualization_response.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_sync_myaccount_response_model.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_to_do_list_response.dart';
import 'app_database.dart';

/// Shared row <-> model mapping for the cache tables. Column names are the
/// model's JSON keys (as they were under floor); booleans are stored as 0/1.
class EntityDao<T> {
  EntityDao(this.db, this.table, this.fromJson, this.toJson,
      {this.boolColumns = const {}});

  final AppDatabase db;
  final String table;
  final T Function(Map<String, dynamic>) fromJson;
  final Map<String, dynamic> Function(T) toJson;
  final Set<String> boolColumns;

  T _fromRow(Map<String, Object?> row) {
    final map = Map<String, dynamic>.of(row);
    for (final c in boolColumns) {
      if (map[c] is int) map[c] = map[c] != 0;
    }
    return fromJson(map);
  }

  Map<String, Object?> _toRow(T item) {
    final map = Map<String, Object?>.of(toJson(item));
    if (map['id'] == null) map.remove('id');
    for (final c in boolColumns) {
      final v = map[c];
      if (v is bool) map[c] = v ? 1 : 0;
    }
    return map;
  }

  Future<List<T>> query(String sql, [List<Object?>? args]) async =>
      (await db.database.rawQuery(sql, args)).map(_fromRow).toList();

  Stream<List<T>> watch(String sql, [List<Object?>? args]) async* {
    yield await query(sql, args);
    await for (final _ in db.changes(table)) {
      yield await query(sql, args);
    }
  }

  Future<List<int>> insertAll(List<T> items) async {
    final ids = await db.database.transaction((txn) async {
      final out = <int>[];
      for (final item in items) {
        out.add(await txn.insert(table, _toRow(item),
            conflictAlgorithm: ConflictAlgorithm.abort));
      }
      return out;
    });
    db.notifyChanged(table);
    return ids;
  }

  Future<int> updateAll(List<T> items) async {
    var count = 0;
    await db.database.transaction((txn) async {
      for (final item in items) {
        final row = _toRow(item);
        count += await txn.update(table, row,
            where: 'id = ?',
            whereArgs: [row['id']],
            conflictAlgorithm: ConflictAlgorithm.abort);
      }
    });
    db.notifyChanged(table);
    return count;
  }

  /// Deletes rows by primary key, like floor's `@delete`.
  Future<int> deleteAll(List<T> items) async {
    var count = 0;
    await db.database.transaction((txn) async {
      for (final item in items) {
        count += await txn
            .delete(table, where: 'id = ?', whereArgs: [_toRow(item)['id']]);
      }
    });
    db.notifyChanged(table);
    return count;
  }

  Future<void> execute(String sql, [List<Object?>? args]) async {
    await db.database.rawDelete(sql, args);
    db.notifyChanged(table);
  }
}

class AuthenticationUserResponseDBDao {
  AuthenticationUserResponseDBDao(AppDatabase db)
      : _e = EntityDao<AuthenticationUserResponse>(db, 'AuthenticationUserResponse', AuthenticationUserResponse.fromJson, (e) => e.toJson());

  final EntityDao<AuthenticationUserResponse> _e;

  Future<List<AuthenticationUserResponse>> getAuthenticationUserResponse() =>
      _e.query('SELECT * FROM AuthenticationUserResponse');

  Future<List<int>> insertAuthenticationUserResponse(List<AuthenticationUserResponse> response) => _e.insertAll(response);

  Future<int> updateAuthenticationUserResponse(List<AuthenticationUserResponse> response) => _e.updateAll(response);

  Future<int> deleteAuthenticationUserResponse(List<AuthenticationUserResponse> deleteResponses) => _e.deleteAll(deleteResponses);

  Future<void> deleteAllAuthenticationUserResponse() =>
      _e.execute('DELETE FROM AuthenticationUserResponse');
}

class MziziAppVersionDBDao {
  MziziAppVersionDBDao(AppDatabase db)
      : _e = EntityDao<MziziAppVersion>(db, 'MziziAppVersion', MziziAppVersion.fromJson, (e) => e.toJson(),
            boolColumns: {'ForceUpdate'});

  final EntityDao<MziziAppVersion> _e;

  Future<List<MziziAppVersion>> getMziziAppVersionResponse() =>
      _e.query('SELECT * FROM MziziAppVersion');

  Future<List<int>> insertMziziAppVersionResponse(List<MziziAppVersion> response) => _e.insertAll(response);

  Future<int> deleteMziziAppVersionResponse(List<MziziAppVersion> response) => _e.deleteAll(response);

  Future<void> deleteAllMziziAppVersion() =>
      _e.execute('DELETE FROM MziziAppVersion');
}

class PortalContactsDBDao {
  PortalContactsDBDao(AppDatabase db)
      : _e = EntityDao<PortalContacts>(db, 'PortalContacts', PortalContacts.fromJson, (e) => e.toJson());

  final EntityDao<PortalContacts> _e;

  Future<List<PortalContacts>> getPortalContactsResponse() =>
      _e.query('SELECT * FROM PortalContacts');

  Future<List<int>> insertPortalContactsResponse(List<PortalContacts> response) => _e.insertAll(response);

  Future<int> deletePortalContactsResponse(List<PortalContacts> response) => _e.deleteAll(response);

  Future<void> deleteAllPortalContacts() =>
      _e.execute('DELETE FROM PortalContacts');
}

class PortalDetailedTransactionDBDao {
  PortalDetailedTransactionDBDao(AppDatabase db)
      : _e = EntityDao<PortalDetailedTransaction>(db, 'PortalDetailedTransaction', PortalDetailedTransaction.fromJson, (e) => e.toJson());

  final EntityDao<PortalDetailedTransaction> _e;

  Future<List<PortalDetailedTransaction>> getPortalDetailedTransaction() =>
      _e.query('SELECT * FROM PortalDetailedTransaction');

  Future<List<int>> insertPortalDetailedTransactionResponse(List<PortalDetailedTransaction> response) => _e.insertAll(response);

  Future<int> deletePortalDetailedTransactionResponse(List<PortalDetailedTransaction> response) => _e.deleteAll(response);

  Future<void> deleteAllPortalDetailedTransaction() =>
      _e.execute('DELETE FROM PortalDetailedTransaction');
}

class PortalFilteredStudentInfoDBDao {
  PortalFilteredStudentInfoDBDao(AppDatabase db)
      : _e = EntityDao<PortalFilteredStudentInfo>(db, 'PortalFilteredStudentInfo', PortalFilteredStudentInfo.fromJson, (e) => e.toJson());

  final EntityDao<PortalFilteredStudentInfo> _e;

  Future<List<PortalFilteredStudentInfo>> getPortalFilteredStudentInfoResponse() =>
      _e.query('SELECT * FROM PortalFilteredStudentInfo');

  Future<List<int>> insertPortalFilteredStudentInfoResponse(List<PortalFilteredStudentInfo> response) => _e.insertAll(response);

  Future<int> deletePortalFilteredStudentInfoResponse(List<PortalFilteredStudentInfo> response) => _e.deleteAll(response);

  Future<void> deleteAllPortalFilteredStudentInfo() =>
      _e.execute('DELETE FROM PortalFilteredStudentInfo');
}

class PortalNotificationDBDao {
  PortalNotificationDBDao(AppDatabase db)
      : _e = EntityDao<PortalNotification>(db, 'PortalNotification', PortalNotification.fromJson, (e) => e.toJson());

  final EntityDao<PortalNotification> _e;

  Future<List<PortalNotification>> getPortalNotificationResponse() =>
      _e.query('SELECT * FROM PortalNotification');

  Future<List<PortalNotification>> getLastNotificationResponse() =>
      _e.query('SELECT * FROM PortalNotification ORDER BY id DESC LIMIT 1');

  Future<List<int>> insertPortalNotificationResponse(List<PortalNotification> response) => _e.insertAll(response);

  Future<int> deletePortalNotificationResponse(List<PortalNotification> response) => _e.deleteAll(response);

  Future<void> deleteAllPortalNotification() =>
      _e.execute('DELETE FROM PortalNotification');
}

class PortalProgressReportDBDao {
  PortalProgressReportDBDao(AppDatabase db)
      : _e = EntityDao<PortalProgressReport>(db, 'PortalProgressReport', PortalProgressReport.fromJson, (e) => e.toJson());

  final EntityDao<PortalProgressReport> _e;

  Future<List<PortalProgressReport>> getPortalProgressReportResponse() =>
      _e.query('SELECT * FROM PortalProgressReport');

  Future<List<PortalProgressReport>> getActivitiesSelectedYearTermExamType(String examType, String yearFor, String termName) =>
      _e.query('SELECT DISTINCT Activity, CourseName, LevelName FROM PortalProgressReport WHERE ExamTypeDesc = ? AND YearID = ? AND TermName = ?', [examType, yearFor, termName]);

  Future<List<PortalProgressReport>> getPortalProgressReportSelectedYearTermExamType(String activity, String examType, String yearFor, String termName) =>
      _e.query('SELECT DISTINCT LearningArea, ScoreDescription, Remarks FROM PortalProgressReport WHERE  Activity = ? AND ExamTypeDesc = ? AND YearID = ? AND TermName = ?', [activity, examType, yearFor, termName]);

  Future<List<PortalProgressReport>> getHeadTeacherComment(String examType, String termName, String yearFor) =>
      _e.query('SELECT DISTINCT HeadTeacherComment FROM PortalProgressReport WHERE ExamTypeDesc = ? AND YearID = ? AND TermName = ?', [examType, yearFor, termName]);

  Future<List<PortalProgressReport>> getGradeFacilitatorComment(String examType, String termName, String yearFor) =>
      _e.query('SELECT DISTINCT ClassTeacherComment FROM PortalProgressReport WHERE ExamTypeDesc = ? AND YearID = ? AND TermName = ?', [examType, yearFor, termName]);

  Future<List<PortalProgressReport>> getDistictYears() =>
      _e.query('SELECT DISTINCT YearID FROM PortalProgressReport');

  Future<List<PortalProgressReport>> getDistictTerms() =>
      _e.query('SELECT DISTINCT TermName FROM PortalProgressReport');

  Future<List<PortalProgressReport>> getDistictExamType() =>
      _e.query('SELECT DISTINCT ExamTypeDesc  FROM PortalProgressReport');

  Future<List<int>> insertPortalProgressReportResponse(List<PortalProgressReport> response) => _e.insertAll(response);

  Future<int> deletePortalProgressReportResponse(List<PortalProgressReport> response) => _e.deleteAll(response);

  Future<void> deleteAllPortalProgressReportResponse() =>
      _e.execute('DELETE FROM PortalProgressReport');
}

class PortalSiblingsDBDao {
  PortalSiblingsDBDao(AppDatabase db)
      : _e = EntityDao<PortalSiblings>(db, 'PortalSiblings', PortalSiblings.fromJson, (e) => e.toJson());

  final EntityDao<PortalSiblings> _e;

  Future<List<PortalSiblings>> getPortalSiblingsoResponse() =>
      _e.query('SELECT DISTINCT StudentID,RegistrationNumber, StudentFullName,CourseName,StudentStatus FROM PortalSiblings');

  Future<List<int>> insertPortalSiblingsResponse(List<PortalSiblings> response) => _e.insertAll(response);

  Future<void> deleteAllPortalPortalSiblings() =>
      _e.execute('DELETE FROM PortalSiblings');

  Future<int> deletePortalSiblingsResponse(List<PortalSiblings> response) => _e.deleteAll(response);
}

class PortalStudentDetailedResultsDBDao {
  PortalStudentDetailedResultsDBDao(AppDatabase db)
      : _e = EntityDao<PortalStudentDetailedResults>(db, 'PortalStudentDetailedResults', PortalStudentDetailedResults.fromJson, (e) => e.toJson());

  final EntityDao<PortalStudentDetailedResults> _e;

  Future<List<PortalStudentDetailedResults>> getPortalStudentDetailedResultsResponse() =>
      _e.query('SELECT * FROM PortalStudentDetailedResults');

  Future<List<PortalStudentDetailedResults>> getDistinctYears() =>
      _e.query('SELECT DISTINCT CurrentYear FROM PortalStudentDetailedResults');

  Future<List<int>> insertPortalStudentDetailedResultsResponse(List<PortalStudentDetailedResults> response) => _e.insertAll(response);

  Future<int> deletePortalStudentDetailedResultsResponse(List<PortalStudentDetailedResults> response) => _e.deleteAll(response);

  Future<void> deleteAllPortalStudentDetailedResults() =>
      _e.execute('DELETE FROM PortalStudentDetailedResults');
}

class PortalStudentInfoDBDao {
  PortalStudentInfoDBDao(AppDatabase db)
      : _e = EntityDao<PortalStudentInfo>(db, 'PortalStudentInfo', PortalStudentInfo.fromJson, (e) => e.toJson());

  final EntityDao<PortalStudentInfo> _e;

  Future<List<PortalStudentInfo>> getPortalStudentInfoResponse() =>
      _e.query('SELECT * FROM PortalStudentInfo');

  Future<List<int>> insertPortalStudentInfoResponse(List<PortalStudentInfo> response) => _e.insertAll(response);

  Future<int> deletePortalStudentInfoResponse(List<PortalStudentInfo> response) => _e.deleteAll(response);

  Future<void> deleteAllPortalStudentInfo() =>
      _e.execute('DELETE FROM PortalStudentInfo');
}

class PortalSyncMyAccountDBDao {
  PortalSyncMyAccountDBDao(AppDatabase db)
      : _e = EntityDao<PortalSyncMyAccount>(db, 'PortalSyncMyAccount', PortalSyncMyAccount.fromJson, (e) => e.toJson());

  final EntityDao<PortalSyncMyAccount> _e;

  Future<List<PortalSyncMyAccount>> getPortalSyncMyAccountResponse() =>
      _e.query('SELECT * FROM PortalSyncMyAccount');

  Future<List<int>> insertPortalSyncMyAccountResponse(List<PortalSyncMyAccount> response) => _e.insertAll(response);

  Future<void> deleteAllPortalSyncMyAccount() =>
      _e.execute('DELETE FROM PortalSyncMyAccount');
}

class PortalEventsDBDao {
  PortalEventsDBDao(AppDatabase db)
      : _e = EntityDao<PortalEvents>(db, 'PortalEvents', PortalEvents.fromJson, (e) => e.toJson());

  final EntityDao<PortalEvents> _e;

  Future<List<PortalEvents>> getPortalEventsResponse() =>
      _e.query('SELECT * FROM PortalEvents');

  Future<List<int>> insertPortalEventsResponse(List<PortalEvents> response) => _e.insertAll(response);

  Future<int> deletePortalEventsResponse(List<PortalEvents> response) => _e.deleteAll(response);

  Future<void> deleteAllPortalEvents() =>
      _e.execute('DELETE FROM PortalEvents');
}

class AppNotificationCountDBDao {
  AppNotificationCountDBDao(AppDatabase db)
      : _e = EntityDao<AppNotificationCount>(db, 'AppNotificationCount', AppNotificationCount.fromJson, (e) => e.toJson());

  final EntityDao<AppNotificationCount> _e;

  Future<List<AppNotificationCount>> getAppNotificationCountResponse() =>
      _e.query('SELECT * FROM AppNotificationCount');

  Future<List<int>> insertAppNotificationCountResponse(List<AppNotificationCount> response) => _e.insertAll(response);

  Future<int> deleteAppNotificationCountResponse(List<AppNotificationCount> response) => _e.deleteAll(response);

  Future<void> deleteAllAppNotificationCount() =>
      _e.execute('DELETE FROM AppNotificationCount');
}

class ParentChatResponseDBDao {
  ParentChatResponseDBDao(AppDatabase db)
      : _e = EntityDao<ParentChatResponse>(db, 'ParentChatResponse', ParentChatResponse.fromJson, (e) => e.toJson(),
            boolColumns: {'sent', 'notSent', 'sending'});

  final EntityDao<ParentChatResponse> _e;

  Future<List<ParentChatResponse>> getParentChatResponse() =>
      _e.query('SELECT DISTINCT Msg, DatePosted, Actor, sent,notSent, sending FROM ParentChatResponse');

  Stream<List<ParentChatResponse>> getParentChatResponseStream() =>
      _e.watch('SELECT DISTINCT Msg, DatePosted, Actor, sent,notSent, sending FROM ParentChatResponse');

  Future<List<int>> insertParentChatResponse(List<ParentChatResponse> response) => _e.insertAll(response);

  Future<void> deleteOneParentChatResponse(String message) =>
      _e.execute('DELETE FROM ParentChatResponse WHERE Msg = ?', [message]);

  Future<void> deleteParentChatResponse() =>
      _e.execute('DELETE FROM ParentChatResponse');
}

class PortalRecentTransactionsDBDao {
  PortalRecentTransactionsDBDao(AppDatabase db)
      : _e = EntityDao<PortalRecentTransaction>(db, 'PortalRecentTransaction', PortalRecentTransaction.fromJson, (e) => e.toJson());

  final EntityDao<PortalRecentTransaction> _e;

  Future<List<PortalRecentTransaction>> getPortalRecentTransactions() =>
      _e.query('SELECT * FROM PortalRecentTransaction');

  Future<List<int>> insertPortalRecentTransactions(List<PortalRecentTransaction> response) => _e.insertAll(response);

  Future<void> deletePortalRecentTransactions() =>
      _e.execute('DELETE FROM PortalRecentTransaction');
}

class PortalTodoListDBDao {
  PortalTodoListDBDao(AppDatabase db)
      : _e = EntityDao<PortalToDoList>(db, 'PortalToDoList', PortalToDoList.fromJson, (e) => e.toJson());

  final EntityDao<PortalToDoList> _e;

  Future<List<PortalToDoList>> getPortalTodoLists() =>
      _e.query('SELECT * FROM PortalToDoList');

  Future<List<int>> insertPortalTodoLists(List<PortalToDoList> response) => _e.insertAll(response);

  Future<void> deletePortalToDoLists() =>
      _e.execute('DELETE FROM PortalToDoList');
}

class PortalDetailedTodoListDBDao {
  PortalDetailedTodoListDBDao(AppDatabase db)
      : _e = EntityDao<PortalDetailedTodoList>(db, 'PortalDetailedTodoList', PortalDetailedTodoList.fromJson, (e) => e.toJson());

  final EntityDao<PortalDetailedTodoList> _e;

  Future<List<PortalDetailedTodoList>> getPortalDetailedTodoList() =>
      _e.query('SELECT * FROM PortalDetailedTodoList');

  Future<List<int>> insertPortalDetailedTodoLists(List<PortalDetailedTodoList> response) => _e.insertAll(response);

  Future<void> deletePortalDetailedTodoList() =>
      _e.execute('DELETE FROM PortalDetailedTodoList');
}

class PortalStudentVisualizationDBDao {
  PortalStudentVisualizationDBDao(AppDatabase db)
      : _e = EntityDao<PortalStudentVisualization>(db, 'PortalStudentVisualization', PortalStudentVisualization.fromJson, (e) => e.toJson());

  final EntityDao<PortalStudentVisualization> _e;

  Future<List<PortalStudentVisualization>> getPortalStudentVisualization() =>
      _e.query('SELECT * FROM PortalStudentVisualization');

  Future<List<int>> insertPortalStudentVisualization(List<PortalStudentVisualization> response) => _e.insertAll(response);

  Future<void> deletePortalStudentVisualization() =>
      _e.execute('DELETE FROM PortalStudentVisualization');
}

class PortalStudentVisualizationAverageDBDao {
  PortalStudentVisualizationAverageDBDao(AppDatabase db)
      : _e = EntityDao<PortalStudentVisualizationAverage>(db, 'PortalStudentVisualizationAverage', PortalStudentVisualizationAverage.fromJson, (e) => e.toJson());

  final EntityDao<PortalStudentVisualizationAverage> _e;

  Future<List<PortalStudentVisualizationAverage>> getPortalStudentVisualizationAverage() =>
      _e.query('SELECT * FROM PortalStudentVisualizationAverage');

  Future<List<int>> insertPortalStudentVisualizationAverage(List<PortalStudentVisualizationAverage> response) => _e.insertAll(response);

  Future<void> deletePortalStudentVisualizationAverage() =>
      _e.execute('DELETE FROM PortalStudentVisualizationAverage');
}

class PortalStudentResultsExtendedDBDao {
  PortalStudentResultsExtendedDBDao(AppDatabase db)
      : _e = EntityDao<PortalStudentResultsExtended>(db, 'PortalStudentResultsExtended', PortalStudentResultsExtended.fromJson, (e) => e.toJson());

  final EntityDao<PortalStudentResultsExtended> _e;

  Future<List<PortalStudentResultsExtended>> getPortalStudentResultsExtended() =>
      _e.query('SELECT * FROM PortalStudentResultsExtended');

  Future<List<int>> insertPortalStudentResultsExtended(List<PortalStudentResultsExtended> response) => _e.insertAll(response);

  Future<void> deletePortalStudentResultsExtended() =>
      _e.execute('DELETE FROM PortalStudentResultsExtended');
}
