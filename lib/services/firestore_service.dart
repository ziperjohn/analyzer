// ignore: implementation_imports
import 'package:rxdart/src/transformers/switch_map.dart';
import 'package:analyzer_app/models/analyzer_model.dart';
import 'package:analyzer_app/services/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class FirestoreService {
  final CollectionReference analyzerCollection = FirebaseFirestore.instance.collection("analyzers");

  Stream<List<Analyzer>> analyzerListStream() {
    // Listen user stream if user is sign in and get user UID
    return AuthService().userStream.switchMap((user) {
      if (user != null) {
        // Get user document from firestore
        return analyzerCollection.doc(user.uid).snapshots().map((doc) {
          List<Analyzer> analyzerList = [];

          // Get documnet data as map and get value for key userAnalyzers as List of dynamic, if doc.data not equal to null
          if (doc.data() != null) {
            var data = doc.data() as Map;
            var userAnalyzers = data["userAnalyzers"] as List<dynamic>;

            // Looping userAnalyzers list and create Analyzer object, then add object to list
            if (userAnalyzers.isNotEmpty) {
              for (var item in userAnalyzers) {
                analyzerList.add(Analyzer.fromJson(item));
              }
            }
          }

          return analyzerList;
        });
      } else {
        // If user is not sign in return empty stream
        return const Stream.empty();
      }
    });
  }

  Future<void> addAnalyzer(String name) async {
    Map data = {"id": const Uuid().v4(), "name": name, "place": ""};

    var user = AuthService().user!;

    analyzerCollection.doc(user.uid).set({
      "userAnalyzers": FieldValue.arrayUnion([data])
    }, SetOptions(merge: true));
  }

  Future<void> deleteAnalyzer(String id, String name, String place) async {
    Map data = {"id": id, "name": name, "place": place};

    var user = AuthService().user!;

    analyzerCollection.doc(user.uid).update({
      "userAnalyzers": FieldValue.arrayRemove([data])
    });
  }
}