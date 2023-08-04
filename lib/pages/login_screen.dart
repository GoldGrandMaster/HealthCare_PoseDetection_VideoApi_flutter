import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Positioned(
            width: width,
            top: height / 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 80,
                ),
                Center(
                  child: Container(
                    width: width - 80,
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      style: TextStyle(
                          fontSize: 20, color: Theme.of(context).primaryColor),
                      // onSaved: (input) => _con.user.email = input,
                      // validator: (input) =>
                      //     !input.contains('@') ? "Should be a valid email" : null,
                      initialValue: "Richard",
                      decoration: InputDecoration(
                        labelText: "Username",
                        focusedBorder: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(24.0),
                            ),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor)),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelStyle: TextStyle(
                            fontSize: 18,
                            color: Theme.of(context).primaryColor),
                        contentPadding: EdgeInsets.fromLTRB(16, 12, 12, 12),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(24.0),
                            ),
                            borderSide: BorderSide(
                                color: Theme.of(context).secondaryHeaderColor)),
                        border: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(24.0),
                            ),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Center(
                  child: Container(
                    width: width - 80,
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      style: TextStyle(fontSize: 20, color: Colors.black87),
                      obscureText: true,
                      // onSaved: (input) => _con.user.email = input,
                      // validator: (input) =>
                      //     !input.contains('@') ? "Should be a valid email" : null,
                      initialValue: "Pass123\$",
                      decoration: InputDecoration(
                        labelText: "Password",
                        focusedBorder: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(24.0),
                            ),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor)),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelStyle: TextStyle(
                            fontSize: 18,
                            color: Theme.of(context).primaryColor),
                        contentPadding: EdgeInsets.fromLTRB(16, 12, 12, 12),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(24.0),
                            ),
                            borderSide: BorderSide(
                                color: Theme.of(context).secondaryHeaderColor)),
                        border: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(24.0),
                            ),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 160,
                ),
                // GestureDetector(
                //   onTap: () {
                //     Navigator.of(context)
                //         .pushNamed('/video_list', arguments: 0);
                //   },
                //   child: Center(
                //     child: Container(
                //       height: 46,
                //       width: width - 80,
                //       decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(24.0),
                //         gradient: LinearGradient(
                //           begin: Alignment(-1.0, 0),
                //           end: Alignment(1.0, 0),
                //           colors: [
                //             Theme.of(context).secondaryHeaderColor,
                //             Theme.of(context)
                //                 .secondaryHeaderColor
                //                 .withAlpha(155)
                //           ],
                //           stops: [0.0, 1.0],
                //         ),
                //         boxShadow: [
                //           BoxShadow(
                //             color:
                //                 Theme.of(context).primaryColor.withOpacity(1),
                //             offset: Offset(0, 2),
                //             blurRadius: 4,
                //           ),
                //         ],
                //       ),
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         crossAxisAlignment: CrossAxisAlignment.center,
                //         children: [
                //           Text(
                //             'Login',
                //             style: TextStyle(
                //               fontFamily: 'Poppins',
                //               fontSize: 25,
                //               color: const Color(0xffffffff),
                //             ),
                //             textAlign: TextAlign.center,
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
