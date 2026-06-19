
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  AuthService._();

  static final AuthService instance = AuthService._();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  User? get currentUser => _auth.currentUser;

  Future<void> signUp({
    required String fullName,
    required String email,
    required String password,
  }) async {
    try {
      final credential =
          await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );

      await _createUserIfNotExists(
        uid: credential.user!.uid,
        fullName: fullName,
        email: email,
        photoUrl: '',
      );
    } on FirebaseAuthException catch (e) {
      throw e.message ?? 'Royxatdan otishda xatolik';
    } catch (e) {
      throw e.toString();
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
      throw e.toString();
    }
  }


  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser =
          await _googleSignIn.signIn();

      if (googleUser == null) {
        throw 'Google login bekor qilindi';
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential =
          await _auth.signInWithCredential(credential);

      final user = userCredential.user;

      if (user == null) {
        throw 'Foydalanuvchi topilmadi';
      }

      await _createUserIfNotExists(
        uid: user.uid,
        fullName: user.displayName ?? '',
        email: user.email ?? '',
        photoUrl: user.photoURL ?? '',
      );
    } on FirebaseAuthException catch (e) {
      throw e.message ?? 'Google login xatoligi';
    } catch (e) {
      throw e.toString();
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
      throw e.toString();
    }
  }


  Future<DocumentSnapshot<Map<String, dynamic>>>
      getUserData() async {
    final user = currentUser;

    if (user == null) {
      throw 'Foydalanuvchi topilmadi';
    }

    return await _firestore
        .collection('users')
        .doc(user.uid)
        .get();
  }
  Future<void> logout() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }


  Future<void> _createUserIfNotExists({
    required String uid,
    required String fullName,
    required String email,
    required String photoUrl,
  }) async {
    final doc =
        await _firestore.collection('users').doc(uid).get();

    if (!doc.exists) {
      await _firestore.collection('users').doc(uid).set({
        'uid': uid,
        'fullName': fullName.trim(),
        'email': email.trim(),
        'photoUrl': photoUrl,
        'createdAt': Timestamp.now(),
      });
    }
  }
}

