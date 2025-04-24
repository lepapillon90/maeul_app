import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:maeul_app/ui/pages/auth/join/widgets/join_form.dart';
import 'package:maeul_app/ui/pages/auth/join/widgets/join_submit_button.dart';
import 'package:maeul_app/ui/pages/auth/join/widgets/password_rules_helper.dart';
import 'package:maeul_app/ui/pages/auth/join/widgets/terms_agreement_box.dart';
import 'package:maeul_app/ui/pages/auth/join/logic/join_controller.dart';
import 'package:maeul_app/ui/pages/auth/join/logic/join_validator.dart';
import 'package:maeul_app/ui/pages/auth/join/services/join_service.dart';

class JoinPage extends StatelessWidget {
  const JoinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => JoinController(),
      child: Consumer<JoinController>(
        builder: (context, controller, _) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('회원가입'),
              backgroundColor: const Color(0xFFFAF3E0),
              elevation: 0,
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  JoinForm(),
                  const PasswordRulesHelper(),
                  TermsAgreementBox(
                    initialValue: controller.agreedToTerms,
                    onChanged: controller.setAgreedToTerms,
                  ),
                  JoinSubmitButton(
                    onPressed: () async {
                      final name = controller.nameController.text.trim();
                      final email = controller.emailController.text.trim();
                      final password = controller.passwordController.text;

                      final nameError = JoinValidator.validateName(name);
                      final emailError = JoinValidator.validateEmail(email);
                      final passwordError = JoinValidator.validatePassword(password);

                      if ([nameError, emailError, passwordError].any((e) => e != null)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(nameError ?? emailError ?? passwordError!)),
                        );
                        return;
                      }

                      if (!controller.agreedToTerms) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('약관에 동의해주세요.')),
                        );
                        return;
                      }

                      try {
                        controller.setLoading(true);
                        final success = await JoinService().registerUser(
                          name: name,
                          email: email,
                          password: password,
                        );
                        controller.setLoading(false);

                        if (success) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('가입이 완료되었습니다!')),
                          );
                          Navigator.pop(context);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('가입에 실패했습니다. 다시 시도해주세요.')),
                          );
                        }
                      } catch (e) {
                        controller.setLoading(false);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('알 수 없는 오류가 발생했습니다: $e')),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}