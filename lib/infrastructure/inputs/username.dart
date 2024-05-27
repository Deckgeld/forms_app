import 'package:formz/formz.dart';

// Define input validation errors
enum UsernameError { empty, lenght }

// Extend FormzInput and provide the input type and error type.
class UserName extends FormzInput<String, UsernameError> {
  // Call super.pure to represent an unmodified form input.
  // valor inicial del campo
  const UserName.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  // Dirty es llama cuando el campo ha sido modificado
  const UserName.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;

    if ( displayError == UsernameError.empty) return 'El nombre de usuario es requerido';
    if ( displayError == UsernameError.lenght) return 'El nombre de usuario debe tener al menos 6 caracteres';
    
    return null;
  }

  // Override validator to handle validating a given input value.
  // serie de validaciones del campo
  @override
  UsernameError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return UsernameError.empty;
    if (value.length < 6) return UsernameError.lenght;
    return null;
  }
}
