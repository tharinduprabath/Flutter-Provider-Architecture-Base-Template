import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class FirestoreService {
  Firestore db = Firestore.instance;

  Future<QuerySnapshot> getCollection({@required String collectionPath}) async {
    final ref = db.collection(collectionPath);
    return await ref.getDocuments();
  }

  Future<QuerySnapshot> getCollectionWithCondition(
      {@required String collectionPath,
      @required String conditionField,
      @required String conditionParameter}) async {
    final ref = db
        .collection(collectionPath)
        .where(conditionField, isEqualTo: conditionParameter);
    return await ref.getDocuments();
  }

  Stream<QuerySnapshot> streamCollection({@required String collectionPath}) {
    final ref = db.collection(collectionPath);
    return ref.snapshots();
  }

  Stream<QuerySnapshot> streamCollectionWithCondition(
      {@required String collectionPath,
      @required String conditionField,
      @required String conditionParameter,
      @required String orderByField}) {
    final ref = db
        .collection(collectionPath)
        .where(conditionField, isEqualTo: conditionParameter)
        .orderBy(orderByField);
    return ref.snapshots();
  }

  Stream<DocumentSnapshot> streamDocument(
      {@required String collectionPath, @required String documentId}) {
    final ref = db.collection(collectionPath);
    return ref.document(documentId).snapshots();
  }

  Future<DocumentSnapshot> getDocumentById(
      {@required String collectionPath, @required String documentId}) async {
    final ref = db.collection(collectionPath);
    return await ref.document(documentId).get();
  }

  Future<void> removeDocument(
      {@required String collectionPath, @required String documentId}) async {
    final ref = db.collection(collectionPath);
    return await ref.document(documentId).delete();
  }

  Future<void> addDocumentWithId(
      {@required String collectionPath,
      @required String documentId,
      @required Map<String, dynamic> data}) async {
    final ref = db.collection(collectionPath);
    return await ref.document(documentId).setData(data);
  }

  Future<void> updateDocument(
      {@required String collectionPath,
      @required String documentId,
      @required Map<String, dynamic> data}) async {
    final ref = db.collection(collectionPath);
    return await ref.document(documentId).updateData(data);
  }
}
