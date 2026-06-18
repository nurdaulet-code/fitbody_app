import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? get currentUser => _auth.currentUser;

  Future<void> signUp({
    required String fullName,
    required String email,
    required String password,
  }) async {
    try {
      UserCredential credential =
          await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );

      await _firestore
          .collection('users')
          .doc(credential.user!.uid)
          .set({
        'uid': credential.user!.uid,
        'fullName': fullName.trim(),
        'email': email.trim(),
        'createdAt': Timestamp.now(),
      });
    } on FirebaseAuthException catch (e) {
      throw e.message ?? 'Royxatdan otishda xatolik';
    } catch (e) {
      throw 'Nomalum xatolik: $e';
    }
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw e.message ?? 'Login xatoligi';
    } catch (e) {
      throw 'Nomalum xatolik: $e';
    }
  }

  Future<void> forgotPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(
        email: email.trim(),
      );
    } on FirebaseAuthException catch (e) {
      throw e.message ?? 'Email yuborishda xatolik';
    } catch (e) {
      throw 'Nomalum xatolik: $e';
    }
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserData() async {
    final user = _auth.currentUser;

    if (user == null) {
      throw 'Foydalanuvchi topilmadi';
    }

    return await _firestore
        .collection('users')
        .doc(user.uid)
        .get();
  }

  Future<void> logout() async {
    await _auth.signOut();
  }
}