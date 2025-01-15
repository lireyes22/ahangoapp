
class TradeModel {
  final String id;
  final String name;
  final String type;
  final int valoration;
  final List<String> images;

  TradeModel({required this.id, required this.name, required this.type, required this.valoration, required this.images});

  
  get getName => name;
  get getType => type;
  get getValoration => valoration;
  get getImages => images;

}

//displayName: Los Mapachitos,
// email: litecmapachitos@gmail.com,
// phoneNumber: null, photoURL: https://lh3.googleusercontent.com/a/ACg8ocLV26vqFEKHAbdZL-gL2TwW7kYZQ4jcHlY9vQ9fVz_bhuf5bA=s96-c, providerId: google.com, uid: 101101960259349126300