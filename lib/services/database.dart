import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods{
  getUserByUsername(String username) async{
    return await  Firestore.instance.collection("users")
        .where("name", isEqualTo: username)
        .getDocuments();

  }

  getUserByUserEmail(String userEmail) async{
    return await  Firestore.instance.collection("users")
        .where("email", isEqualTo: userEmail)
        .getDocuments();

  }


  // ignore: non_constant_identifier_names
  uploadUserInfo(UserMap){
    Firestore.instance.collection("users")
        .add(UserMap).catchError((e){
          print(e.toString());
    });

  }

  createChatRoom(String chatRoomId, chatRoomMap){
    Firestore.instance.collection("ChatRoom")
        .document(chatRoomId).setData(chatRoomMap).catchError((e){
          print(e.toString());
    });
  }
  addConversationMessages(String chatRoomId, messageMap){
    Firestore.instance.collection("ChatRoom")
        .document(chatRoomId)
        .collection("chats")
        .add(messageMap).catchError((e){print(e.toString());});
  }
  getConversationMessages(String chatRoomId) async{
    return await Firestore.instance.collection("ChatRoom")
        .document(chatRoomId)
        .collection("chats")
        .snapshots();
  }
}