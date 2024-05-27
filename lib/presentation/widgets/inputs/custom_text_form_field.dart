import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? errorMessage;
  final Function(String)? onchange;
  final String? Function(String?)? validator;
  final bool? obscureText;


  const CustomTextFormField({
    super.key, 
    this.label, 
    this.hint, 
    this.errorMessage, 
    this.onchange, 
    this.validator, 
    this.obscureText
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final border = OutlineInputBorder(

      borderRadius: BorderRadius.circular(40),
    );

    return TextFormField(
      onChanged: onchange,
      validator: validator,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        //propiedades inputs normal
        border: border,
        focusedBorder: border.copyWith( borderSide: BorderSide(color: colors.primary)),
        
        //error
        errorBorder: border.copyWith( borderSide: BorderSide(color: colors.error)),
        focusedErrorBorder: border.copyWith( borderSide: BorderSide(color: colors.error)),


        //isDense hace que el input sea más pequeño
        isDense: true,
        label: label != null ? Text(label!) : null,
        hintText: hint,
        errorText: errorMessage,
        focusColor: colors.primary,
      ),
    );
  }
}
