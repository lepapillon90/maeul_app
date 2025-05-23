import 'package:flutter/material.dart';
import 'package:maeul_app/ui/pages/auth/join/logic/join_controller.dart';
import 'package:provider/provider.dart';

class JoinForm extends StatefulWidget {
  const JoinForm({super.key});

  @override
  State<JoinForm> createState() => _JoinFormState();
}

class _JoinFormState extends State<JoinForm> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final controller = context.read<JoinController>();
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: controller.nameController,
            decoration: const InputDecoration(
              labelText: '이름',
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
            controller: controller.emailController,
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
        ],
      ),
    );
  }
}