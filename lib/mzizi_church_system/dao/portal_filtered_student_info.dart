


import 'package:mzizichurchsystem/mzizi_church_system/database/app_database.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_filtered_student_info_response_model.dart';

class PortalFilteredStudentInfoDAO{

  PortalFilteredStudentInfoDAO();


  Future<List<int>> insertPortalFilteredStudentInfoDAO(List<PortalFilteredStudentInfo> insert) async{
          try{
              final db = await $FloorAppDatabase.databaseBuilder("app_database.db").build();
               return  await  db.getPortalFilteredStudentInfoDBDao.insertPortalFilteredStudentInfoResponse(insert);
          }catch(e){
            throw(e);
          }
    }

    Future<List<PortalFilteredStudentInfo>> getPortalFilteredStudentInfoDAO() async{
      try{
        final db = await $FloorAppDatabase.databaseBuilder("app_database.db").build();
        return await db.getPortalFilteredStudentInfoDBDao.getPortalFilteredStudentInfoResponse();
      }catch(e){
        throw(e); 
      }
    }


    Future<int> deletePortalFilteredStudentInfoDAO(List<PortalFilteredStudentInfo> delete) async{
        try{
            final db = await $FloorAppDatabase.databaseBuilder("app_database.db").build();
            return db.getPortalFilteredStudentInfoDBDao.deletePortalFilteredStudentInfoResponse(delete);
        }catch(e){
          throw(e);
        }
    }


}