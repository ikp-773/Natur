class UserModel {
  final String uid;
  UserModel({this.uid});
}

class UserData {
  final String uid;
  final String name;
  final String streetAddress;
  final String state;
  final String postalCode;

  UserData(
      {this.uid, this.name, this.streetAddress, this.state, this.postalCode});
}
