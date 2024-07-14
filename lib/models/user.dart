import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String email;
  final String uid;
  final String avatarUrl;
  final String username;
  final String bio;
  final List followers;
  final List followings;

  const User(
      {required this.username,
      required this.uid,
      required this.avatarUrl,
      required this.email,
      required this.bio,
      required this.followers,
      required this.followings});

  Map<String, dynamic> toJson() => {
        "username": username,
        "uid": uid,
        "email": email,
        "avatarUrl": avatarUrl,
        "bio": bio,
        "followers": followers,
        "followings": followings,
      };

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
      username: snapshot["username"],
      uid: snapshot["uid"],
      email: snapshot["email"],
      avatarUrl: snapshot["avatarUrl"],
      bio: snapshot["bio"],
      followers: snapshot["followers"],
      followings: snapshot["followings"],
    );
  }
}
