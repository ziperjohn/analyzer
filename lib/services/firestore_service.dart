// ignore: implementation_imports
import 'package:rxdart/src/transformers/switch_map.dart';
import 'package:analyzer_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:analyzer_app/models/models.dart';
import 'package:analyzer_app/services/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class FirestoreService {
  final CollectionReference _analyzerCollection = FirebaseFirestore.instance.collection("analyzers");

  Stream<List<AnalyzerModel>> analyzerListStream() {
    // Listen user stream if user is sign in and get user UID
    return AuthService().userStream.switchMap((user) {
      if (user != null) {
        // Get user document from firestore
        return _analyzerCollection.doc(user.uid).snapshots().map((doc) {
          List<AnalyzerModel> analyzerList = [];

          // Get documnet data as map and get value for key userAnalyzers as List of dynamic, if doc.data not equal to null
          if (doc.data() != null) {
            var data = doc.data() as Map;
            var userAnalyzers = data["userAnalyzers"] as List<dynamic>;

            // Looping userAnalyzers list and create Analyzer object, then add object to list
            if (userAnalyzers.isNotEmpty) {
              for (var item in userAnalyzers) {
                analyzerList.add(AnalyzerModel.fromJson(item));
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

  Future<void> updateAnalyzer(BuildContext context, String id, String name, String place, String ipAddress,
      String port, String key) async {
    var user = AuthService().user!;

    var doc = await _analyzerCollection.doc(user.uid).get();
    var data = doc.data() as Map;
    var userAnalyzers = data["userAnalyzers"] as List<dynamic>;

    for (var item in userAnalyzers) {
      if (item["id"] == id) {
        item["id"] = id;
        item["name"] = name;
        item["place"] = place;
        item["ipAddress"] = ipAddress;
        item["port"] = port;
        item["key"] = key;
      }
    }
    try {
      await _analyzerCollection.doc(user.uid).set({"userAnalyzers": userAnalyzers}, SetOptions(merge: false));
      showFlushbar(context, "changes_saved", false);
    } catch (error) {
      showFlushbar(context, "changes_not_saved", true);
    }
  }

  Future<void> addAnalyzer(String name) async {
    Map data = {"id": const Uuid().v4(), "name": name, "place": "", "ipAddress": "", "port": "", "key": ""};

    var user = AuthService().user!;

    _analyzerCollection.doc(user.uid).set({
      "userAnalyzers": FieldValue.arrayUnion([data])
    }, SetOptions(merge: true));
  }

  Future<void> deleteAnalyzer(
      String id, String name, String place, String ipAddress, String port, String key) async {
    Map data = {"id": id, "name": name, "place": place, "ipAddress": ipAddress, "port": port, "key": key};

    var user = AuthService().user!;

    _analyzerCollection.doc(user.uid).update({
      "userAnalyzers": FieldValue.arrayRemove([data])
    });
  }
}
