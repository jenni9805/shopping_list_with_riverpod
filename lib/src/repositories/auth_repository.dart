import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_shopping_list/src/general_providers.dart';
import 'package:flutter_riverpod_shopping_list/src/repositories/custom_exception.dart';

//Abstract class crated for access methods of Firebase
abstract class BaseAuthRepository{
  Stream<User?> get authStateChanges;
  Future<void> singInAnonymously();
  User? getCurrentUSer();
  Future<void> singOut();
}

//Provider created for read Firebase response
final authRepositoryProvider = Provider((ref) => AuthRepository(ref.read));

class AuthRepository implements BaseAuthRepository{
  final Reader _read;

  const AuthRepository(this._read);

  @override
  Stream<User?> get authStateChanges => _read(firebaseAuthProvider).authStateChanges();

  @override
  Future<void> singInAnonymously() async {
    try{
      await _read(firebaseAuthProvider).signInAnonymously();
    } on FirebaseAuthException catch(e){
      throw CustomException(message: e.message);
    }
  }

  @override
  User? getCurrentUSer() {
    try{
      return _read(firebaseAuthProvider).currentUser;
    } on FirebaseAuthException catch(e){
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<void> singOut() async{
    try{
      await _read(firebaseAuthProvider).signOut();
      await singInAnonymously();
    }on FirebaseAuthException catch(e){
      throw CustomException(message: e.message);
    }
  }

}