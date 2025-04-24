import 'package:flutter/material.dart';
import 'package:maeul_app/ui/pages/auth/login/service/login_service.dart';
import 'package:provider/provider.dart';
import 'package:maeul_app/ui/pages/auth/login/widgets/login_form.dart';
import 'package:maeul_app/ui/pages/auth/login/widgets/login_title.dart';
import 'package:maeul_app/ui/pages/auth/login/widgets/login_submit_button.dart';
import 'package:maeul_app/ui/pages/auth/login/widgets/login_social_buttons.dart';
import 'package:maeul_app/ui/pages/auth/login/logic/login_controller.dart';
import 'package:maeul_app/ui/pages/auth/login/logic/login_validator.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginController(),
      child: Consumer<LoginController>(
        builder: (context, controller, _) {
          return Scaffold(
            appBar: AppBar(automaticallyImplyLeading: false,
              title: const Text('로그인'),
              backgroundColor: const Color(0xFFFAF3E0),
              elevation: 0,
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const LoginTitle(),
                  LoginForm(),
                  LoginSubmitButton(
                    onPressed: () async {
                      final email = controller.emailController.text.trim();
                      final password = controller.passwordController.text;

                      final emailError = LoginValidator.validateEmail(email);
                      final passwordError = LoginValidator.validatePassword(password);

                      if (emailError != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(emailError)),
                        );
                        return;
                      }

                      if (passwordError != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(passwordError)),
                        );
                        return;
                      }

                      try {
                        controller.setLoading(true);
                        final success = await LoginService().login(
                          email: email,
                          password: password,
                        );
                        controller.setLoading(false);

                        if (success) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('로그인 성공!')),
                          );
                          Navigator.pushReplacementNamed(context, '/home');
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('로그인 실패! 이메일과 비밀번호를 확인해주세요.')),
                          );
                        }
                      } catch (e, stackTrace) {
                        controller.setLoading(false);
                        debugPrint('로그인 중 예외 발생: $e');
                        debugPrintStack(stackTrace: stackTrace);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('알 수 없는 오류가 발생했습니다. 나중에 다시 시도해주세요.')),
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 4),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/join');
                      },
                      child: const Text(
                        '아직 계정이 없으신가요? 회원가입',
                        style: TextStyle(
                          color: Colors.brown,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Divider(
                    height: 1,
                    thickness: 1,
                    indent: 24,
                    endIndent: 24,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 16),
                  const LoginSocialButtons(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}