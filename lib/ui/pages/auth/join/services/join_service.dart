class JoinService {
  Future<bool> registerUser({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      await Future.delayed(const Duration(seconds: 2)); // simulate network delay

      // Simulate success
      return true;
    } catch (e) {
      print('회원가입 중 오류 발생: $e');
      return false;
    }
  }
}