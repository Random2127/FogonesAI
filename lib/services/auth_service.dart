import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

/// Email/password and Google auth via Firebase. Errors are returned as user-facing strings.
/// Returns `null` on success, `''` when the user cancels (no snackbar), else an error message.
class AuthService {
  AuthService(this._auth);

  final FirebaseAuth _auth;

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  User? get currentUser => _auth.currentUser;

  Future<String?> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      return _messageForCode(e);
    } catch (e) {
      return e.toString();
    }
  }

  Future<String?> registerWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      return _messageForCode(e);
    } catch (e) {
      return e.toString();
    }
  }

  Future<String?> sendPasswordResetEmail(String email) async {
    final trimmed = email.trim();
    if (trimmed.isEmpty) {
      return 'Introduce tu correo.';
    }
    try {
      await _auth.sendPasswordResetEmail(email: trimmed);
      return null;
    } on FirebaseAuthException catch (e) {
      return _messageForCode(e);
    } catch (e) {
      return e.toString();
    }
  }

  Future<String?> signInWithGoogle() async {
    try {
      final account = await GoogleSignIn.instance.authenticate();
      final idToken = account.authentication.idToken;
      if (idToken == null || idToken.isEmpty) {
        return 'No se pudo obtener el identificador de Google. Revisa la configuración del proyecto.';
      }
      final credential = GoogleAuthProvider.credential(idToken: idToken);
      await _auth.signInWithCredential(credential);
      return null;
    } on GoogleSignInException catch (e) {
      if (e.code == GoogleSignInExceptionCode.canceled) {
        return '';
      }
      return e.description ?? 'Error de Google Sign-In (${e.code.name}).';
    } on FirebaseAuthException catch (e) {
      return _messageForCode(e);
    } catch (e) {
      return e.toString();
    }
  }

  Future<void> signOut() async {
    await GoogleSignIn.instance.signOut();
    await _auth.signOut();
  }

  String _messageForCode(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        return 'El correo no es válido.';
      case 'user-disabled':
        return 'Esta cuenta está deshabilitada.';
      case 'user-not-found':
      case 'wrong-password':
      case 'invalid-credential':
        return 'Correo o contraseña incorrectos.';
      case 'email-already-in-use':
        return 'Ese correo ya está registrado.';
      case 'weak-password':
        return 'La contraseña es demasiado débil (mín. 6 caracteres).';
      case 'account-exists-with-different-credential':
        return 'Ese correo ya está registrado con otro método de acceso.';
      case 'network-request-failed':
        return 'Error de red. Comprueba la conexión.';
      case 'too-many-requests':
        return 'Demasiados intentos. Prueba más tarde.';
      default:
        return e.message ?? 'Error de autenticación (${e.code}).';
    }
  }
}
