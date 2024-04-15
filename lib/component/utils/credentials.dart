// ignore: camel_case_tstatypes
// ignore_for_file: non_constant_identifier_names

// ignore: camel_case_types
class userCredentials{
  static dynamic _user;
  static dynamic _pass;
  
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
}
