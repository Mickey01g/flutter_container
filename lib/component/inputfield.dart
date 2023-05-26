import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  const InputTextField({Key? key,
  required this.myController,
    required this.focusNode,
    required this.onFieldSubmitValue,
    required this.keyBoradType,
    required this.obscureText,
    required this.hint,this.enable=true,
    required this.onValidator,this.autoFocus=false
  }) : super(key: key);

  final TextEditingController myController;
  final FocusNode focusNode;
  final FormFieldSetter onFieldSubmitValue;
  final FormFieldValidator onValidator;
  final TextInputType keyBoradType;
  final String hint;
  final bool obscureText;
  final bool enable,autoFocus;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: TextFormField(
        controller: myController,
        focusNode: focusNode,
        obscureText: obscureText,
        onFieldSubmitted: onFieldSubmitValue,
        validator: onValidator,
        keyboardType: keyBoradType,
        style: Theme.of(context).textTheme.titleMedium,
        decoration: InputDecoration(
          hintText: hint,
          enabled: enable,
          contentPadding: const EdgeInsets.symmetric(vertical: 20,horizontal:10),
          hintStyle: Theme.of(context).textTheme.titleMedium,
          border: const UnderlineInputBorder(
            borderSide: BorderSide(color:Colors.black54),
            borderRadius: BorderRadius.all(Radius.circular(8))
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.green.shade300),
            borderRadius: const BorderRadius.all(Radius.circular(8))
          ),
            errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red.shade300),
                borderRadius: const BorderRadius.all(Radius.circular(8))
            ),
            enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black54),
                borderRadius: BorderRadius.all(Radius.circular(8))
            )
        ),

      ),
    );
  }
}

