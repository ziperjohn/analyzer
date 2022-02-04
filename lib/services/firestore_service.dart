import 'package:analyzer_app/models/analyzer_model.dart';
import 'package:analyzer_app/services/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/src/transformers/switch_map.dart';

class FirestoreService {
  final CollectionReference analyzerCollection =
      FirebaseFirestore.instance.collection("analyzers");

  List<Analyzer> analyzerListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Analyzer(name: doc.get("name"));
    }).toList();
  }

  Stream<List<Analyzer>> get analyzers {
    return analyzerCollection.snapshots().map(analyzerListFromSnapshot);
  }
}
