

import 'package:mzizichurchsystem/mzizi_church_system/database/app_database.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_student_info_response_model.dart';

class PortalStudentInfoDAO{

  PortalStudentInfoDAO();


  Future<List<int>> insertPortalStudentInfo(List<PortalStudentInfo> insert) async{
          try{
              final db = await $FloorAppDatabase.databaseBuilder("app_database.db").build();
               return  await  db.getPortalStudentInfoDBDao.insertPortalStudentInfoResponse(insert);
          }catch(e){
            throw(e);
          }
    }

    Future<List<PortalStudentInfo>> getPortalStudentInfo() async{
      try{
        final db = await $FloorAppDatabase.databaseBuilder("app_database.db").build();
        return await db.getPortalStudentInfoDBDao.getPortalStudentInfoResponse();
      }catch(e){
        throw(e); 
      }
    }


    Future<int> deletePortalStudentInfo(List<PortalStudentInfo> delete) async{
        try{
            final db = await $FloorAppDatabase.databaseBuilder("app_database.db").build();
            return db.getPortalStudentInfoDBDao.deletePortalStudentInfoResponse(delete);
        }catch(e){
          throw(e);
        }
    }

    Future<void> deleteAllPortalStudentInfo() async{
      try{
        final db = await $FloorAppDatabase.databaseBuilder("app_database.db").build();
        db.getPortalStudentInfoDBDao.deleteAllPortalStudentInfo();
      }catch(e){
        throw(e);
      }
    }


}