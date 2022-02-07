import 'package:aplicativo_prueba/homeview.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _user, _password;
  String _errorUser, _errorPassword, _errorLogin = " ";
  final formKey = GlobalKey<FormState>();
  void submit() async {
    final state = formKey.currentState;
    state.save();
    this._errorUser = null;
    _errorPassword = null;
    _errorLogin = " ";
    if (_user.length == 0 && _password.length == 0) {
      _errorUser = "Colocar el Usuario";
      _errorPassword = "Colocar la Contraseña";
    } else if (_user.length == 0) {
      _errorUser = "Colocar el Usuario";
    } else if (_password.length == 0) {
      _errorPassword = "Colocar la Contraseña";
    } else {
      try {
        if (_user == "admin" && _password == "admin") {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Home()));
          _errorPassword = null;
          _errorUser = null;
          _errorLogin = " ";
        }
      } catch (e) {
        print(e);
        setState(() {
          _errorLogin = "Usuario no Registrado";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            titulo("APP GESTOR"),
            SizedBox(height: 15),
            subtitulo("Xplora"),
            SizedBox(height: 7),
            subtitulo("v2.0.0"),
            SizedBox(height: 40),
            userypassword("Usuario", context, true, _errorUser),
            SizedBox(height: 15),
            userypassword("Password", context, false, _errorPassword),
            SizedBox(height: 15),
            Container(
              child: Text(_errorLogin,
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0)),
            ),
            SizedBox(height: 80),
            TextButton(
                onPressed: () {
                  setState(() {
                    submit();
                  });
                },
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    color: Colors.pink[300],
                    height: 30,
                    width: 80,
                    child: Center(child: Text("Ingresar")),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Widget userypassword(
      String titulo, BuildContext context, bool bool, String error) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("$titulo"),
        Container(
          width: MediaQuery.of(context).size.width / 1.2,
          child: TextFormField(
            obscureText: bool == true ? false : true,
            decoration: InputDecoration(errorText: error),
            onSaved: (val) => bool == true ? _user = val : _password = val,
          ),
        ),
      ],
    );
  }
}

Widget titulo(String titulo) {
  return Align(
    alignment: Alignment.center,
    child: Text(
      titulo,
      style: TextStyle(
          color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
    ),
  );
}

Widget subtitulo(String subtitulo) {
  return Text(
    subtitulo,
    style: TextStyle(
      color: Colors.black,
      fontSize: 15,
    ),
  );
}
