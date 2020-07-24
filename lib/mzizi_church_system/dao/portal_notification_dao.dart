




import 'package:mzizichurchsystem/mzizi_church_system/database/app_database.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_notification_response_model.dart';

class PortalNotificationDAO{

  PortalNotificationDAO();


  Future<List<int>> insertPortalNotification(List<PortalNotification> insert) async{
          try{
              final db = await $FloorAppDatabase.databaseBuilder("app_database.db").build();
               return  await  db.getPortalNotificationDBDao.insertPortalNotificationResponse(insert);
          }catch(e){
            throw(e);
          }
    }

    Future<List<PortalNotification>> getPortalNotification() async{
      try{
        final db = await $FloorAppDatabase.databaseBuilder("app_database.db").build();
        return await db.getPortalNotificationDBDao.getPortalNotificationResponse();
      }catch(e){
        throw(e); 
      }
    }

    Future<List<PortalNotification>> getLastNotification() async{
      try{
          final db = await $FloorAppDatabase.databaseBuilder("app_database.db").build();
          return await db.getPortalNotificationDBDao.getLastNotificationResponse();
      }catch(e){
        throw(e);
      }
    }


    Future<int> deletePortalNotification(List<PortalNotification> delete) async{
        try{
            final db = await $FloorAppDatabase.databaseBuilder("app_database.db").build();
            return db.getPortalNotificationDBDao.deletePortalNotificationResponse(delete);
        }catch(e){
          throw(e);
        }
    }


}