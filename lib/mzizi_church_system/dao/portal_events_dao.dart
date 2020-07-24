

import 'package:mzizichurchsystem/mzizi_church_system/database/app_database.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_events_response_model.dart';

class PortalEventsDAO{

  PortalEventsDAO();

  Future<List<int>> insertPortalEvents(List<PortalEvents> insert) async{
          try{
              final db = await $FloorAppDatabase.databaseBuilder("app_database.db").build();
               return  await  db.getPortalEventsDBDao.insertPortalEventsResponse(insert);
          }catch(e){
            throw(e);
          }
    }

    Future<List<PortalEvents>> getPortalEvents() async{
      try{
        final db = await $FloorAppDatabase.databaseBuilder("app_database.db").build();
        return await db.getPortalEventsDBDao.getPortalEventsResponse();
      }catch(e){
        throw(e); 
      }
    }


    Future<int> deletePortalEvents(List<PortalEvents> delete) async{
        try{
            final db = await $FloorAppDatabase.databaseBuilder("app_database.db").build();
            return db.getPortalEventsDBDao.deletePortalEventsResponse(delete);
        }catch(e){
          throw(e);
        }
    }


}