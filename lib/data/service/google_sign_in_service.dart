import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInService {
  static final GoogleSignIn _googleSignIn = GoogleSignIn(
    clientId: '1055642717944-r8beof807q0o474vtqbgv8l621iepnph.apps.googleusercontent.com',
    scopes: ['email', 'profile', 'openid'],
  );

  static Future<String?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return null;
      }
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      print(googleAuth.idToken);
      print(googleAuth.accessToken);
      return googleAuth.accessToken;
    } catch (error) {
      print('Google Sign In Error: $error');
      return null;
    }
  }
}
