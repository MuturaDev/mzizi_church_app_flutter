


import 'package:mzizichurchsystem/mzizi_church_system/database/app_database.dart';
import 'package:mzizichurchsystem/mzizi_church_system/models/response_models/portal_recent_transaction_response.dart';

class PortalRecentTransactionDAO{
  
  PortalRecentTransactionDAO();

  Future<List<int>> insertPortalRecentTransactionDAO(List<PortalRecentTransaction> insert)async{
    try{
      final db = await $FloorAppDatabase.databaseBuilder("app_database.db").build();
      return await db.getPortalRecentTransactionsDBDao.insertPortalRecentTransactions(insert);
    }catch(e){
      throw(e);
    }
  }


  Future<List<PortalRecentTransaction>> getPortalRecentTransactions()async{
    try{
        final db = await $FloorAppDatabase.databaseBuilder("app_database.db").build();
        return await db.getPortalRecentTransactionsDBDao.getPortalRecentTransactions();
    }catch(e){
      throw(e);
    }
  }

  Future<void> deletePortalRecentTransactions()async{
      try{
          final db = await $FloorAppDatabase.databaseBuilder("app_database.db").build();
          return await db.getPortalRecentTransactionsDBDao.deletePortalRecentTransactions();
      }catch(e){
        throw(e);
      }
  }
}