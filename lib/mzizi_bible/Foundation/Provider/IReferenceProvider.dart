
import 'package:mzizichurchsystem/mzizi_bible/Foundation/Models/ChapterReference.dart';

abstract class IReferenceProvider {

  Future<ChapterReference> getReferenceFromId(String referencePath, String referenceId);

  Future init();
}
