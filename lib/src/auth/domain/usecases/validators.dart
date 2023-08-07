//Auth helper class for helping auth modeule
///validations funtions
class AuthHelpers {
//emial validation funtion
  bool isEmailFn(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = RegExp(p);

    return regExp.hasMatch(em);
  }

  ///confirm password funtion
  bool confirmPassword(String p1, String p2) {
    if (p1 == p2) {
      return true;
    } else {
      return false;
    }
  }

  ///is password validation funtion
  bool isPasswordFn(String em) {
    String p = r'^().{5,}$';

    RegExp regExp = RegExp(p);

    return regExp.hasMatch(em);
  }
}
