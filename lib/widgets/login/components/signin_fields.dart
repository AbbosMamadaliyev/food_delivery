// ignore_for_file: prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/main_screen/main_screen.dart';

class SignInFields extends StatefulWidget {
  const SignInFields({Key? key}) : super(key: key);

  @override
  _SignInFieldsState createState() => _SignInFieldsState();
}

class _SignInFieldsState extends State<SignInFields> {
  //login va password fieldlar yozmoqchi bolib bosilganda true boladi
  bool tapLoginForm = false;
  bool tapPasswordForm = false;

  //toldirish shartlarini
  bool loginVal = false;
  bool passwordVal = false;

  //toldirish shartlari togri bolsa button bosilganda keyingi page ga otish imkonini beradi
  bool loginDone = false;
  bool passwordDone = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
      width: double.infinity,
      child: Stack(
        children: [
          Align(
            child: Image.asset('assets/images/back_in_login.png'),
            alignment: Alignment.centerRight,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 48),
            child: Column(
              children: [
                _buildTextSignin(),
                const SizedBox(height: 36),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      _buildLoginField(),
                      const SizedBox(height: 10),
                      _buildPasswordField(),
                    ],
                  ),
                ),
                const SizedBox(height: 18),
                _buildTextForgotPassword(),
                const SizedBox(height: 18),
                _buildLoginButton()
              ],
            ),
          ),
        ],
      ),
    );
  }

  SizedBox _buildLoginButton() {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          final isValid = _formKey.currentState!.validate();
          if (isValid) {
            _formKey.currentState!.setState(() {});
            if (loginDone && passwordDone) {
              print('open');

              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => MainScreen()));
            } else {
              print('error');
            }
          }
        },
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(Colors.lightBlue.withOpacity(.8)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          ),
        ),
        child: Text(
          'Login',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildTextForgotPassword() {
    return Text(
      'Forgot password ? ',
      style: TextStyle(
        color: Colors.grey,
        fontWeight: FontWeight.bold,
        fontSize: 17,
      ),
    );
  }

  Widget _buildTextSignin() {
    return const Text(
      'Sign in',
      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    );
  }

  Container _buildLoginField() {
    return Container(
      decoration: _formContainerDecoration(tapLoginForm, loginVal),
      child: Focus(
        onFocusChange: (hasFocus) {
          if (hasFocus) {
            setState(() {
              tapLoginForm = true;
            });
          } else {
            setState(() {
              tapLoginForm = false;
            });
          }
        },
        child: TextFormField(
          style: const TextStyle(fontSize: 18),
          decoration: _inputDecoration('Enter your login', loginVal,
              'belgilar soni 6 dan ko\'p va beliglarga A-Z, a-z, 0-9 ega bo\'lishi kerak'),
          validator: (value) {
            final regUpper = RegExp('[A-Z]');
            final regLower = RegExp('[a-z]');

            if (value!.isEmpty) {
              final snackBar = SnackBar(
                content: Text('Maydonlarni to\'ldiring!'),
                backgroundColor: Colors.red,
              );

              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            } else if (!(regUpper.hasMatch(value) &&
                regLower.hasMatch(value) &&
                value.length > 6)) {
              loginDone = false;

              setState(() {
                loginVal = true;
              });
              return null;
            } else {
              //loginDone true qilamiz agar shartlar bajarilsa teppada, keyingi saxifaga otish uchun
              loginDone = true;
              setState(() {
                loginVal = false;
              });
            }
          },
        ),
      ),
    );
  }

  Container _buildPasswordField() {
    return Container(
      decoration: _formContainerDecoration(tapPasswordForm, passwordVal),
      child: Focus(
        onFocusChange: (hasFocus) {
          if (hasFocus) {
            setState(() {
              tapPasswordForm = true;
            });
          } else {
            setState(() {
              tapPasswordForm = false;
            });
          }
        },
        child: TextFormField(
          style: const TextStyle(fontSize: 18),
          decoration: _inputDecoration('Enter your password', passwordVal,
              'belgilar soni 9 tadan ko\'p bolishi kerak'),
          validator: (value) {
            if (value!.isEmpty) {
              final snackBar = SnackBar(
                content: Text('Maydonlarni to\'ldiring!'),
                backgroundColor: Colors.red,
              );

              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            } else if (!(value.length > 9)) {
              passwordDone = false;

              setState(() {
                passwordVal = true;
              });
              return null;
            } else {
              //passwordDone true qilamiz agar shartlar bajarilsa teppada, keyingi saxifaga otish uchun
              passwordDone = true;
              setState(() {
                passwordVal = false;
              });
            }
          },
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(
      String hinText, bool isValidate, String errorText) {
    return InputDecoration(
      suffixIcon: isValidate
          ? IconButton(
              onPressed: () {
                final snackBar = SnackBar(
                  content: Text(errorText),
                  backgroundColor: Colors.redAccent,
                );

                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              icon: Icon(
                Icons.info,
                color: Colors.red,
              ),
            )
          : null,
      hintText: hinText,
      hintStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      focusColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide:
            BorderSide(color: (isValidate ? Colors.red : Colors.lightBlue)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
    );
  }

  BoxDecoration _formContainerDecoration(bool tapField, bool isValidate) {
    return BoxDecoration(
      color: tapField ? Colors.white : const Color(0xffE4E4E4),
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          blurRadius: 2,
          color: tapField
              ? (isValidate ? Colors.red : Colors.lightBlue)
              : Colors.transparent,
        ),
      ],
    );
  }
}
