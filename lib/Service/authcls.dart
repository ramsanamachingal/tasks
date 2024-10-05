import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
   FirebaseAuth auth=FirebaseAuth.instance;
  Future<User?>signupWithEmailAndPassword(String email,String Password)async{
    print('.............................................................');
try{

   UserCredential credential=await auth.createUserWithEmailAndPassword(email: email, password: Password);
  print(';;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;');
  print(credential.user);
return credential.user;
}
on FirebaseAuthException catch(e){
  if(e.code=='email-already-in-use'){
    print("email already in use");
  }
  else{
    print("some error occure ${e.code}");
  }
}
return null;
  }
   Future<User?>signinWithEmailAndPassword(String email,String Password)async{
try{
  UserCredential credential=await auth.signInWithEmailAndPassword(email: email, password: Password);
return credential.user;
}
on FirebaseAuthException catch(e){
  if(e.code=='user-not-found'||e.code=='wrong-password'){
    print("incorrect email and password");
  }
  else{
    print("some error occure");
  }
}
return null;
  }
 }