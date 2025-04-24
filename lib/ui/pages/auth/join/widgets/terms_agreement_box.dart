import 'package:flutter/material.dart';

class TermsAgreementBox extends StatefulWidget {
  final bool initialValue;
  final ValueChanged<bool> onChanged;

  const TermsAgreementBox({
    super.key,
    this.initialValue = false,
    required this.onChanged,
  });

  @override
  State<TermsAgreementBox> createState() => _TermsAgreementBoxState();
}

class _TermsAgreementBoxState extends State<TermsAgreementBox> {
  late bool _checked;

  @override
  void initState() {
    super.initState();
    _checked = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Row(
        children: [
          Checkbox(
            value: _checked,
            onChanged: (value) {
              if (value != null) {
                try {
                  setState(() => _checked = value);
                  widget.onChanged(value);
                } catch (e) {
                  debugPrint('TermsAgreementBox onChanged error: $e');
                }
              }
            },
          ),
          const Flexible(
            child: Text(
              '이용약관 및 개인정보처리방침에 동의합니다.',
              style: TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
