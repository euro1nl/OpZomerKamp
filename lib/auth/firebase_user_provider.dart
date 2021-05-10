import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class OpZomerKampFirebaseUser {
  OpZomerKampFirebaseUser(this.user);
  final User user;
  bool get loggedIn => user != null;
}

OpZomerKampFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<OpZomerKampFirebaseUser> opZomerKampFirebaseUserStream() => FirebaseAuth
    .instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<OpZomerKampFirebaseUser>(
        (user) => currentUser = OpZomerKampFirebaseUser(user));
