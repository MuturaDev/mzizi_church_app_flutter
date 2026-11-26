import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'database_dao.dart';

export 'database_dao.dart';

/// Local SQLite cache.
///
/// This replaces the floor-generated database (floor's code generator is no
/// longer compatible with current Dart tooling). The file name, schema version
/// and `CREATE TABLE` statements are identical to what floor generated, so
/// databases created by earlier app versions open unchanged.
class AppDatabase {
  AppDatabase._(this.database);

  static const int schemaVersion = 1;

  static const List<String> _createStatements = [
      'CREATE TABLE IF NOT EXISTS `AuthenticationUserResponse` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `UserID` TEXT, `UserType` TEXT, `SchoolID` TEXT, `OrganizationID` TEXT, `AppCode` TEXT, `Username` TEXT, `Password` TEXT)',
      'CREATE TABLE IF NOT EXISTS `MziziAppVersion` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `ForceUpdate` INTEGER)',
      'CREATE TABLE IF NOT EXISTS `PortalContacts` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `SettingName` TEXT, `SettingValue` TEXT)',
      'CREATE TABLE IF NOT EXISTS `PortalEvents` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `EventsTitle` TEXT, `Venue` TEXT, `StartDate` TEXT, `EndDate` TEXT, `StartTime` TEXT, `EndTime` TEXT, `Description` TEXT)',
      'CREATE TABLE IF NOT EXISTS `PortalDetailedTransaction` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `RefNo` TEXT, `TranAmount` TEXT, `BalAmount` TEXT, `CurrentAmount` TEXT, `TranType` TEXT, `TransType` TEXT, `DatePosted` TEXT)',
      'CREATE TABLE IF NOT EXISTS `PortalFilteredStudentInfo` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `Balance` TEXT, `BillingBalance` TEXT, `PortalAccount` TEXT, `PortalPaybill` TEXT, `OrganizationID` TEXT)',
      'CREATE TABLE IF NOT EXISTS `PortalNotification` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `MsgID` INTEGER, `Msg` TEXT, `DateSent` TEXT)',
      'CREATE TABLE IF NOT EXISTS `PortalProgressReport` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `StudentFullName` TEXT, `YearID` TEXT, `TermName` TEXT, `ExamTypeDesc` TEXT, `CourseName` TEXT, `LevelName` TEXT, `Activity` TEXT, `LearningArea` TEXT, `Remarks` TEXT, `ScoreDescription` TEXT, `ClassTeacherComment` TEXT, `HeadTeacherComment` TEXT)',
      'CREATE TABLE IF NOT EXISTS `PortalSiblings` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `StudentID` TEXT, `RegistrationNumber` TEXT, `StudentFullName` TEXT, `CourseName` TEXT, `StudentStatus` TEXT)',
      'CREATE TABLE IF NOT EXISTS `PortalStudentDetailedResults` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `Subjects` TEXT, `Score` TEXT, `Grade` TEXT, `Remark` TEXT, `TotalMarks` TEXT, `MeanScore` TEXT, `MeanGrade` TEXT, `StreamPosition` TEXT, `OverallPosition` TEXT, `Period` TEXT, `TermName` TEXT, `CurrentYear` TEXT, `CTComments` TEXT, `HMComments` TEXT)',
      'CREATE TABLE IF NOT EXISTS `PortalStudentInfo` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `StudentFullName` TEXT, `RegistrationNumber` TEXT, `Email` TEXT, `StudentPhoneNo` TEXT, `DOB` TEXT, `DateOfAdmission` TEXT, `TwoNames` TEXT, `Balance` TEXT, `MeanGrade` TEXT, `MeanScore` TEXT, `Attendance` TEXT, `Events` TEXT, `PhotoUrl` TEXT, `CopyrightYear` TEXT, `ClassStream` TEXT, `SchoolName` TEXT, `SchoolMotto` TEXT, `BillingBalance` TEXT, `PortalAccount` TEXT, `PortalPaybill` TEXT, `OrganizationID` TEXT)',
      'CREATE TABLE IF NOT EXISTS `PortalSyncMyAccount` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `BillingBalance` TEXT, `OrganizationID` TEXT, `PaybillNo` TEXT, `PortalAccount` TEXT, `Balance` TEXT)',
      'CREATE TABLE IF NOT EXISTS `AppNotificationCount` (`MsgID` INTEGER, PRIMARY KEY (`MsgID`))',
      'CREATE TABLE IF NOT EXISTS `ParentChatResponse` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `Msg` TEXT, `DatePosted` TEXT, `Actor` TEXT, `sent` INTEGER, `notSent` INTEGER, `sending` INTEGER)',
      'CREATE TABLE IF NOT EXISTS `PortalRecentTransaction` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `RefNo` TEXT, `TranType` TEXT, `TranDate` TEXT, `TranAmount` TEXT, `BalAmount` TEXT, `TransType` TEXT)',
      'CREATE TABLE IF NOT EXISTS `PortalStudentVisualization` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `Period` TEXT, `UnitName` TEXT, `AverageScore` TEXT)',
      'CREATE TABLE IF NOT EXISTS `PortalStudentVisualizationAverage` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `Period` TEXT, `AverageScore` TEXT, `MeanGrade` TEXT)',
      'CREATE TABLE IF NOT EXISTS `PortalToDoList` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `DiaryEntryTypeID` TEXT, `DiaryEntryType` TEXT, `DiaryEntriesCount` TEXT)',
      'CREATE TABLE IF NOT EXISTS `PortalDetailedTodoList` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `Name` TEXT, `ToDoAge` TEXT, `DueDate` TEXT, `DocPath` TEXT, `Body` TEXT, `UnitName` TEXT, `TeacherMemoID` TEXT, `IsFeedbackRequired` TEXT, `IsDocPathAvailable` TEXT, `IsVideoLinkAvailable` TEXT, `IsDocPathExtraAvailable` TEXT, `IsAudioLinkAvailable` TEXT, `DocPathExtra` TEXT, `VideoLink` TEXT, `AudioLink` TEXT, `TimeOffSet` TEXT, `PublishDate` TEXT, `StartTime` TEXT, `EndTime` TEXT, `SubmitStatus` TEXT)',
      'CREATE TABLE IF NOT EXISTS `PortalStudentResultsExtended` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `ExamPeriod` TEXT, `AvgScore` TEXT, `MeanGrade` TEXT, `ExamRemarks` TEXT, `DownloadLink` TEXT, `FileURL` TEXT)',
  ];

  final sqflite.Database database;

  final Map<String, StreamController<void>> _changes = {};

  /// Emits whenever [table] is written to through this class.
  Stream<void> changes(String table) => _controller(table).stream;

  StreamController<void> _controller(String table) =>
      _changes.putIfAbsent(table, () => StreamController<void>.broadcast());

  void notifyChanged(String table) => _controller(table).add(null);

  static final Map<String, Future<AppDatabase>> _open = {};

  /// Opens (once per process) and returns the database named [name].
  static Future<AppDatabase> open(String name) =>
      _open.putIfAbsent(name, () async {
        final path = join(await sqflite.getDatabasesPath(), name);
        final db = await sqflite.openDatabase(
          path,
          version: schemaVersion,
          onConfigure: (db) => db.execute('PRAGMA foreign_keys = ON'),
          onCreate: (db, version) async {
            for (final sql in _createStatements) {
              await db.execute(sql);
            }
          },
        );
        return AppDatabase._(db);
      });

  AuthenticationUserResponseDBDao get getAuthenticationUserResponseDBDao =>
      AuthenticationUserResponseDBDao(this);
  MziziAppVersionDBDao get getMziziAppVersionDBDao => MziziAppVersionDBDao(this);
  PortalContactsDBDao get getPortalContactsDBDao => PortalContactsDBDao(this);
  PortalDetailedTransactionDBDao get getPortalDetailedTransactionDBDao =>
      PortalDetailedTransactionDBDao(this);
  PortalFilteredStudentInfoDBDao get getPortalFilteredStudentInfoDBDao =>
      PortalFilteredStudentInfoDBDao(this);
  PortalNotificationDBDao get getPortalNotificationDBDao =>
      PortalNotificationDBDao(this);
  PortalProgressReportDBDao get getPortalProgressReportDBDao =>
      PortalProgressReportDBDao(this);
  PortalSiblingsDBDao get getPortalSiblingsDBDao => PortalSiblingsDBDao(this);
  PortalStudentDetailedResultsDBDao
      get getPortalPortalStudentDetailedResultsDBDao =>
          PortalStudentDetailedResultsDBDao(this);
  PortalStudentInfoDBDao get getPortalStudentInfoDBDao =>
      PortalStudentInfoDBDao(this);
  PortalSyncMyAccountDBDao get getPortalSyncMyAccountDBDao =>
      PortalSyncMyAccountDBDao(this);
  PortalEventsDBDao get getPortalEventsDBDao => PortalEventsDBDao(this);
  AppNotificationCountDBDao get getAppNotificationCountDBDao =>
      AppNotificationCountDBDao(this);
  ParentChatResponseDBDao get getParentChatResponseDBDao =>
      ParentChatResponseDBDao(this);
  PortalRecentTransactionsDBDao get getPortalRecentTransactionsDBDao =>
      PortalRecentTransactionsDBDao(this);
  PortalTodoListDBDao get getPortalTodoListDBDao => PortalTodoListDBDao(this);
  PortalDetailedTodoListDBDao get getPortalDetailedTodoListDBDao =>
      PortalDetailedTodoListDBDao(this);
  PortalStudentVisualizationDBDao get getPortalStudentVisualizationDBDao =>
      PortalStudentVisualizationDBDao(this);
  PortalStudentVisualizationAverageDBDao
      get getPortalStudentVisualizationAverageDBDao =>
          PortalStudentVisualizationAverageDBDao(this);
  PortalStudentResultsExtendedDBDao get getPortalStudentResultsExtendedDBDao =>
      PortalStudentResultsExtendedDBDao(this);
}

/// Kept so existing call sites (`$FloorAppDatabase.databaseBuilder(name).build()`)
/// work unchanged. [build] returns a shared, already-open instance.
class $FloorAppDatabase {
  static AppDatabaseBuilder databaseBuilder(String name) =>
      AppDatabaseBuilder._(name);
}

class AppDatabaseBuilder {
  AppDatabaseBuilder._(this.name);
  final String name;
  Future<AppDatabase> build() => AppDatabase.open(name);
}
