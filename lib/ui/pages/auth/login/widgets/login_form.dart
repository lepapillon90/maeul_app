import 'package:flutter/material.dart';
import 'package:maeul_app/ui/pages/auth/login/logic/login_controller.dart';
import 'package:maeul_app/ui/pages/auth/login/logic/login_validator.dart';
import 'package:maeul_app/ui/pages/auth/login/service/login_service.dart';
import 'package:provider/provider.dart';
import 'package:maeul_app/core/widgets/primary_button.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<LoginController>();
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: controller.emailController,
            onChanged: (value) {
              try {
                if (value.length > 100) throw Exception('입력 길이 초과');
              } catch (e) {
                debugPrint('이메일 입력 오류: $e');
              }
            },
            decoration: const InputDecoration(
              labelText: '이메일',
              filled: true,
              fillColor: Color(0xFFFDF6EC),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(color: Color(0xFF4E3E30)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(color: Color(0xFF8FBF67), width: 2.0),
              ),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: controller.passwordController,
            obscureText: _obscurePassword,
            onChanged: (value) {
              try {
                if (value.length > 100) throw Exception('입력 길이 초과');
              } catch (e) {
                debugPrint('비밀번호 입력 오류: $e');
              }
            },
            decoration: InputDecoration(
              labelText: '비밀번호',
              filled: true,
              fillColor: const Color(0xFFFDF6EC),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(color: Color(0xFF4E3E30)),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(color: Color(0xFF8FBF67), width: 2.0),
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              ),
            ),
          ),
          Row(
            children: [
              Checkbox(
                value: controller.autoLogin ?? false,
                onChanged: (value) async {
                  if (value != null) {
                    controller.setAutoLogin(value);
                    await LoginService().setAutoLoginEnabled(value);
                  }
                },
              ),
              GestureDetector(
                onTap: () async {
                  final newValue = !(controller.autoLogin ?? false);
                  controller.setAutoLogin(newValue);
                  await LoginService().setAutoLoginEnabled(newValue);
                },
                child: const Text('자동 로그인'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          PrimaryButton(
            text: '로그인',
            onPressed: () async {
              final email = controller.emailController.text.trim();
              final password = controller.passwordController.text;

              final emailError = LoginValidator.validateEmail(email);
              final passwordError = LoginValidator.validatePassword(password);

              if (emailError != null || passwordError != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(emailError ?? passwordError!)),
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
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(const SnackBar(content: Text('로그인 성공!')));
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
                  const SnackBar(
                    content: Text('알 수 없는 오류가 발생했습니다. 나중에 다시 시도해주세요.'),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
