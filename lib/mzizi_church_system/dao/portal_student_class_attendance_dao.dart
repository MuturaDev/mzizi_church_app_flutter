
// class PortalStudentClassAttendanceDAO {
//   PortalStudentClassAttendanceDAO();

//   Future<List<int>> insertPortalStudentClassAttendance(
//       List<PortalStudentClassAttendance> insert) async {
//     try {
//       final db =
//           await $FloorAppDatabase.databaseBuilder("app_database.db").build();
//       return await db.getPortalStudentClassAttendanceDBDao
//           .insertPortalStudentClassAttendanceResponse(insert);
//     } catch (e) {
//       throw (e);
//     }
//   }

//   Future<List<PortalStudentClassAttendance>>
//       getStudentAttendanceForSelectedTermYear(String term, String year) async {
//     try {
//       final db =
//           await $FloorAppDatabase.databaseBuilder("app_database.db").build();
//       return await db.getPortalStudentClassAttendanceDBDao
//           .getPortalStudentClassAttendanceForSelectedTermYear(term, year);
//     } catch (e) {
//       throw (e);
//     }
//   }

//   Future<List<PortalStudentClassAttendance>>
//       getPortalStudentClassAttendance() async {
//     try {
//       final db =
//           await $FloorAppDatabase.databaseBuilder("app_database.db").build();
//       return await db.getPortalStudentClassAttendanceDBDao
//           .getPortalStudentClassAttendanceResponse();
//     } catch (e) {
//       throw (e);
//     }
//   }

//   Future<List<String>> getClassAttendanceYearFor() async {
//     List<String> years = new List();
//     years.add("Select year");
//     try {
//       final db =
//           await $FloorAppDatabase.databaseBuilder("app_database.db").build();
//       List<PortalStudentClassAttendance> list =
//           await db.getPortalStudentClassAttendanceDBDao.getDistictYears();
//       for (PortalStudentClassAttendance att in list) {
//         years.add(att.YearFor);
//       }
//     } catch (e) {
//       throw (e);
//     }

//     return years;
//   }

//   Future<List<String>> getClassAttendanceTermFor() async {
//     List<String> terms = new List();
//     terms.add("Select term");
//     try {
//       final db =
//           await $FloorAppDatabase.databaseBuilder("app_database.db").build();
//       List<PortalStudentClassAttendance> list =
//           await db.getPortalStudentClassAttendanceDBDao.getDistictTerms();
//       for (PortalStudentClassAttendance att in list) {
//         terms.add(att.TermFor);
//       }
//     } catch (e) {
//       throw (e);
//     }
//     return terms;
//   }

//   Future<int> deletePortalStudentClassAttendance(
//       List<PortalStudentClassAttendance> delete) async {
//     try {
//       final db =
//           await $FloorAppDatabase.databaseBuilder("app_database.db").build();
//       return db.getPortalStudentClassAttendanceDBDao
//           .deletePortalStudentClassAttendanceResponse(delete);
//     } catch (e) {
//       throw (e);
//     }
//   }
// }
