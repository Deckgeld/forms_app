import 'package:flutter/material.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('New user'),
        ),
        body: const _RegisterView());
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),

        //Debemos agregar un SingleChildScrollView para que no se desborde la pantalla
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const FlutterLogo(size: 100),
              _RegisterForm(),
              const SizedBox(height: 20),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatefulWidget {

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {

  //Creamos una llave global para el formulario, nos servirá para validar el formulario
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? userName = '';
  String? email = '';
  String? password = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            label: 'Nombre del usuario',
            onchange: (value) => userName = value,
            validator: (value) {
              if (value == null || value.isEmpty) return 'El nombre de usuario es requerido';
              if (value.trim().isEmpty) return 'El nombre de usuario no puede ser solo espacios';
              if (value.length < 6) return 'El nombre de usuario debe tener al menos 6 caracteres';
              return null;
            },
          ),
          SizedBox(height: 10),
          
          CustomTextFormField(
            label: 'Correo electrónico',
            onchange: (value) => email = value,
            validator: (value) {
              if (value == null || value.isEmpty) return 'El nombre de usuario es requerido';
              if (value.trim().isEmpty) return 'El nombre de usuario no puede ser solo espacios';
              
              final emailRegExp = RegExp(
                r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
              );
              if (!emailRegExp.hasMatch(value)) return 'El correo electrónico no es válido';
            },
          ),
          SizedBox(height: 10),

          CustomTextFormField(
            label: 'Correo electrónico',
            obscureText: true,
            onchange: (value) => password = value,
            validator: (value) {
              if (value == null || value.isEmpty) return 'La contraseña es requerida';
              if (value.trim().isEmpty) return 'La contraseña no puede ser solo espacios';
              if (value.length < 6) return 'La contraseña debe tener al menos 6 caracteres';
            },
          ),
          const SizedBox(height: 20),

          FilledButton.tonalIcon(
                onPressed: () {
                  //Si el formulario no es válido, no hacemos nada
                  if (!_formKey.currentState!.validate()) return;

                  print('$email, $password, $userName');
                }, 
                icon: const Icon( Icons.save ), 
                label: const Text('Save')
              ),
        ],
      )
    );
  }
}
