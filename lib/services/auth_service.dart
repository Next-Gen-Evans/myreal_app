import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

ValueNotifier<AuthService> authservice = ValueNotifier(AuthService());

class AuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => firebaseAuth.currentUser;

  Stream<User?> get authstatechanges => firebaseAuth.authStateChanges();

  String? get username => null;

  Future<UserCredential> signIn({
    required String email,
    required String password,
  }) async {
    return await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<UserCredential> createAccount({
    required String email,
    required String password,
  }) async {
    return await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  Future<void> resetPassword({required String email}) async {
    await firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<void> updateUsername({required String password}) async {
    await currentUser!.updateDisplayName(username);
  }
}

Future<void> deleteAccount({
  required String email,
  required String password,
}) async {
  AuthCredential credential = EmailAuthProvider.credential(
    email: email,
    password: password,
  );
  var currentUser;
  await currentUser!.reauthenticateWithCredential(credential);
  await currentUser!.delete();
  await FirebaseAuth.instance.signOut();
}

Future<void> resetPasswordFromCurrentpassword({
  required String currentpassword,
  required String newpassword,
  required String email,
}) async {
  AuthCredential credential = EmailAuthProvider.credential(
    email: email,
    password: currentpassword,
  );
  var currentUser;
  await currentUser!.reauthenticateWithCredential(credential);
  await currentUser!.updatePassword(newpassword);
}
