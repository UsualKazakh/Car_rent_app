import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> register({
    required String name,
    required String lastName,
    required String email,
    required String phone,
    required String password,
  }) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await FirebaseFirestore.instance
          .collection('users')
          .doc(result.user!.uid)
          .set({
        'name': name,
        'lastName': lastName,
        'email': email,
        'phone': phone,
      });

      return result.user;
    } catch (e) {
      print('Регистрация ошибка: $e');
      return null;
    }
  }

  Future<User?> login(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } catch (e) {
      print('Вход ошибка: $e');
      return null;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
