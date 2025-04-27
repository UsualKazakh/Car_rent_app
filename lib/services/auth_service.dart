import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Get current user
  User? get currentUser => _auth.currentUser;

  // Sign up
  Future<UserCredential> signUp({
    required String email,
    required String password,
    required String name,
    required String lastName,
    required String phone,
  }) async {
    try {
      // Create user with email and password
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Save additional user info to Firestore
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'name': name,
        'lastName': lastName,
        'email': email,
        'phone': phone,
        'createdAt': FieldValue.serverTimestamp(),
      });

      return userCredential;
    } catch (e) {
      rethrow;
    }
  }

  // Sign in
  Future<UserCredential> signIn({
    required String email,
    required String password,
  }) async {
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      rethrow;
    }
  }

  // Sign out
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Get user data
  Future<Map<String, dynamic>?> getUserData() async {
    try {
      if (currentUser != null) {
        DocumentSnapshot doc = await _firestore
            .collection('users')
            .doc(currentUser!.uid)
            .get();
        return doc.data() as Map<String, dynamic>?;
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }

  // Update user data
  Future<void> updateUserData(Map<String, dynamic> data) async {
    try {
      if (currentUser != null) {
        await _firestore
            .collection('users')
            .doc(currentUser!.uid)
            .update(data);
      }
    } catch (e) {
      rethrow;
    }
  }
}
