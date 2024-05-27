import 'package:formz/formz.dart';

// Define input validation errors
enum PasswordError { empty, lenght }

// Extend FormzInput and provide the input type and error type.
class Password extends FormzInput<String, PasswordError> {
  // Call super.pure to represent an unmodified form input.
  // valor inicial del campo
  const Password.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  // Dirty es llama cuando el campo ha sido modificado
  const Password.dirty( String value ) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;

    if ( displayError == PasswordError.empty) return 'La contraseña es requerida';
    if ( displayError == PasswordError.lenght) return 'La contraseña debe tener al menos 6 caracteres';
    
    return null;
  }

  // Override validator to handle validating a given input value.
  // serie de validaciones del campo
  @override
  PasswordError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return PasswordError.empty;
    if (value.length < 6) return PasswordError.lenght;
    return null;

  }
}