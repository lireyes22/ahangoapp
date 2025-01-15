
class UserModel {
  final String uid;
  final String email;
  final String name;
  final String phoneNumber;
  final String photoURL;
  final String tokenId;

  UserModel({required this.uid, required this.email, required this.name, required this.phoneNumber, required this.photoURL, required this.tokenId});

  Map<String, dynamic> getUser () {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'phoneNumber': phoneNumber,
      'photoURL': photoURL,
      'tokenId': tokenId
    };
  }
  get getUid => uid;
  get getEmail => email;
  get getName => name;
  get getPhoneNumber => phoneNumber;
  get getPhotoURL => photoURL;
  get getTokenId => tokenId;
}

//displayName: Los Mapachitos,
// email: litecmapachitos@gmail.com,
// phoneNumber: null, photoURL: https://lh3.googleusercontent.com/a/ACg8ocLV26vqFEKHAbdZL-gL2TwW7kYZQ4jcHlY9vQ9fVz_bhuf5bA=s96-c, providerId: google.com, uid: 101101960259349126300