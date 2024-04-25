// ignore: camel_case_tstatypes
// ignore_for_file: non_constant_identifier_names
// ignore: camel_case_types
import 'package:flutter_dotenv/flutter_dotenv.dart';

class userCredentials{
  static dynamic _user;
  static dynamic _pass;
  static dynamic _user_type;
  static final dynamic _key = dotenv.env['key'];
  static String IP = '172.17.5.65';
  
  static void set_user(dynamic newuser){ 
    _user = newuser;
  }

  static void set_pass(dynamic newpass){
    _pass = newpass;
  }

  static dynamic get_user(){ 
    return _user; 
  } 

  static dynamic get_pass(){ 
    return _pass;
  }

   static void set_user_type(dynamic user_type){
    _user_type = user_type;
  }

  static dynamic get_user_type(){ 
    return _user_type; 
  } 

  static dynamic get_key(){
    return _key;
  }
}
