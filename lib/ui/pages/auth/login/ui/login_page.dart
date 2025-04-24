import 'package:flutter/material.dart';
import 'package:maeul_app/ui/pages/auth/login/service/login_service.dart';
import 'package:provider/provider.dart';
import 'package:maeul_app/ui/pages/auth/login/widgets/login_form.dart';
import 'package:maeul_app/ui/pages/auth/login/widgets/login_title.dart';
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
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: const Color(0xFFFAF3E0),
              elevation: 0,
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const LoginTitle(),
                  LoginForm(),
                  const SizedBox(height: 4),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/join');
                      },
                      child: const Text(
                        '아직 계정이 없으신가요? 회원가입',
                        style: TextStyle(color: Colors.brown, fontSize: 14),
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
