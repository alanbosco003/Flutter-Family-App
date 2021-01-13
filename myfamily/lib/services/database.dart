import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myfamily/models/brew.dart';
import 'package:myfamily/models/number.dart';
import 'package:myfamily/models/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  // collection reference
  final CollectionReference brewCollection =
      Firestore.instance.collection('users');
  Future updateUserData(String sugars, String name, int strength) async {
    return await brewCollection.document(uid).setData({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }

// my costum data retrivel
  Stream<List<Numbers>> get users {
    return brewCollection.snapshots().map(_numberlistFromSnapshot);
  }

//my custom deai
  Stream<UserData> get details {
    return brewCollection
        .document(uid)
        .snapshots()
        .map(_personaldetailsFromSnapshot);
  }

  // custom list
  List<Numbers> _numberlistFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Numbers(
          name: doc.data['name'] ?? "", phone: doc.data['phone'] ?? "");
    }).toList();
  }

// my custom data retrival
  UserData _personaldetailsFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
        uid: uid,
        name: snapshot.data['name'] ?? "",
        phone: snapshot.data['phone'] ?? "",
        email: snapshot.data['phone'] ?? "",
        gender: snapshot.data['phone'] ?? "",
        dob: snapshot.data['phone'] ?? "");
  }

//brew list from snapshot
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Brew(
          name: doc.data['name'] ?? '',
          strength: doc.data['strength'] ?? 0,
          sugars: doc.data['sugars'] ?? '0');
    }).toList();
  }

  // userdata from snalshot
  UserData _userDattaFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot.data['name'],
      phone: snapshot.data['phone'],
      email: snapshot.data['email'],
      gender: snapshot.data['gender'],
      dob: snapshot.data['dob'],
    );
  }

  Stream<List<Brew>> get brews {
    return brewCollection.snapshots().map(_brewListFromSnapshot);
  }

// get user doc
  Stream<UserData> get userdata {
    return brewCollection.document(uid).snapshots().map(_userDattaFromSnapshot);
  }
}
