


import 'package:mzizichurchsystem/mzizi_church_system/database/app_database.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_contacts_response_model.dart';

class PortalContactsDAO{



  PortalContactsDAO();

  Future<List<int>> insertPortalContacts(List<PortalContacts> insert) async{
          try{
              final db = await $FloorAppDatabase.databaseBuilder("app_database.db").build();
               return  await  db.getPortalContactsDBDao.insertPortalContactsResponse(insert);
          }catch(e){
            throw(e);
          }
    }

    Future<List<PortalContacts>> getPortalContacts() async{
      try{
        final db = await $FloorAppDatabase.databaseBuilder("app_database.db").build();
        return await db.getPortalContactsDBDao.getPortalContactsResponse();
      }catch(e){
        throw(e); 
      }
    }


    Future<int> deletePortalContacts(List<PortalContacts> delete) async{
        try{
            final db = await $FloorAppDatabase.databaseBuilder("app_database.db").build();
            return db.getPortalContactsDBDao.deletePortalContactsResponse(delete);
        }catch(e){
          throw(e);
        }
    }

}