

import 'package:mzizichurchsystem/mzizi_church_system/database/app_database.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_fee_transaction_response_model.dart';

class PortalDetailedTransactionDAO{

  PortalDetailedTransactionDAO();



  Future<List<int>> insertPortalDetailedTransaction(List<PortalDetailedTransaction> insert) async{
          try{
              final db = await $FloorAppDatabase.databaseBuilder("app_database.db").build();
               return  await  db.getPortalDetailedTransactionDBDao.insertPortalDetailedTransactionResponse(insert);
          }catch(e){
            throw(e);
          }
    }

    Future<List<PortalDetailedTransaction>> getPortalDetailedTransaction() async{
      try{
        final db = await $FloorAppDatabase.databaseBuilder("app_database.db").build();
        return await db.getPortalDetailedTransactionDBDao.getPortalDetailedTransaction();
      }catch(e){
        throw(e); 
      }
    }


    Future<int> deletePortalDetailedTransaction(List<PortalDetailedTransaction> delete) async{
        try{
            final db = await $FloorAppDatabase.databaseBuilder("app_database.db").build();
            return db.getPortalDetailedTransactionDBDao.deletePortalDetailedTransactionResponse(delete);
        }catch(e){
          throw(e);
        }
    }


}