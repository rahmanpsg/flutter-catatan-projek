import 'package:catatan_projek/app/utils/currency_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputForm extends StatelessWidget {
  const InputForm({
    Key? key,
    required this.title,
    required this.hint,
    required this.controller,
    this.isNumber = false,
    this.onTap,
  }) : super(key: key);

  final String title;
  final String hint;
  final TextEditingController controller;
  final bool isNumber;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          constraints: const BoxConstraints(
            minWidth: 90,
            maxWidth: 90,
          ),
          child: Text(
            title,
          ),
        ),
        Expanded(
          child: TextFormField(
            controller: controller,
            textInputAction: TextInputAction.next,
            keyboardType: isNumber ? TextInputType.number : TextInputType.text,
            inputFormatters: [
              if (isNumber) FilteringTextInputFormatter.digitsOnly,
              if (isNumber) CurrencyInputFormat()
            ],
            decoration: InputDecoration(
              hintText: hint,
            ),
            onTap: onTap,
            readOnly: onTap != null,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '$title tidak boleh kosong';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
