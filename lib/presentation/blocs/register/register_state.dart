part of 'register_cubit.dart';

enum FormStatus { invalid, valid, validating, posting }

class RegisterFormState extends Equatable {
  final FormStatus formStatus;
  final bool isValid;
  final UserName username;
  final Email email;
  final Password password;

  const RegisterFormState({
      this.formStatus = FormStatus.invalid,
      this.isValid = false,
      this.username = const UserName.pure(),
      this.email = const Email.pure(),
      this.password = const Password.pure()
    });

  // CopyWith nos permite crear una nueva instancia de RegisterFormState con los valores que queramos cambiar
  RegisterFormState copyWith({
    FormStatus? formStatus,
    bool? isValid,
    UserName? username,
    Email? email,
    Password? password,
  }) =>
      RegisterFormState(
          formStatus: formStatus ?? this.formStatus,
          isValid: isValid ?? this.isValid,
          username: username ?? this.username,
          email: email ?? this.email,
          password: password ?? this.password);

  @override
  List<Object> get props => [formStatus, isValid, username, email, password];
}
