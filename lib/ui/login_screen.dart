import 'package:flutter/material.dart';
import 'package:idd_app/Utils/extensions.dart';
import 'package:idd_app/network/network_manager.dart';
import 'package:idd_app/ui/enroll_screen.dart';
import 'package:idd_app/ui/forgot_password.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> _nonEndCustomerLoginFormKey = GlobalKey<FormState>();
  final TextEditingController userNameTextController = TextEditingController(text: const String.fromEnvironment('testuser'));
  final TextEditingController passwordTextController = TextEditingController(text: const String.fromEnvironment('testpwd'));
  FocusNode userNameNode = FocusNode();
  FocusNode passwordNode = FocusNode();
  bool _isObscure = true;
  bool _obscureText = true;
  //bool _toggle = true;
  bool isEnabled = true;
  String errorMessage = "";
  int errorCode = 0;
  //bool isEnabled = false;
  bool isTextEditing = false;
  bool _isLoading = false;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void initState() {
    super.initState();
    checkFields();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomInset: true,
        // backgroundColor: Colors.white,
        body: SafeArea(
          child: Stack(
            children: [SingleChildScrollView(
                reverse: true,
                padding: const EdgeInsets.only(left:40.0,right:40.0),
                child: Column(children: [
                  SizedBox(
                    height: 48,
                  ),
                  FractionallySizedBox(
                      alignment: Alignment.center,
                      widthFactor: 0.6,
                      child: Image.asset('assets/Logo.png')),
                  SizedBox(
                    height: 70,
                  ),
                  // Spacer(),
                  Text(
                    "Sign in",
                    style: const TextStyle(
                        fontFamily: 'Gordita',
                        fontWeight: FontWeight.w500,
                        fontSize: 37,
                        fontStyle: FontStyle.normal),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  
                  Form(
                    key: _nonEndCustomerLoginFormKey,
                    child: Column(children: [
                      TextFormField(
                        focusNode: userNameNode,
                        autocorrect: false,
                        
                        textAlign: TextAlign.left,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          return validateEmail(value!);
                        },
                        controller: userNameTextController,
                        decoration: InputDecoration(
                          isDense: true,
                          hintText: "Enter your username",
                          labelText: "Username",
                          labelStyle:
                              Theme.of(context).inputDecorationTheme.labelStyle,
                          hintStyle:
                              Theme.of(context).inputDecorationTheme.hintStyle,
                        ),
                        onEditingComplete: () {
                          // isTextEditing = false;
                          FocusScope.of(context).nextFocus();
                        },
                        onChanged: (enteredValue) {
                         checkFields();
                        },
                      ),
                    ]),
                  ),
                  
                  SizedBox(
                    height: 20,
                  ),
                  
                  TextFormField(
                    
                    focusNode: passwordNode,
                    textAlign: TextAlign.left,
                    obscureText: _isObscure,
                    decoration: InputDecoration(
                      isDense: true,
                        labelText: 'Enter password',
                        suffixIcon: IconButton(
                            icon: Icon(_isObscure
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            })),
                    controller: passwordTextController,
                    onChanged: (enteredValue) {
                      checkFields();
                    },
                    validator: (value) {
                      return validatePassword(value!, context);
                    },
                  ),
                  
                  
                  SizedBox(
                    height: 50,
                  ),
                  
                  InkWell(
                    child: Text(
                      "Forgot Password?",
                      style: Theme.of(context).textTheme.headline6!.copyWith(color: Theme.of(context).primaryColor),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const forgotPasswordScreen()),
                      );
                    },
                  ),
                  SizedBox(height: 14.5),
                  Row(children: [
                    Expanded(
                        child: ElevatedButton(
                      // style: ElevatedButton.styleFrom(
                      // shape: RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.circular(12))),
                      onPressed: isEnabled
                          ? () {
                              doAuthentication();
                              setState(() {
                                isEnabled = false;
                                _isLoading = true;
                              });
                            }
                          : null,
                      child: _isLoading ? CircularProgressIndicator(): Text(
                        'Sign in',
                      ),
                    )
                        )
                  ]),
                  // TermsAndConditions()
                ])),
                // Positioned(
                //   bottom: 0,
                //   left: 0,
                //   right: 0,
                //   child: TermsAndConditions()
                // )
                ],
          ),
        ));
  }

  void _startLoading() async {
    setState(() {
      _isLoading = true;
    });
  }

  void doAuthentication() {
    if (_nonEndCustomerLoginFormKey.currentState!.validate()) {
      _nonEndCustomerLoginFormKey.currentState!.save();
      String username = userNameTextController.text;
      String password = passwordTextController.text;
      print("Logged in user");
      NetworkManager.instance.doLogin(username, password).then((value) => {
            // Send to next controller
            if (value)
              {
                _isLoading = !_isLoading,
                Navigator.of(context).pushNamed('dashboard')
              }
            else
              {
                // Show error here.
                alertMessage()
                // showAlertMessage()
              }
          });
      // Map<String, dynamic> inputData = {
      //   "userName": username,
      //   "password": password
      // };
    }
  }

  void checkFields(){
    var userName = userNameTextController.text;
    var password = passwordTextController.text;
    if(userName.isNotEmpty && password.isNotEmpty){
      setState(() {
        isEnabled = true;
      });
    } else {
      setState(() {
        isEnabled = false;
      });
    }
  }

  void alertMessage() {
    // ScaffoldMessenger.of(context).showSnackBar(snackbar);
    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
      backgroundColor: Colors.red,
      content: Text('         Invalid username or password'),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height - 115,
        //right: 20,
        //left: 20
      ),
    ));
  }
}

class TermsAndConditions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        
        Row(children: [
          RichText(
              text: TextSpan(children: <TextSpan>[
            TextSpan(
              text: "     Don't have an account?",
              style: TextStyle(
                  fontFamily: 'Gordita',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
          ])),
          //  ],
          // ),
          Builder(builder: (context) {
            return InkWell(
              child: Text(
                " Sign Up",
                style: const TextStyle(
                    fontFamily: 'Gordita',
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(45, 202, 115, 1),
                    fontSize: 16),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const EnrollScreen()),
                );
              },
            );
          }),
        ]),
        SizedBox(
          height: 24,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: RichText(
              text: TextSpan(children: <TextSpan>[
            TextSpan(
          text:
              '''By signing in and/or using the Identity Defense\nservice,I acknowledge that I have read and accept the''',
          style: TextStyle(
              fontFamily: 'Gordita',
              fontSize: 12,
              height: 1.4,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(166, 173, 178, 1)),
            ),
            TextSpan(
            text: " Service terms of Use",
            style: TextStyle(
                fontFamily: 'Gordita',
                fontSize: 12,
                color: Color.fromRGBO(45, 202, 115, 1),
                fontWeight: FontWeight.w400)),
            TextSpan(
          text: "and the ",
          style: TextStyle(
              fontFamily: 'Gordita',
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(166, 173, 178, 1)),
            ),
            TextSpan(
          text: "Privacy Policy.",
          style: TextStyle(
            height: 1.1,
            fontFamily: 'Gordita',
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Color.fromRGBO(45, 202, 115, 1),
          ),
            ),
          ])),
        )
      ],
    );
  }
}
