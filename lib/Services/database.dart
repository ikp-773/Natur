import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:natur/Models/user.dart';
import 'package:natur/Models/user_data.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference userList =
      FirebaseFirestore.instance.collection('users');

  Future updateUserData(
      String name, streetAddress, String state, String postalCode) async {
    await userList.doc(uid).set({
      'name': name,
      'street_address': streetAddress,
      'state': state,
      'postal_code': postalCode
    });
  }

  List<UserDataModel> _userListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return UserDataModel(
          // name: doc.data()['name'] ?? '',
          // streetAddress: doc.data()['street_address'] ?? '',
          // state: doc.data()['state'] ?? '',
          // postalCode: doc.data()['postal_code'] ?? '',
          );
    }).toList();
  }

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      // name: snapshot.data()['name'],
      // streetAddress: snapshot.data()['street_address'],
      // state: snapshot.data()['state'],
      // postalCode: snapshot.data()['postal_code'],
    );
  }

  Stream<List<UserDataModel>> get userDetails {
    return userList.snapshots().map(_userListFromSnapshot);
  }

  Stream<UserData> get userData {
    return userList.doc(uid).snapshots().map(_userDataFromSnapshot);
  }
}
