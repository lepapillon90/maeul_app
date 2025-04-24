class JoinValidator {
  static String? validateName(String name) {
    if (name.trim().isEmpty) {
      return '이름을 입력해주세요.';
    }
    return null;
  }

  static String? validateEmail(String email) {
    if (email.trim().isEmpty) {
      return '이메일을 입력해주세요.';
    }
    if (!RegExp(r'^[\w\.-]+@[\w\.-]+\.\w{2,4}$').hasMatch(email)) {
      return '유효한 이메일 주소를 입력해주세요.';
    }
    return null;
  }

  static String? validatePassword(String password) {
    if (password.length < 8) {
      return '비밀번호는 최소 8자 이상이어야 합니다.';
    }
    if (!RegExp(r'(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[\W_])').hasMatch(password)) {
      return '영문 대소문자, 숫자, 특수문자를 모두 포함해야 합니다.';
    }
    return null;
  }
}
