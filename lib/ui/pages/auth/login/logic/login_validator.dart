class LoginValidator {
  static String? validateEmail(String email) {
    try {
      if (email.trim().isEmpty) {
        return '이메일을 입력해주세요.';
      }
      if (!RegExp(r'^[\w\.-]+@[\w\.-]+\.\w{2,4}$').hasMatch(email)) {
        return '유효한 이메일 주소를 입력해주세요.';
      }
      return null;
    } catch (e) {
      return '이메일 검증 중 오류가 발생했습니다.';
    }
  }

  static String? validatePassword(String password) {
    try {
      if (password.isEmpty) {
        return '비밀번호를 입력해주세요.';
      }
      if (password.length < 6) {
        return '비밀번호는 최소 6자 이상이어야 합니다.';
      }
      return null;
    } catch (e) {
      return '비밀번호 검증 중 오류가 발생했습니다.';
    }
  }
}