

import 'package:mzizichurchsystem/mzizi_church_system/database/app_database.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/mzizi_app_version_response_model.dart';

class MziziAppVersionDAO{

  MziziAppVersionDAO();

  Future<List<int>> insertAppVersion(List<MziziAppVersion> versions) async{
          try{
              final db = await $FloorAppDatabase.databaseBuilder("app_database.db").build();
               return  await  db.getMziziAppVersionDBDao.insertMziziAppVersionResponse(versions);
          }catch(e){
            throw(e);
          }
    }

    Future<List<MziziAppVersion>> getAppVersion() async{
      try{
        final db = await $FloorAppDatabase.databaseBuilder("app_database.db").build();
        return await db.getMziziAppVersionDBDao.getMziziAppVersionResponse();
      }catch(e){
        throw(e); 
      }
    }


    Future<int> deleteAppVersion(List<MziziAppVersion> versions) async{
        try{
            final db = await $FloorAppDatabase.databaseBuilder("app_database.db").build();
            return db.getMziziAppVersionDBDao.deleteMziziAppVersionResponse(versions);
        }catch(e){
          throw(e);
        }
    }

  }