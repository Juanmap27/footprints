import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_footprint/widgets/custom_text_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _contactController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _newpassController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isComplete = _nameController.text.isNotEmpty &&
        _phoneController.text.isNotEmpty &&
        _contactController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _passController.text.isNotEmpty &&
        _newpassController.text.isNotEmpty;

    bool hasMatch = _passController.text == _newpassController.text;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  "Crear una cuenta",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.green,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextField(
                  controller: _nameController,
                  text: "Nombre y Apellido",
                  icon: Icons.email,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: _phoneController,
                  text: "Telefono",
                  icon: Icons.email,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: _contactController,
                  text: "Contacto de emergencia",
                  icon: Icons.email,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: _emailController,
                  text: "Email",
                  icon: Icons.email,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: _passController,
                  text: "Contraseña",
                  icon: Icons.password,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: _newpassController,
                  text: "Repetir Contraseña",
                  icon: Icons.password,
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: signUp,
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Text(
                          "Crear",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future signUp() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passController.text.trim(),
    );
  }
}
