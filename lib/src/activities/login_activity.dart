import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/src/backend/models/user_model.dart';
import 'package:wallet_app/src/providers/auth_provider.dart';
import 'package:wallet_app/src/utils/notification-app.dart';
import 'package:wallet_app/src/utils/widgets/background_app.dart';
import 'package:wallet_app/src/utils/utils.dart' as utils;
import 'package:wallet_app/src/utils/widgets/input_decoration.dart';

class AuthenticationActivity extends StatefulWidget {
  const AuthenticationActivity({Key? key}) : super(key: key);

  @override
  createState() => _AuthenticationActivityState();
}

class _AuthenticationActivityState extends State<AuthenticationActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: BackgroundApp(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ChangeNotifierProvider(
                  create: (_) => SessionProvider(),
                  child: _LogInForm(),
                )
              ],
            ),
          ),
        ));
  }
}

class _LogInForm extends StatefulWidget {
  @override
  State<_LogInForm> createState() => _LogInFormState();
}

class _LogInFormState extends State<_LogInForm> {
  final User _user = User();
  final _userProvider = SessionProvider();
  final _formKey = GlobalKey<FormState>();
  late BuildContext context;
  SessionProvider? loginForm;
  Size? size;
  @override
  Widget build(BuildContext context) {
    loginForm = Provider.of<SessionProvider>(context);
    size = MediaQuery.of(context).size;
    this.context = context;
    return Container(
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: <Widget>[
            const SizedBox(height: 150.0),
            const Text('Iniciar Sesión',
                style: TextStyle(fontSize: 20.0, color: Colors.white)),
            const SizedBox(height: 30.0),
            _TxtUser(user: _user),
            const SizedBox(height: 15.0),
            _PwdUser(user: _user),
            const SizedBox(height: 20.0),
            btnLogIn(),
            const SizedBox(height: 39.0)
          ],
        ),
      ),
    );
  }

  MaterialButton btnLogIn() => MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      disabledColor: Colors.grey,
      elevation: 0,
      color: Colors.deepPurple,
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
          child: Text(
            loginForm!.isLoading ? 'Espere' : 'Ingresar',
            style: TextStyle(color: Colors.white),
          )),
      onPressed: loginForm!.isLoading ? null : _login);

  void _login() async {
    if (!_formKey.currentState!.validate()) return;

    _formKey.currentState!.save();
    loginForm!.isLoading = true;

    FocusScope.of(context).unfocus();

    utils.check().then((intenet) async {
      if (intenet) {
        validateSesion();
      } else {
        NotificationsApp.showSnackbar('Sin conexion a internet', Colors.red);
      }
    });
  }

  void validateSesion() async {
    String? errorMessage = await _userProvider.session(_user);
    print(errorMessage);
    loginForm!.isLoading = false;

    if (errorMessage == null) {
      Navigator.pushReplacementNamed(context, 'home');
    } else {
      NotificationsApp.showSnackbar(errorMessage, Colors.red);
      loginForm!.isLoading = false;
    }
  }
}

class _TxtUser extends StatelessWidget {
  final user;
  const _TxtUser({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Theme(
        data: ThemeData(
          primaryColor: Colors.white,
          primaryColorDark: Colors.white,
        ),
        child: TextFormField(
          autocorrect: false,
          keyboardType: TextInputType.text,
          decoration: InputDecorations.authInputDecoration(
            hintText: 'Correo electronico',
            labelText: 'Correo electronico',
            prefix: const Icon(Icons.perm_identity),
            //color: Colors.white,
          ),
          onSaved: (userValue) => user.vEmail = userValue,
          validator: (userValue) {
            //return utils.validaUser(userValue!);
          },
        ),
      ),
    );
  }
}

class _PwdUser extends StatefulWidget {
  final user;

  const _PwdUser({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<_PwdUser> createState() => _PwdUserState();
}

class _PwdUserState extends State<_PwdUser> {
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Theme(
        data: ThemeData(
          primaryColor: Colors.white,
          primaryColorDark: Colors.white,
        ),
        child: TextFormField(
          autocorrect: false,
          keyboardType: TextInputType.text,
          decoration: InputDecorations.authInputDecoration(
            hintText: 'Contraseña',
            labelText: 'Contraseña',
            prefix: GestureDetector(
              onTap: () {
                setState(() {
                  _showPassword = !_showPassword;
                });
              },
              child: Icon(
                _showPassword ? Icons.visibility : Icons.visibility_off,
              ),
            ),
          ),
          obscureText: !_showPassword,
          onSaved: (pwdValue) => widget.user.vPassword = pwdValue,
        ),
      ),
    );
  }
}
