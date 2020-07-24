// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String name;

  final List<Migration> _migrations = [];

  Callback _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final database = _$AppDatabase();
    database.database = await database.open(
      name ?? ':memory:',
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String> listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  AppNotificationCountDBDao _getAppNotificationCountDBDaoInstance;

  ParentChatResponseDBDao _getParentChatResponseDBDaoInstance;

  PortalRecentTransactionsDBDao _getPortalRecentTransactionsDBDaoInstance;

  PortalTodoListDBDao _getPortalTodoListDBDaoInstance;

  PortalDetailedTodoListDBDao _getPortalDetailedTodoListDBDaoInstance;

  PortalStudentVisualizationDBDao _getPortalStudentVisualizationDBDaoInstance;

  PortalStudentVisualizationAverageDBDao
      _getPortalStudentVisualizationAverageDBDaoInstance;

  PortalStudentResultsExtendedDBDao
      _getPortalStudentResultsExtendedDBDaoInstance;

  AuthenticationUserResponseDBDao _getAuthenticationUserResponseDBDaoInstance;

  MziziAppVersionDBDao _getMziziAppVersionDBDaoInstance;

  PortalContactsDBDao _getPortalContactsDBDaoInstance;

  PortalDetailedTransactionDBDao _getPortalDetailedTransactionDBDaoInstance;

  PortalFilteredStudentInfoDBDao _getPortalFilteredStudentInfoDBDaoInstance;

  PortalNotificationDBDao _getPortalNotificationDBDaoInstance;

  PortalProgressReportDBDao _getPortalProgressReportDBDaoInstance;

  PortalSiblingsDBDao _getPortalSiblingsDBDaoInstance;

  PortalStudentDetailedResultsDBDao
      _getPortalPortalStudentDetailedResultsDBDaoInstance;

  PortalStudentInfoDBDao _getPortalStudentInfoDBDaoInstance;

  PortalSyncMyAccountDBDao _getPortalSyncMyAccountDBDaoInstance;

  PortalEventsDBDao _getPortalEventsDBDaoInstance;

  Future<sqflite.Database> open(String name, List<Migration> migrations,
      [Callback callback]) async {
    final path = join(await sqflite.getDatabasesPath(), name);

    return sqflite.openDatabase(
      path,
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `AuthenticationUserResponse` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `UserID` TEXT, `UserType` TEXT, `SchoolID` TEXT, `OrganizationID` TEXT, `AppCode` TEXT, `Username` TEXT, `Password` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `MziziAppVersion` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `ForceUpdate` INTEGER)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `PortalContacts` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `SettingName` TEXT, `SettingValue` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `PortalEvents` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `EventsTitle` TEXT, `Venue` TEXT, `StartDate` TEXT, `EndDate` TEXT, `StartTime` TEXT, `EndTime` TEXT, `Description` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `PortalDetailedTransaction` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `RefNo` TEXT, `TranAmount` TEXT, `BalAmount` TEXT, `CurrentAmount` TEXT, `TranType` TEXT, `TransType` TEXT, `DatePosted` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `PortalFilteredStudentInfo` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `Balance` TEXT, `BillingBalance` TEXT, `PortalAccount` TEXT, `PortalPaybill` TEXT, `OrganizationID` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `PortalNotification` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `MsgID` INTEGER, `Msg` TEXT, `DateSent` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `PortalProgressReport` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `StudentFullName` TEXT, `YearID` TEXT, `TermName` TEXT, `ExamTypeDesc` TEXT, `CourseName` TEXT, `LevelName` TEXT, `Activity` TEXT, `LearningArea` TEXT, `Remarks` TEXT, `ScoreDescription` TEXT, `ClassTeacherComment` TEXT, `HeadTeacherComment` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `PortalSiblings` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `StudentID` TEXT, `RegistrationNumber` TEXT, `StudentFullName` TEXT, `CourseName` TEXT, `StudentStatus` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `PortalStudentDetailedResults` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `Subjects` TEXT, `Score` TEXT, `Grade` TEXT, `Remark` TEXT, `TotalMarks` TEXT, `MeanScore` TEXT, `MeanGrade` TEXT, `StreamPosition` TEXT, `OverallPosition` TEXT, `Period` TEXT, `TermName` TEXT, `CurrentYear` TEXT, `CTComments` TEXT, `HMComments` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `PortalStudentInfo` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `StudentFullName` TEXT, `RegistrationNumber` TEXT, `Email` TEXT, `StudentPhoneNo` TEXT, `DOB` TEXT, `DateOfAdmission` TEXT, `TwoNames` TEXT, `Balance` TEXT, `MeanGrade` TEXT, `MeanScore` TEXT, `Attendance` TEXT, `Events` TEXT, `PhotoUrl` TEXT, `CopyrightYear` TEXT, `ClassStream` TEXT, `SchoolName` TEXT, `SchoolMotto` TEXT, `BillingBalance` TEXT, `PortalAccount` TEXT, `PortalPaybill` TEXT, `OrganizationID` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `PortalSyncMyAccount` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `BillingBalance` TEXT, `OrganizationID` TEXT, `PaybillNo` TEXT, `PortalAccount` TEXT, `Balance` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `AppNotificationCount` (`MsgID` INTEGER, PRIMARY KEY (`MsgID`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `ParentChatResponse` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `Msg` TEXT, `DatePosted` TEXT, `Actor` TEXT, `sent` INTEGER, `notSent` INTEGER, `sending` INTEGER)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `PortalRecentTransaction` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `RefNo` TEXT, `TranType` TEXT, `TranDate` TEXT, `TranAmount` TEXT, `BalAmount` TEXT, `TransType` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `PortalStudentVisualization` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `Period` TEXT, `UnitName` TEXT, `AverageScore` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `PortalStudentVisualizationAverage` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `Period` TEXT, `AverageScore` TEXT, `MeanGrade` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `PortalToDoList` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `DiaryEntryTypeID` TEXT, `DiaryEntryType` TEXT, `DiaryEntriesCount` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `PortalDetailedTodoList` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `Name` TEXT, `ToDoAge` TEXT, `DueDate` TEXT, `DocPath` TEXT, `Body` TEXT, `UnitName` TEXT, `TeacherMemoID` TEXT, `IsFeedbackRequired` TEXT, `IsDocPathAvailable` TEXT, `IsVideoLinkAvailable` TEXT, `IsDocPathExtraAvailable` TEXT, `IsAudioLinkAvailable` TEXT, `DocPathExtra` TEXT, `VideoLink` TEXT, `AudioLink` TEXT, `TimeOffSet` TEXT, `PublishDate` TEXT, `StartTime` TEXT, `EndTime` TEXT, `SubmitStatus` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `PortalStudentResultsExtended` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `ExamPeriod` TEXT, `AvgScore` TEXT, `MeanGrade` TEXT, `ExamRemarks` TEXT, `DownloadLink` TEXT, `FileURL` TEXT)');

        await callback?.onCreate?.call(database, version);
      },
    );
  }

  @override
  AppNotificationCountDBDao get getAppNotificationCountDBDao {
    return _getAppNotificationCountDBDaoInstance ??=
        _$AppNotificationCountDBDao(database, changeListener);
  }

  @override
  ParentChatResponseDBDao get getParentChatResponseDBDao {
    return _getParentChatResponseDBDaoInstance ??=
        _$ParentChatResponseDBDao(database, changeListener);
  }

  @override
  PortalRecentTransactionsDBDao get getPortalRecentTransactionsDBDao {
    return _getPortalRecentTransactionsDBDaoInstance ??=
        _$PortalRecentTransactionsDBDao(database, changeListener);
  }

  @override
  PortalTodoListDBDao get getPortalTodoListDBDao {
    return _getPortalTodoListDBDaoInstance ??=
        _$PortalTodoListDBDao(database, changeListener);
  }

  @override
  PortalDetailedTodoListDBDao get getPortalDetailedTodoListDBDao {
    return _getPortalDetailedTodoListDBDaoInstance ??=
        _$PortalDetailedTodoListDBDao(database, changeListener);
  }

  @override
  PortalStudentVisualizationDBDao get getPortalStudentVisualizationDBDao {
    return _getPortalStudentVisualizationDBDaoInstance ??=
        _$PortalStudentVisualizationDBDao(database, changeListener);
  }

  @override
  PortalStudentVisualizationAverageDBDao
      get getPortalStudentVisualizationAverageDBDao {
    return _getPortalStudentVisualizationAverageDBDaoInstance ??=
        _$PortalStudentVisualizationAverageDBDao(database, changeListener);
  }

  @override
  PortalStudentResultsExtendedDBDao get getPortalStudentResultsExtendedDBDao {
    return _getPortalStudentResultsExtendedDBDaoInstance ??=
        _$PortalStudentResultsExtendedDBDao(database, changeListener);
  }

  @override
  AuthenticationUserResponseDBDao get getAuthenticationUserResponseDBDao {
    return _getAuthenticationUserResponseDBDaoInstance ??=
        _$AuthenticationUserResponseDBDao(database, changeListener);
  }

  @override
  MziziAppVersionDBDao get getMziziAppVersionDBDao {
    return _getMziziAppVersionDBDaoInstance ??=
        _$MziziAppVersionDBDao(database, changeListener);
  }

  @override
  PortalContactsDBDao get getPortalContactsDBDao {
    return _getPortalContactsDBDaoInstance ??=
        _$PortalContactsDBDao(database, changeListener);
  }

  @override
  PortalDetailedTransactionDBDao get getPortalDetailedTransactionDBDao {
    return _getPortalDetailedTransactionDBDaoInstance ??=
        _$PortalDetailedTransactionDBDao(database, changeListener);
  }

  @override
  PortalFilteredStudentInfoDBDao get getPortalFilteredStudentInfoDBDao {
    return _getPortalFilteredStudentInfoDBDaoInstance ??=
        _$PortalFilteredStudentInfoDBDao(database, changeListener);
  }

  @override
  PortalNotificationDBDao get getPortalNotificationDBDao {
    return _getPortalNotificationDBDaoInstance ??=
        _$PortalNotificationDBDao(database, changeListener);
  }

  @override
  PortalProgressReportDBDao get getPortalProgressReportDBDao {
    return _getPortalProgressReportDBDaoInstance ??=
        _$PortalProgressReportDBDao(database, changeListener);
  }

  @override
  PortalSiblingsDBDao get getPortalSiblingsDBDao {
    return _getPortalSiblingsDBDaoInstance ??=
        _$PortalSiblingsDBDao(database, changeListener);
  }

  @override
  PortalStudentDetailedResultsDBDao
      get getPortalPortalStudentDetailedResultsDBDao {
    return _getPortalPortalStudentDetailedResultsDBDaoInstance ??=
        _$PortalStudentDetailedResultsDBDao(database, changeListener);
  }

  @override
  PortalStudentInfoDBDao get getPortalStudentInfoDBDao {
    return _getPortalStudentInfoDBDaoInstance ??=
        _$PortalStudentInfoDBDao(database, changeListener);
  }

  @override
  PortalSyncMyAccountDBDao get getPortalSyncMyAccountDBDao {
    return _getPortalSyncMyAccountDBDaoInstance ??=
        _$PortalSyncMyAccountDBDao(database, changeListener);
  }

  @override
  PortalEventsDBDao get getPortalEventsDBDao {
    return _getPortalEventsDBDaoInstance ??=
        _$PortalEventsDBDao(database, changeListener);
  }
}

class _$AppNotificationCountDBDao extends AppNotificationCountDBDao {
  _$AppNotificationCountDBDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _appNotificationCountInsertionAdapter = InsertionAdapter(
            database,
            'AppNotificationCount',
            (AppNotificationCount item) =>
                <String, dynamic>{'MsgID': item.MsgID}),
        _appNotificationCountDeletionAdapter = DeletionAdapter(
            database,
            'AppNotificationCount',
            ['MsgID'],
            (AppNotificationCount item) =>
                <String, dynamic>{'MsgID': item.MsgID});

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _appNotificationCountMapper =
      (Map<String, dynamic> row) => AppNotificationCount(row['MsgID'] as int);

  final InsertionAdapter<AppNotificationCount>
      _appNotificationCountInsertionAdapter;

  final DeletionAdapter<AppNotificationCount>
      _appNotificationCountDeletionAdapter;

  @override
  Future<List<AppNotificationCount>> getAppNotificationCountResponse() async {
    return _queryAdapter.queryList('SELECT * FROM AppNotificationCount',
        mapper: _appNotificationCountMapper);
  }

  @override
  Future<void> deleteAllAppNotificationCount() async {
    await _queryAdapter.queryNoReturn('DELETE FROM AppNotificationCount');
  }

  @override
  Future<List<int>> insertAppNotificationCountResponse(
      List<AppNotificationCount> response) {
    return _appNotificationCountInsertionAdapter.insertListAndReturnIds(
        response, sqflite.ConflictAlgorithm.abort);
  }

  @override
  Future<int> deleteAppNotificationCountResponse(
      List<AppNotificationCount> response) {
    return _appNotificationCountDeletionAdapter
        .deleteListAndReturnChangedRows(response);
  }
}

class _$ParentChatResponseDBDao extends ParentChatResponseDBDao {
  _$ParentChatResponseDBDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _parentChatResponseInsertionAdapter = InsertionAdapter(
            database,
            'ParentChatResponse',
            (ParentChatResponse item) => <String, dynamic>{
                  'id': item.id,
                  'Msg': item.Msg,
                  'DatePosted': item.DatePosted,
                  'Actor': item.Actor,
                  'sent': item.sent ? 1 : 0,
                  'notSent': item.notSent ? 1 : 0,
                  'sending': item.sending ? 1 : 0
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _parentChatResponseMapper = (Map<String, dynamic> row) =>
      ParentChatResponse(
          row['id'] as int,
          row['Msg'] as String,
          row['DatePosted'] as String,
          row['Actor'] as String,
          (row['sent'] as int) != 0,
          (row['notSent'] as int) != 0,
          (row['sending'] as int) != 0);

  final InsertionAdapter<ParentChatResponse>
      _parentChatResponseInsertionAdapter;

  @override
  Future<List<ParentChatResponse>> getParentChatResponse() async {
    return _queryAdapter.queryList(
        'SELECT DISTINCT Msg, DatePosted, Actor, sent,notSent, sending FROM ParentChatResponse',
        mapper: _parentChatResponseMapper);
  }

  @override
  Stream<List<ParentChatResponse>> getParentChatResponseStream() {
    return _queryAdapter.queryListStream(
        'SELECT DISTINCT Msg, DatePosted, Actor, sent,notSent, sending FROM ParentChatResponse',
        tableName: 'ParentChatResponse',
        mapper: _parentChatResponseMapper);
  }

  @override
  Future<void> deleteOneParentChatResponse(String message) async {
    await _queryAdapter.queryNoReturn(
        'DELETE FROM ParentChatResponse WHERE Msg = ?',
        arguments: <dynamic>[message]);
  }

  @override
  Future<void> deleteParentChatResponse() async {
    await _queryAdapter.queryNoReturn('DELETE FROM ParentChatResponse');
  }

  @override
  Future<List<int>> insertParentChatResponse(
      List<ParentChatResponse> response) {
    return _parentChatResponseInsertionAdapter.insertListAndReturnIds(
        response, sqflite.ConflictAlgorithm.abort);
  }
}

class _$PortalRecentTransactionsDBDao extends PortalRecentTransactionsDBDao {
  _$PortalRecentTransactionsDBDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _portalRecentTransactionInsertionAdapter = InsertionAdapter(
            database,
            'PortalRecentTransaction',
            (PortalRecentTransaction item) => <String, dynamic>{
                  'id': item.id,
                  'RefNo': item.RefNo,
                  'TranType': item.TranType,
                  'TranDate': item.TranDate,
                  'TranAmount': item.TranAmount,
                  'BalAmount': item.BalAmount,
                  'TransType': item.TransType
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _portalRecentTransactionMapper = (Map<String, dynamic> row) =>
      PortalRecentTransaction(
          row['id'] as int,
          row['RefNo'] as String,
          row['TranType'] as String,
          row['TranDate'] as String,
          row['TranAmount'] as String,
          row['BalAmount'] as String,
          row['TransType'] as String);

  final InsertionAdapter<PortalRecentTransaction>
      _portalRecentTransactionInsertionAdapter;

  @override
  Future<List<PortalRecentTransaction>> getPortalRecentTransactions() async {
    return _queryAdapter.queryList('SELECT * FROM PortalRecentTransaction',
        mapper: _portalRecentTransactionMapper);
  }

  @override
  Future<void> deletePortalRecentTransactions() async {
    await _queryAdapter.queryNoReturn('DELETE FROM PortalRecentTransaction');
  }

  @override
  Future<List<int>> insertPortalRecentTransactions(
      List<PortalRecentTransaction> response) {
    return _portalRecentTransactionInsertionAdapter.insertListAndReturnIds(
        response, sqflite.ConflictAlgorithm.abort);
  }
}

class _$PortalTodoListDBDao extends PortalTodoListDBDao {
  _$PortalTodoListDBDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _portalToDoListInsertionAdapter = InsertionAdapter(
            database,
            'PortalToDoList',
            (PortalToDoList item) => <String, dynamic>{
                  'id': item.id,
                  'DiaryEntryTypeID': item.DiaryEntryTypeID,
                  'DiaryEntryType': item.DiaryEntryType,
                  'DiaryEntriesCount': item.DiaryEntriesCount
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _portalToDoListMapper = (Map<String, dynamic> row) =>
      PortalToDoList(row['id'] as int, row['DiaryEntryTypeID'] as String,
          row['DiaryEntryType'] as String, row['DiaryEntriesCount'] as String);

  final InsertionAdapter<PortalToDoList> _portalToDoListInsertionAdapter;

  @override
  Future<List<PortalToDoList>> getPortalTodoLists() async {
    return _queryAdapter.queryList('SELECT * FROM PortalToDoList',
        mapper: _portalToDoListMapper);
  }

  @override
  Future<void> deletePortalToDoLists() async {
    await _queryAdapter.queryNoReturn('DELETE FROM PortalToDoList');
  }

  @override
  Future<List<int>> insertPortalTodoLists(List<PortalToDoList> response) {
    return _portalToDoListInsertionAdapter.insertListAndReturnIds(
        response, sqflite.ConflictAlgorithm.abort);
  }
}

class _$PortalDetailedTodoListDBDao extends PortalDetailedTodoListDBDao {
  _$PortalDetailedTodoListDBDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _portalDetailedTodoListInsertionAdapter = InsertionAdapter(
            database,
            'PortalDetailedTodoList',
            (PortalDetailedTodoList item) => <String, dynamic>{
                  'id': item.id,
                  'Name': item.Name,
                  'ToDoAge': item.ToDoAge,
                  'DueDate': item.DueDate,
                  'DocPath': item.DocPath,
                  'Body': item.Body,
                  'UnitName': item.UnitName,
                  'TeacherMemoID': item.TeacherMemoID,
                  'IsFeedbackRequired': item.IsFeedbackRequired,
                  'IsDocPathAvailable': item.IsDocPathAvailable,
                  'IsVideoLinkAvailable': item.IsVideoLinkAvailable,
                  'IsDocPathExtraAvailable': item.IsDocPathExtraAvailable,
                  'IsAudioLinkAvailable': item.IsAudioLinkAvailable,
                  'DocPathExtra': item.DocPathExtra,
                  'VideoLink': item.VideoLink,
                  'AudioLink': item.AudioLink,
                  'TimeOffSet': item.TimeOffSet,
                  'PublishDate': item.PublishDate,
                  'StartTime': item.StartTime,
                  'EndTime': item.EndTime,
                  'SubmitStatus': item.SubmitStatus
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _portalDetailedTodoListMapper = (Map<String, dynamic> row) =>
      PortalDetailedTodoList(
          row['id'] as int,
          row['Name'] as String,
          row['ToDoAge'] as String,
          row['DueDate'] as String,
          row['DocPath'] as String,
          row['Body'] as String,
          row['UnitName'] as String,
          row['TeacherMemoID'] as String,
          row['IsFeedbackRequired'] as String,
          row['IsDocPathAvailable'] as String,
          row['IsVideoLinkAvailable'] as String,
          row['IsDocPathExtraAvailable'] as String,
          row['IsAudioLinkAvailable'] as String,
          row['DocPathExtra'] as String,
          row['VideoLink'] as String,
          row['AudioLink'] as String,
          row['TimeOffSet'] as String,
          row['PublishDate'] as String,
          row['StartTime'] as String,
          row['EndTime'] as String,
          row['SubmitStatus'] as String);

  final InsertionAdapter<PortalDetailedTodoList>
      _portalDetailedTodoListInsertionAdapter;

  @override
  Future<List<PortalDetailedTodoList>> getPortalDetailedTodoList() async {
    return _queryAdapter.queryList('SELECT * FROM PortalDetailedTodoList',
        mapper: _portalDetailedTodoListMapper);
  }

  @override
  Future<void> deletePortalDetailedTodoList() async {
    await _queryAdapter.queryNoReturn('DELETE FROM PortalDetailedTodoList');
  }

  @override
  Future<List<int>> insertPortalDetailedTodoLists(
      List<PortalDetailedTodoList> response) {
    return _portalDetailedTodoListInsertionAdapter.insertListAndReturnIds(
        response, sqflite.ConflictAlgorithm.abort);
  }
}

class _$PortalStudentVisualizationDBDao
    extends PortalStudentVisualizationDBDao {
  _$PortalStudentVisualizationDBDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _portalStudentVisualizationInsertionAdapter = InsertionAdapter(
            database,
            'PortalStudentVisualization',
            (PortalStudentVisualization item) => <String, dynamic>{
                  'id': item.id,
                  'Period': item.Period,
                  'UnitName': item.UnitName,
                  'AverageScore': item.AverageScore
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _portalStudentVisualizationMapper = (Map<String, dynamic> row) =>
      PortalStudentVisualization(row['id'] as int, row['Period'] as String,
          row['UnitName'] as String, row['AverageScore'] as String);

  final InsertionAdapter<PortalStudentVisualization>
      _portalStudentVisualizationInsertionAdapter;

  @override
  Future<List<PortalStudentVisualization>>
      getPortalStudentVisualization() async {
    return _queryAdapter.queryList('SELECT * FROM PortalStudentVisualization',
        mapper: _portalStudentVisualizationMapper);
  }

  @override
  Future<void> deletePortalStudentVisualization() async {
    await _queryAdapter.queryNoReturn('DELETE FROM PortalStudentVisualization');
  }

  @override
  Future<List<int>> insertPortalStudentVisualization(
      List<PortalStudentVisualization> response) {
    return _portalStudentVisualizationInsertionAdapter.insertListAndReturnIds(
        response, sqflite.ConflictAlgorithm.abort);
  }
}

class _$PortalStudentVisualizationAverageDBDao
    extends PortalStudentVisualizationAverageDBDao {
  _$PortalStudentVisualizationAverageDBDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _portalStudentVisualizationAverageInsertionAdapter = InsertionAdapter(
            database,
            'PortalStudentVisualizationAverage',
            (PortalStudentVisualizationAverage item) => <String, dynamic>{
                  'id': item.id,
                  'Period': item.Period,
                  'AverageScore': item.AverageScore,
                  'MeanGrade': item.MeanGrade
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _portalStudentVisualizationAverageMapper =
      (Map<String, dynamic> row) => PortalStudentVisualizationAverage(
          row['id'] as int,
          row['Period'] as String,
          row['AverageScore'] as String,
          row['MeanGrade'] as String);

  final InsertionAdapter<PortalStudentVisualizationAverage>
      _portalStudentVisualizationAverageInsertionAdapter;

  @override
  Future<List<PortalStudentVisualizationAverage>>
      getPortalStudentVisualizationAverage() async {
    return _queryAdapter.queryList(
        'SELECT * FROM PortalStudentVisualizationAverage',
        mapper: _portalStudentVisualizationAverageMapper);
  }

  @override
  Future<void> deletePortalStudentVisualizationAverage() async {
    await _queryAdapter
        .queryNoReturn('DELETE FROM PortalStudentVisualizationAverage');
  }

  @override
  Future<List<int>> insertPortalStudentVisualizationAverage(
      List<PortalStudentVisualizationAverage> response) {
    return _portalStudentVisualizationAverageInsertionAdapter
        .insertListAndReturnIds(response, sqflite.ConflictAlgorithm.abort);
  }
}

class _$PortalStudentResultsExtendedDBDao
    extends PortalStudentResultsExtendedDBDao {
  _$PortalStudentResultsExtendedDBDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _portalStudentResultsExtendedInsertionAdapter = InsertionAdapter(
            database,
            'PortalStudentResultsExtended',
            (PortalStudentResultsExtended item) => <String, dynamic>{
                  'id': item.id,
                  'ExamPeriod': item.ExamPeriod,
                  'AvgScore': item.AvgScore,
                  'MeanGrade': item.MeanGrade,
                  'ExamRemarks': item.ExamRemarks,
                  'DownloadLink': item.DownloadLink,
                  'FileURL': item.FileURL
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _portalStudentResultsExtendedMapper =
      (Map<String, dynamic> row) => PortalStudentResultsExtended(
          row['id'] as int,
          row['ExamPeriod'] as String,
          row['AvgScore'] as String,
          row['MeanGrade'] as String,
          row['ExamRemarks'] as String,
          row['DownloadLink'] as String,
          row['FileURL'] as String);

  final InsertionAdapter<PortalStudentResultsExtended>
      _portalStudentResultsExtendedInsertionAdapter;

  @override
  Future<List<PortalStudentResultsExtended>>
      getPortalStudentResultsExtended() async {
    return _queryAdapter.queryList('SELECT * FROM PortalStudentResultsExtended',
        mapper: _portalStudentResultsExtendedMapper);
  }

  @override
  Future<void> deletePortalStudentResultsExtended() async {
    await _queryAdapter
        .queryNoReturn('DELETE FROM PortalStudentResultsExtended');
  }

  @override
  Future<List<int>> insertPortalStudentResultsExtended(
      List<PortalStudentResultsExtended> response) {
    return _portalStudentResultsExtendedInsertionAdapter.insertListAndReturnIds(
        response, sqflite.ConflictAlgorithm.abort);
  }
}

class _$AuthenticationUserResponseDBDao
    extends AuthenticationUserResponseDBDao {
  _$AuthenticationUserResponseDBDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _authenticationUserResponseInsertionAdapter = InsertionAdapter(
            database,
            'AuthenticationUserResponse',
            (AuthenticationUserResponse item) => <String, dynamic>{
                  'id': item.id,
                  'UserID': item.UserID,
                  'UserType': item.UserType,
                  'SchoolID': item.SchoolID,
                  'OrganizationID': item.OrganizationID,
                  'AppCode': item.AppCode,
                  'Username': item.Username,
                  'Password': item.Password
                }),
        _authenticationUserResponseUpdateAdapter = UpdateAdapter(
            database,
            'AuthenticationUserResponse',
            ['id'],
            (AuthenticationUserResponse item) => <String, dynamic>{
                  'id': item.id,
                  'UserID': item.UserID,
                  'UserType': item.UserType,
                  'SchoolID': item.SchoolID,
                  'OrganizationID': item.OrganizationID,
                  'AppCode': item.AppCode,
                  'Username': item.Username,
                  'Password': item.Password
                }),
        _authenticationUserResponseDeletionAdapter = DeletionAdapter(
            database,
            'AuthenticationUserResponse',
            ['id'],
            (AuthenticationUserResponse item) => <String, dynamic>{
                  'id': item.id,
                  'UserID': item.UserID,
                  'UserType': item.UserType,
                  'SchoolID': item.SchoolID,
                  'OrganizationID': item.OrganizationID,
                  'AppCode': item.AppCode,
                  'Username': item.Username,
                  'Password': item.Password
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _authenticationUserResponseMapper = (Map<String, dynamic> row) =>
      AuthenticationUserResponse(
          row['id'] as int,
          row['UserID'] as String,
          row['UserType'] as String,
          row['SchoolID'] as String,
          row['OrganizationID'] as String,
          row['AppCode'] as String,
          row['Username'] as String,
          row['Password'] as String);

  final InsertionAdapter<AuthenticationUserResponse>
      _authenticationUserResponseInsertionAdapter;

  final UpdateAdapter<AuthenticationUserResponse>
      _authenticationUserResponseUpdateAdapter;

  final DeletionAdapter<AuthenticationUserResponse>
      _authenticationUserResponseDeletionAdapter;

  @override
  Future<List<AuthenticationUserResponse>>
      getAuthenticationUserResponse() async {
    return _queryAdapter.queryList('SELECT * FROM AuthenticationUserResponse',
        mapper: _authenticationUserResponseMapper);
  }

  @override
  Future<void> deleteAllAuthenticationUserResponse() async {
    await _queryAdapter.queryNoReturn('DELETE FROM AuthenticationUserResponse');
  }

  @override
  Future<List<int>> insertAuthenticationUserResponse(
      List<AuthenticationUserResponse> response) {
    return _authenticationUserResponseInsertionAdapter.insertListAndReturnIds(
        response, sqflite.ConflictAlgorithm.abort);
  }

  @override
  Future<int> updateAuthenticationUserResponse(
      List<AuthenticationUserResponse> response) {
    return _authenticationUserResponseUpdateAdapter
        .updateListAndReturnChangedRows(
            response, sqflite.ConflictAlgorithm.abort);
  }

  @override
  Future<int> deleteAuthenticationUserResponse(
      List<AuthenticationUserResponse> deleteResponses) {
    return _authenticationUserResponseDeletionAdapter
        .deleteListAndReturnChangedRows(deleteResponses);
  }
}

class _$MziziAppVersionDBDao extends MziziAppVersionDBDao {
  _$MziziAppVersionDBDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _mziziAppVersionInsertionAdapter = InsertionAdapter(
            database,
            'MziziAppVersion',
            (MziziAppVersion item) => <String, dynamic>{
                  'id': item.id,
                  'ForceUpdate': item.ForceUpdate ? 1 : 0
                }),
        _mziziAppVersionDeletionAdapter = DeletionAdapter(
            database,
            'MziziAppVersion',
            ['id'],
            (MziziAppVersion item) => <String, dynamic>{
                  'id': item.id,
                  'ForceUpdate': item.ForceUpdate ? 1 : 0
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _mziziAppVersionMapper = (Map<String, dynamic> row) =>
      MziziAppVersion(row['id'] as int, (row['ForceUpdate'] as int) != 0);

  final InsertionAdapter<MziziAppVersion> _mziziAppVersionInsertionAdapter;

  final DeletionAdapter<MziziAppVersion> _mziziAppVersionDeletionAdapter;

  @override
  Future<List<MziziAppVersion>> getMziziAppVersionResponse() async {
    return _queryAdapter.queryList('SELECT * FROM MziziAppVersion',
        mapper: _mziziAppVersionMapper);
  }

  @override
  Future<void> deleteAllMziziAppVersion() async {
    await _queryAdapter.queryNoReturn('DELETE FROM MziziAppVersion');
  }

  @override
  Future<List<int>> insertMziziAppVersionResponse(
      List<MziziAppVersion> response) {
    return _mziziAppVersionInsertionAdapter.insertListAndReturnIds(
        response, sqflite.ConflictAlgorithm.abort);
  }

  @override
  Future<int> deleteMziziAppVersionResponse(List<MziziAppVersion> response) {
    return _mziziAppVersionDeletionAdapter
        .deleteListAndReturnChangedRows(response);
  }
}

class _$PortalContactsDBDao extends PortalContactsDBDao {
  _$PortalContactsDBDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _portalContactsInsertionAdapter = InsertionAdapter(
            database,
            'PortalContacts',
            (PortalContacts item) => <String, dynamic>{
                  'id': item.id,
                  'SettingName': item.SettingName,
                  'SettingValue': item.SettingValue
                }),
        _portalContactsDeletionAdapter = DeletionAdapter(
            database,
            'PortalContacts',
            ['id'],
            (PortalContacts item) => <String, dynamic>{
                  'id': item.id,
                  'SettingName': item.SettingName,
                  'SettingValue': item.SettingValue
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _portalContactsMapper = (Map<String, dynamic> row) =>
      PortalContacts(row['id'] as int, row['SettingName'] as String,
          row['SettingValue'] as String);

  final InsertionAdapter<PortalContacts> _portalContactsInsertionAdapter;

  final DeletionAdapter<PortalContacts> _portalContactsDeletionAdapter;

  @override
  Future<List<PortalContacts>> getPortalContactsResponse() async {
    return _queryAdapter.queryList('SELECT * FROM PortalContacts',
        mapper: _portalContactsMapper);
  }

  @override
  Future<void> deleteAllPortalContacts() async {
    await _queryAdapter.queryNoReturn('DELETE FROM PortalContacts');
  }

  @override
  Future<List<int>> insertPortalContactsResponse(
      List<PortalContacts> response) {
    return _portalContactsInsertionAdapter.insertListAndReturnIds(
        response, sqflite.ConflictAlgorithm.abort);
  }

  @override
  Future<int> deletePortalContactsResponse(List<PortalContacts> response) {
    return _portalContactsDeletionAdapter
        .deleteListAndReturnChangedRows(response);
  }
}

class _$PortalDetailedTransactionDBDao extends PortalDetailedTransactionDBDao {
  _$PortalDetailedTransactionDBDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _portalDetailedTransactionInsertionAdapter = InsertionAdapter(
            database,
            'PortalDetailedTransaction',
            (PortalDetailedTransaction item) => <String, dynamic>{
                  'id': item.id,
                  'RefNo': item.RefNo,
                  'TranAmount': item.TranAmount,
                  'BalAmount': item.BalAmount,
                  'CurrentAmount': item.CurrentAmount,
                  'TranType': item.TranType,
                  'TransType': item.TransType,
                  'DatePosted': item.DatePosted
                }),
        _portalDetailedTransactionDeletionAdapter = DeletionAdapter(
            database,
            'PortalDetailedTransaction',
            ['id'],
            (PortalDetailedTransaction item) => <String, dynamic>{
                  'id': item.id,
                  'RefNo': item.RefNo,
                  'TranAmount': item.TranAmount,
                  'BalAmount': item.BalAmount,
                  'CurrentAmount': item.CurrentAmount,
                  'TranType': item.TranType,
                  'TransType': item.TransType,
                  'DatePosted': item.DatePosted
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _portalDetailedTransactionMapper = (Map<String, dynamic> row) =>
      PortalDetailedTransaction(
          row['id'] as int,
          row['RefNo'] as String,
          row['TranAmount'] as String,
          row['BalAmount'] as String,
          row['CurrentAmount'] as String,
          row['TranType'] as String,
          row['TransType'] as String,
          row['DatePosted'] as String);

  final InsertionAdapter<PortalDetailedTransaction>
      _portalDetailedTransactionInsertionAdapter;

  final DeletionAdapter<PortalDetailedTransaction>
      _portalDetailedTransactionDeletionAdapter;

  @override
  Future<List<PortalDetailedTransaction>> getPortalDetailedTransaction() async {
    return _queryAdapter.queryList('SELECT * FROM PortalDetailedTransaction',
        mapper: _portalDetailedTransactionMapper);
  }

  @override
  Future<void> deleteAllPortalDetailedTransaction() async {
    await _queryAdapter.queryNoReturn('DELETE FROM PortalDetailedTransaction');
  }

  @override
  Future<List<int>> insertPortalDetailedTransactionResponse(
      List<PortalDetailedTransaction> response) {
    return _portalDetailedTransactionInsertionAdapter.insertListAndReturnIds(
        response, sqflite.ConflictAlgorithm.abort);
  }

  @override
  Future<int> deletePortalDetailedTransactionResponse(
      List<PortalDetailedTransaction> response) {
    return _portalDetailedTransactionDeletionAdapter
        .deleteListAndReturnChangedRows(response);
  }
}

class _$PortalFilteredStudentInfoDBDao extends PortalFilteredStudentInfoDBDao {
  _$PortalFilteredStudentInfoDBDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _portalFilteredStudentInfoInsertionAdapter = InsertionAdapter(
            database,
            'PortalFilteredStudentInfo',
            (PortalFilteredStudentInfo item) => <String, dynamic>{
                  'id': item.id,
                  'Balance': item.Balance,
                  'BillingBalance': item.BillingBalance,
                  'PortalAccount': item.PortalAccount,
                  'PortalPaybill': item.PortalPaybill,
                  'OrganizationID': item.OrganizationID
                }),
        _portalFilteredStudentInfoDeletionAdapter = DeletionAdapter(
            database,
            'PortalFilteredStudentInfo',
            ['id'],
            (PortalFilteredStudentInfo item) => <String, dynamic>{
                  'id': item.id,
                  'Balance': item.Balance,
                  'BillingBalance': item.BillingBalance,
                  'PortalAccount': item.PortalAccount,
                  'PortalPaybill': item.PortalPaybill,
                  'OrganizationID': item.OrganizationID
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _portalFilteredStudentInfoMapper = (Map<String, dynamic> row) =>
      PortalFilteredStudentInfo(
          row['id'] as int,
          row['Balance'] as String,
          row['BillingBalance'] as String,
          row['PortalAccount'] as String,
          row['PortalPaybill'] as String,
          row['OrganizationID'] as String);

  final InsertionAdapter<PortalFilteredStudentInfo>
      _portalFilteredStudentInfoInsertionAdapter;

  final DeletionAdapter<PortalFilteredStudentInfo>
      _portalFilteredStudentInfoDeletionAdapter;

  @override
  Future<List<PortalFilteredStudentInfo>>
      getPortalFilteredStudentInfoResponse() async {
    return _queryAdapter.queryList('SELECT * FROM PortalFilteredStudentInfo',
        mapper: _portalFilteredStudentInfoMapper);
  }

  @override
  Future<void> deleteAllPortalFilteredStudentInfo() async {
    await _queryAdapter.queryNoReturn('DELETE FROM PortalFilteredStudentInfo');
  }

  @override
  Future<List<int>> insertPortalFilteredStudentInfoResponse(
      List<PortalFilteredStudentInfo> response) {
    return _portalFilteredStudentInfoInsertionAdapter.insertListAndReturnIds(
        response, sqflite.ConflictAlgorithm.abort);
  }

  @override
  Future<int> deletePortalFilteredStudentInfoResponse(
      List<PortalFilteredStudentInfo> response) {
    return _portalFilteredStudentInfoDeletionAdapter
        .deleteListAndReturnChangedRows(response);
  }
}

class _$PortalNotificationDBDao extends PortalNotificationDBDao {
  _$PortalNotificationDBDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _portalNotificationInsertionAdapter = InsertionAdapter(
            database,
            'PortalNotification',
            (PortalNotification item) => <String, dynamic>{
                  'id': item.id,
                  'MsgID': item.MsgID,
                  'Msg': item.Msg,
                  'DateSent': item.DateSent
                }),
        _portalNotificationDeletionAdapter = DeletionAdapter(
            database,
            'PortalNotification',
            ['id'],
            (PortalNotification item) => <String, dynamic>{
                  'id': item.id,
                  'MsgID': item.MsgID,
                  'Msg': item.Msg,
                  'DateSent': item.DateSent
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _portalNotificationMapper = (Map<String, dynamic> row) =>
      PortalNotification(row['id'] as int, row['MsgID'] as int,
          row['Msg'] as String, row['DateSent'] as String);

  final InsertionAdapter<PortalNotification>
      _portalNotificationInsertionAdapter;

  final DeletionAdapter<PortalNotification> _portalNotificationDeletionAdapter;

  @override
  Future<List<PortalNotification>> getPortalNotificationResponse() async {
    return _queryAdapter.queryList('SELECT * FROM PortalNotification',
        mapper: _portalNotificationMapper);
  }

  @override
  Future<List<PortalNotification>> getLastNotificationResponse() async {
    return _queryAdapter.queryList(
        'SELECT * FROM PortalNotification ORDER BY id DESC LIMIT 1',
        mapper: _portalNotificationMapper);
  }

  @override
  Future<void> deleteAllPortalNotification() async {
    await _queryAdapter.queryNoReturn('DELETE FROM PortalNotification');
  }

  @override
  Future<List<int>> insertPortalNotificationResponse(
      List<PortalNotification> response) {
    return _portalNotificationInsertionAdapter.insertListAndReturnIds(
        response, sqflite.ConflictAlgorithm.abort);
  }

  @override
  Future<int> deletePortalNotificationResponse(
      List<PortalNotification> response) {
    return _portalNotificationDeletionAdapter
        .deleteListAndReturnChangedRows(response);
  }
}

class _$PortalProgressReportDBDao extends PortalProgressReportDBDao {
  _$PortalProgressReportDBDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _portalProgressReportInsertionAdapter = InsertionAdapter(
            database,
            'PortalProgressReport',
            (PortalProgressReport item) => <String, dynamic>{
                  'id': item.id,
                  'StudentFullName': item.StudentFullName,
                  'YearID': item.YearID,
                  'TermName': item.TermName,
                  'ExamTypeDesc': item.ExamTypeDesc,
                  'CourseName': item.CourseName,
                  'LevelName': item.LevelName,
                  'Activity': item.Activity,
                  'LearningArea': item.LearningArea,
                  'Remarks': item.Remarks,
                  'ScoreDescription': item.ScoreDescription,
                  'ClassTeacherComment': item.ClassTeacherComment,
                  'HeadTeacherComment': item.HeadTeacherComment
                }),
        _portalProgressReportDeletionAdapter = DeletionAdapter(
            database,
            'PortalProgressReport',
            ['id'],
            (PortalProgressReport item) => <String, dynamic>{
                  'id': item.id,
                  'StudentFullName': item.StudentFullName,
                  'YearID': item.YearID,
                  'TermName': item.TermName,
                  'ExamTypeDesc': item.ExamTypeDesc,
                  'CourseName': item.CourseName,
                  'LevelName': item.LevelName,
                  'Activity': item.Activity,
                  'LearningArea': item.LearningArea,
                  'Remarks': item.Remarks,
                  'ScoreDescription': item.ScoreDescription,
                  'ClassTeacherComment': item.ClassTeacherComment,
                  'HeadTeacherComment': item.HeadTeacherComment
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _portalProgressReportMapper = (Map<String, dynamic> row) =>
      PortalProgressReport(
          row['id'] as int,
          row['StudentFullName'] as String,
          row['YearID'] as String,
          row['TermName'] as String,
          row['ExamTypeDesc'] as String,
          row['CourseName'] as String,
          row['LevelName'] as String,
          row['Activity'] as String,
          row['LearningArea'] as String,
          row['Remarks'] as String,
          row['ScoreDescription'] as String,
          row['ClassTeacherComment'] as String,
          row['HeadTeacherComment'] as String);

  final InsertionAdapter<PortalProgressReport>
      _portalProgressReportInsertionAdapter;

  final DeletionAdapter<PortalProgressReport>
      _portalProgressReportDeletionAdapter;

  @override
  Future<List<PortalProgressReport>> getPortalProgressReportResponse() async {
    return _queryAdapter.queryList('SELECT * FROM PortalProgressReport',
        mapper: _portalProgressReportMapper);
  }

  @override
  Future<List<PortalProgressReport>> getActivitiesSelectedYearTermExamType(
      String examType, String yearFor, String termName) async {
    return _queryAdapter.queryList(
        'SELECT DISTINCT Activity, CourseName, LevelName FROM PortalProgressReport WHERE ExamTypeDesc = ? AND YearID = ? AND TermName = ?',
        arguments: <dynamic>[examType, yearFor, termName],
        mapper: _portalProgressReportMapper);
  }

  @override
  Future<List<PortalProgressReport>>
      getPortalProgressReportSelectedYearTermExamType(String activity,
          String examType, String yearFor, String termName) async {
    return _queryAdapter.queryList(
        'SELECT DISTINCT LearningArea, ScoreDescription, Remarks FROM PortalProgressReport WHERE Activity = ? AND ExamTypeDesc = ? AND YearID = ? AND TermName = ?',
        arguments: <dynamic>[activity, examType, yearFor, termName],
        mapper: _portalProgressReportMapper);
  }

  @override
  Future<List<PortalProgressReport>> getHeadTeacherComment(
      String examType, String termName, String yearFor) async {
    return _queryAdapter.queryList(
        'SELECT DISTINCT HeadTeacherComment FROM PortalProgressReport WHERE ExamTypeDesc = ? AND YearID = ? AND TermName = ?',
        arguments: <dynamic>[examType, termName, yearFor],
        mapper: _portalProgressReportMapper);
  }

  @override
  Future<List<PortalProgressReport>> getGradeFacilitatorComment(
      String examType, String termName, String yearFor) async {
    return _queryAdapter.queryList(
        'SELECT DISTINCT ClassTeacherComment FROM PortalProgressReport WHERE ExamTypeDesc = ? AND YearID = ? AND TermName = ?',
        arguments: <dynamic>[examType, termName, yearFor],
        mapper: _portalProgressReportMapper);
  }

  @override
  Future<List<PortalProgressReport>> getDistictYears() async {
    return _queryAdapter.queryList(
        'SELECT DISTINCT YearID FROM PortalProgressReport',
        mapper: _portalProgressReportMapper);
  }

  @override
  Future<List<PortalProgressReport>> getDistictTerms() async {
    return _queryAdapter.queryList(
        'SELECT DISTINCT TermName FROM PortalProgressReport',
        mapper: _portalProgressReportMapper);
  }

  @override
  Future<List<PortalProgressReport>> getDistictExamType() async {
    return _queryAdapter.queryList(
        'SELECT DISTINCT ExamTypeDesc FROM PortalProgressReport',
        mapper: _portalProgressReportMapper);
  }

  @override
  Future<void> deleteAllPortalProgressReportResponse() async {
    await _queryAdapter.queryNoReturn('DELETE FROM PortalProgressReport');
  }

  @override
  Future<List<int>> insertPortalProgressReportResponse(
      List<PortalProgressReport> response) {
    return _portalProgressReportInsertionAdapter.insertListAndReturnIds(
        response, sqflite.ConflictAlgorithm.abort);
  }

  @override
  Future<int> deletePortalProgressReportResponse(
      List<PortalProgressReport> response) {
    return _portalProgressReportDeletionAdapter
        .deleteListAndReturnChangedRows(response);
  }
}

class _$PortalSiblingsDBDao extends PortalSiblingsDBDao {
  _$PortalSiblingsDBDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _portalSiblingsInsertionAdapter = InsertionAdapter(
            database,
            'PortalSiblings',
            (PortalSiblings item) => <String, dynamic>{
                  'id': item.id,
                  'StudentID': item.StudentID,
                  'RegistrationNumber': item.RegistrationNumber,
                  'StudentFullName': item.StudentFullName,
                  'CourseName': item.CourseName,
                  'StudentStatus': item.StudentStatus
                }),
        _portalSiblingsDeletionAdapter = DeletionAdapter(
            database,
            'PortalSiblings',
            ['id'],
            (PortalSiblings item) => <String, dynamic>{
                  'id': item.id,
                  'StudentID': item.StudentID,
                  'RegistrationNumber': item.RegistrationNumber,
                  'StudentFullName': item.StudentFullName,
                  'CourseName': item.CourseName,
                  'StudentStatus': item.StudentStatus
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _portalSiblingsMapper = (Map<String, dynamic> row) =>
      PortalSiblings(
          row['id'] as int,
          row['StudentID'] as String,
          row['RegistrationNumber'] as String,
          row['StudentFullName'] as String,
          row['CourseName'] as String,
          row['StudentStatus'] as String);

  final InsertionAdapter<PortalSiblings> _portalSiblingsInsertionAdapter;

  final DeletionAdapter<PortalSiblings> _portalSiblingsDeletionAdapter;

  @override
  Future<List<PortalSiblings>> getPortalSiblingsoResponse() async {
    return _queryAdapter.queryList(
        'SELECT DISTINCT StudentID,RegistrationNumber, StudentFullName,CourseName,StudentStatus FROM PortalSiblings',
        mapper: _portalSiblingsMapper);
  }

  @override
  Future<void> deleteAllPortalPortalSiblings() async {
    await _queryAdapter.queryNoReturn('DELETE FROM PortalSiblings');
  }

  @override
  Future<List<int>> insertPortalSiblingsResponse(
      List<PortalSiblings> response) {
    return _portalSiblingsInsertionAdapter.insertListAndReturnIds(
        response, sqflite.ConflictAlgorithm.abort);
  }

  @override
  Future<int> deletePortalSiblingsResponse(List<PortalSiblings> response) {
    return _portalSiblingsDeletionAdapter
        .deleteListAndReturnChangedRows(response);
  }
}

class _$PortalStudentDetailedResultsDBDao
    extends PortalStudentDetailedResultsDBDao {
  _$PortalStudentDetailedResultsDBDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _portalStudentDetailedResultsInsertionAdapter = InsertionAdapter(
            database,
            'PortalStudentDetailedResults',
            (PortalStudentDetailedResults item) => <String, dynamic>{
                  'id': item.id,
                  'Subjects': item.Subjects,
                  'Score': item.Score,
                  'Grade': item.Grade,
                  'Remark': item.Remark,
                  'TotalMarks': item.TotalMarks,
                  'MeanScore': item.MeanScore,
                  'MeanGrade': item.MeanGrade,
                  'StreamPosition': item.StreamPosition,
                  'OverallPosition': item.OverallPosition,
                  'Period': item.Period,
                  'TermName': item.TermName,
                  'CurrentYear': item.CurrentYear,
                  'CTComments': item.CTComments,
                  'HMComments': item.HMComments
                }),
        _portalStudentDetailedResultsDeletionAdapter = DeletionAdapter(
            database,
            'PortalStudentDetailedResults',
            ['id'],
            (PortalStudentDetailedResults item) => <String, dynamic>{
                  'id': item.id,
                  'Subjects': item.Subjects,
                  'Score': item.Score,
                  'Grade': item.Grade,
                  'Remark': item.Remark,
                  'TotalMarks': item.TotalMarks,
                  'MeanScore': item.MeanScore,
                  'MeanGrade': item.MeanGrade,
                  'StreamPosition': item.StreamPosition,
                  'OverallPosition': item.OverallPosition,
                  'Period': item.Period,
                  'TermName': item.TermName,
                  'CurrentYear': item.CurrentYear,
                  'CTComments': item.CTComments,
                  'HMComments': item.HMComments
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _portalStudentDetailedResultsMapper =
      (Map<String, dynamic> row) => PortalStudentDetailedResults(
          row['id'] as int,
          row['Subjects'] as String,
          row['Score'] as String,
          row['Grade'] as String,
          row['Remark'] as String,
          row['TotalMarks'] as String,
          row['MeanScore'] as String,
          row['MeanGrade'] as String,
          row['StreamPosition'] as String,
          row['OverallPosition'] as String,
          row['Period'] as String,
          row['TermName'] as String,
          row['CurrentYear'] as String,
          row['CTComments'] as String,
          row['HMComments'] as String);

  final InsertionAdapter<PortalStudentDetailedResults>
      _portalStudentDetailedResultsInsertionAdapter;

  final DeletionAdapter<PortalStudentDetailedResults>
      _portalStudentDetailedResultsDeletionAdapter;

  @override
  Future<List<PortalStudentDetailedResults>>
      getPortalStudentDetailedResultsResponse() async {
    return _queryAdapter.queryList('SELECT * FROM PortalStudentDetailedResults',
        mapper: _portalStudentDetailedResultsMapper);
  }

  @override
  Future<List<PortalStudentDetailedResults>> getDistinctYears() async {
    return _queryAdapter.queryList(
        'SELECT DISTINCT CurrentYear FROM PortalStudentDetailedResults',
        mapper: _portalStudentDetailedResultsMapper);
  }

  @override
  Future<void> deleteAllPortalStudentDetailedResults() async {
    await _queryAdapter
        .queryNoReturn('DELETE FROM PortalStudentDetailedResults');
  }

  @override
  Future<List<int>> insertPortalStudentDetailedResultsResponse(
      List<PortalStudentDetailedResults> response) {
    return _portalStudentDetailedResultsInsertionAdapter.insertListAndReturnIds(
        response, sqflite.ConflictAlgorithm.abort);
  }

  @override
  Future<int> deletePortalStudentDetailedResultsResponse(
      List<PortalStudentDetailedResults> response) {
    return _portalStudentDetailedResultsDeletionAdapter
        .deleteListAndReturnChangedRows(response);
  }
}

class _$PortalStudentInfoDBDao extends PortalStudentInfoDBDao {
  _$PortalStudentInfoDBDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _portalStudentInfoInsertionAdapter = InsertionAdapter(
            database,
            'PortalStudentInfo',
            (PortalStudentInfo item) => <String, dynamic>{
                  'id': item.id,
                  'StudentFullName': item.StudentFullName,
                  'RegistrationNumber': item.RegistrationNumber,
                  'Email': item.Email,
                  'StudentPhoneNo': item.StudentPhoneNo,
                  'DOB': item.DOB,
                  'DateOfAdmission': item.DateOfAdmission,
                  'TwoNames': item.TwoNames,
                  'Balance': item.Balance,
                  'MeanGrade': item.MeanGrade,
                  'MeanScore': item.MeanScore,
                  'Attendance': item.Attendance,
                  'Events': item.Events,
                  'PhotoUrl': item.PhotoUrl,
                  'CopyrightYear': item.CopyrightYear,
                  'ClassStream': item.ClassStream,
                  'SchoolName': item.SchoolName,
                  'SchoolMotto': item.SchoolMotto,
                  'BillingBalance': item.BillingBalance,
                  'PortalAccount': item.PortalAccount,
                  'PortalPaybill': item.PortalPaybill,
                  'OrganizationID': item.OrganizationID
                }),
        _portalStudentInfoDeletionAdapter = DeletionAdapter(
            database,
            'PortalStudentInfo',
            ['id'],
            (PortalStudentInfo item) => <String, dynamic>{
                  'id': item.id,
                  'StudentFullName': item.StudentFullName,
                  'RegistrationNumber': item.RegistrationNumber,
                  'Email': item.Email,
                  'StudentPhoneNo': item.StudentPhoneNo,
                  'DOB': item.DOB,
                  'DateOfAdmission': item.DateOfAdmission,
                  'TwoNames': item.TwoNames,
                  'Balance': item.Balance,
                  'MeanGrade': item.MeanGrade,
                  'MeanScore': item.MeanScore,
                  'Attendance': item.Attendance,
                  'Events': item.Events,
                  'PhotoUrl': item.PhotoUrl,
                  'CopyrightYear': item.CopyrightYear,
                  'ClassStream': item.ClassStream,
                  'SchoolName': item.SchoolName,
                  'SchoolMotto': item.SchoolMotto,
                  'BillingBalance': item.BillingBalance,
                  'PortalAccount': item.PortalAccount,
                  'PortalPaybill': item.PortalPaybill,
                  'OrganizationID': item.OrganizationID
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _portalStudentInfoMapper = (Map<String, dynamic> row) =>
      PortalStudentInfo(
          row['id'] as int,
          row['StudentFullName'] as String,
          row['RegistrationNumber'] as String,
          row['Email'] as String,
          row['StudentPhoneNo'] as String,
          row['DOB'] as String,
          row['DateOfAdmission'] as String,
          row['TwoNames'] as String,
          row['Balance'] as String,
          row['MeanGrade'] as String,
          row['MeanScore'] as String,
          row['Attendance'] as String,
          row['Events'] as String,
          row['PhotoUrl'] as String,
          row['CopyrightYear'] as String,
          row['ClassStream'] as String,
          row['SchoolName'] as String,
          row['SchoolMotto'] as String,
          row['BillingBalance'] as String,
          row['PortalAccount'] as String,
          row['PortalPaybill'] as String,
          row['OrganizationID'] as String);

  final InsertionAdapter<PortalStudentInfo> _portalStudentInfoInsertionAdapter;

  final DeletionAdapter<PortalStudentInfo> _portalStudentInfoDeletionAdapter;

  @override
  Future<List<PortalStudentInfo>> getPortalStudentInfoResponse() async {
    return _queryAdapter.queryList('SELECT * FROM PortalStudentInfo',
        mapper: _portalStudentInfoMapper);
  }

  @override
  Future<void> deleteAllPortalStudentInfo() async {
    await _queryAdapter.queryNoReturn('DELETE FROM PortalStudentInfo');
  }

  @override
  Future<List<int>> insertPortalStudentInfoResponse(
      List<PortalStudentInfo> response) {
    return _portalStudentInfoInsertionAdapter.insertListAndReturnIds(
        response, sqflite.ConflictAlgorithm.abort);
  }

  @override
  Future<int> deletePortalStudentInfoResponse(
      List<PortalStudentInfo> response) {
    return _portalStudentInfoDeletionAdapter
        .deleteListAndReturnChangedRows(response);
  }
}

class _$PortalSyncMyAccountDBDao extends PortalSyncMyAccountDBDao {
  _$PortalSyncMyAccountDBDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _portalSyncMyAccountInsertionAdapter = InsertionAdapter(
            database,
            'PortalSyncMyAccount',
            (PortalSyncMyAccount item) => <String, dynamic>{
                  'id': item.id,
                  'BillingBalance': item.BillingBalance,
                  'OrganizationID': item.OrganizationID,
                  'PaybillNo': item.PaybillNo,
                  'PortalAccount': item.PortalAccount,
                  'Balance': item.Balance
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _portalSyncMyAccountMapper = (Map<String, dynamic> row) =>
      PortalSyncMyAccount(
          row['id'] as int,
          row['BillingBalance'] as String,
          row['OrganizationID'] as String,
          row['PaybillNo'] as String,
          row['PortalAccount'] as String,
          row['Balance'] as String);

  final InsertionAdapter<PortalSyncMyAccount>
      _portalSyncMyAccountInsertionAdapter;

  @override
  Future<List<PortalSyncMyAccount>> getPortalSyncMyAccountResponse() async {
    return _queryAdapter.queryList('SELECT * FROM PortalSyncMyAccount',
        mapper: _portalSyncMyAccountMapper);
  }

  @override
  Future<void> deleteAllPortalSyncMyAccount() async {
    await _queryAdapter.queryNoReturn('DELETE FROM PortalSyncMyAccount');
  }

  @override
  Future<List<int>> insertPortalSyncMyAccountResponse(
      List<PortalSyncMyAccount> response) {
    return _portalSyncMyAccountInsertionAdapter.insertListAndReturnIds(
        response, sqflite.ConflictAlgorithm.abort);
  }
}

class _$PortalEventsDBDao extends PortalEventsDBDao {
  _$PortalEventsDBDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _portalEventsInsertionAdapter = InsertionAdapter(
            database,
            'PortalEvents',
            (PortalEvents item) => <String, dynamic>{
                  'id': item.id,
                  'EventsTitle': item.EventsTitle,
                  'Venue': item.Venue,
                  'StartDate': item.StartDate,
                  'EndDate': item.EndDate,
                  'StartTime': item.StartTime,
                  'EndTime': item.EndTime,
                  'Description': item.Description
                }),
        _portalEventsDeletionAdapter = DeletionAdapter(
            database,
            'PortalEvents',
            ['id'],
            (PortalEvents item) => <String, dynamic>{
                  'id': item.id,
                  'EventsTitle': item.EventsTitle,
                  'Venue': item.Venue,
                  'StartDate': item.StartDate,
                  'EndDate': item.EndDate,
                  'StartTime': item.StartTime,
                  'EndTime': item.EndTime,
                  'Description': item.Description
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _portalEventsMapper = (Map<String, dynamic> row) => PortalEvents(
      row['id'] as int,
      row['EventsTitle'] as String,
      row['Venue'] as String,
      row['StartDate'] as String,
      row['EndDate'] as String,
      row['StartTime'] as String,
      row['EndTime'] as String,
      row['Description'] as String);

  final InsertionAdapter<PortalEvents> _portalEventsInsertionAdapter;

  final DeletionAdapter<PortalEvents> _portalEventsDeletionAdapter;

  @override
  Future<List<PortalEvents>> getPortalEventsResponse() async {
    return _queryAdapter.queryList('SELECT * FROM PortalEvents',
        mapper: _portalEventsMapper);
  }

  @override
  Future<void> deleteAllPortalEvents() async {
    await _queryAdapter.queryNoReturn('DELETE FROM PortalEvents');
  }

  @override
  Future<List<int>> insertPortalEventsResponse(List<PortalEvents> response) {
    return _portalEventsInsertionAdapter.insertListAndReturnIds(
        response, sqflite.ConflictAlgorithm.abort);
  }

  @override
  Future<int> deletePortalEventsResponse(List<PortalEvents> response) {
    return _portalEventsDeletionAdapter
        .deleteListAndReturnChangedRows(response);
  }
}
