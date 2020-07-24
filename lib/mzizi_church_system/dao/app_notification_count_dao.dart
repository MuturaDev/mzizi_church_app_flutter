
import 'package:mzizichurchsystem/mzizi_church_system/database/app_database.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/model_classes/app_notification_count.dart';

class AppNotificationCountDAO{

  AppNotificationCountDAO();

  Future<List<int>> insertAppNotificationCountDAO(List<AppNotificationCount> notification) async{
        try{
          final db = await $FloorAppDatabase.databaseBuilder("app_database.db").build();
          return  await  db.getAppNotificationCountDBDao.insertAppNotificationCountResponse(notification);
      }catch(e){
        throw(e);
      }
  }

  Future<List<AppNotificationCount>> getAppNotificationCountDAO() async{
    try{
      final db = await $FloorAppDatabase.databaseBuilder("app_database.db").build();
      return await db.getAppNotificationCountDBDao.getAppNotificationCountResponse();
    }catch(e){
      throw(e); 
    }
  }

  Future<int> deleteAppNotificationCountDAO(List<AppNotificationCount> notification) async{
      try{
          final db = await $FloorAppDatabase.databaseBuilder("app_database.db").build();
         return await db.getAppNotificationCountDBDao.deleteAppNotificationCountResponse(notification);
      }catch(e){
        throw(e);
      }
  }

}