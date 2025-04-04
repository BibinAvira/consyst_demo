import 'package:flashcurrent/Colors.dart';
import 'package:flashcurrent/app/modules/authentication/views/textformfields.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/authentication_controller.dart';

class AuthenticationView extends GetView<AuthenticationController> {
  const AuthenticationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colours().primary_backgroundcolor,
        child: Form(
            key: controller.formKey,
            child: Obx(() => controller.is_forgetpassword.value == true
                ? Column(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(top: 50, left: 25),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Forgot\npassword?",
                                style: GoogleFonts.montserrat(
                                    fontSize: 36,
                                    color:
                                        Colours().primary_backgroundcolor_text,
                                    fontWeight: FontWeight.w700),
                              ))),
                      SizedBox(
                        height: 30,
                      ),
                      ForgotEmail_textformfield(),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Container(
                          width: 300,
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: "*",
                                style: GoogleFonts.montserrat(
                                    fontSize: 14,
                                    color: Colours().redcolor,
                                    fontWeight: FontWeight.w400),
                              ),
                              TextSpan(
                                text:
                                    " We will send you a message to set or reset your new password",
                                style: GoogleFonts.montserrat(
                                    fontSize: 12,
                                    color: Color.fromRGBO(103, 103, 103, 1),
                                    fontWeight: FontWeight.w400),
                              ),
                            ]),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      //login or singnup button
                      Container(
                        height: 55,
                        width: 317,
                        decoration: BoxDecoration(
                            color: Colours().redcolor,
                            borderRadius: BorderRadius.all(Radius.circular(4))),
                        child: ElevatedButton(
                          onPressed: () {
                            controller.Password_reset();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colours().redcolor,

                            // padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                          ),
                          child: Center(
                            child: Text(
                              "Submit",
                              style: GoogleFonts.montserrat(
                                  fontSize: 20,
                                  color: Colours().primary_backgroundcolor,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 40, top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Go back to ",
                              style: GoogleFonts.montserrat(
                                  fontSize: 15,
                                  color: Color.fromRGBO(103, 103, 103, 1),
                                  fontWeight: FontWeight.w500),
                            ),
                            TextButton(
                                onPressed: () {
                                  controller.is_forgetpassword.value = false;
                                  controller.is_login.value = true;
                                },
                                child: Text(
                                  "Login ?",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 15,
                                      decoration: TextDecoration.underline,
                                      decorationColor: Colours().redcolor,
                                      color: Colours().redcolor,
                                      fontWeight: FontWeight.w500),
                                ))
                          ],
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      //text
                      Padding(
                        padding: EdgeInsets.only(top: 50, left: 25),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: controller.is_login.value == true
                              ? Text(
                                  "Welcome\nBack!",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 36,
                                      color: Colours()
                                          .primary_backgroundcolor_text,
                                      fontWeight: FontWeight.w700),
                                )
                              : Text(
                                  "Create an\naccount",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 36,
                                      color: Colours()
                                          .primary_backgroundcolor_text,
                                      fontWeight: FontWeight.w700),
                                ),
                        ),
                      ),
                      //authentication fields
                      SizedBox(
                        height: 30,
                      ),
                      controller.is_login.value == false
                          ? Username_textformfield()
                          : SizedBox(),
                      Email_textformfield(),
                      SizedBox(
                        height: 10,
                      ),
                      Password_textformfield(),
                      controller.is_login.value != true
                          ? Confirm_Password_textformfield()
                          : SizedBox(),
                      controller.is_login.value == true
                          ? Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 40),
                                child: TextButton(
                                    onPressed: () {
                                      controller.is_forgetpassword.value = true;
                                    },
                                    child: Text(
                                      "Forgot Password?",
                                      style: GoogleFonts.montserrat(
                                          fontSize: 14,
                                          color: Colours().redcolor,
                                          fontWeight: FontWeight.w400),
                                    )),
                              ),
                            )
                          : SizedBox(),
                      //text
                      // controller.is_login.value != true
                      //     ? Padding(
                      //         padding: const EdgeInsets.only(left: 40),
                      //         child: RichText(
                      //           text: TextSpan(children: [
                      //             TextSpan(
                      //               text: "By clicking the ",
                      //               style: GoogleFonts.montserrat(
                      //                   fontSize: 14,
                      //                   color: Color.fromRGBO(103, 103, 103, 1),
                      //                   fontWeight: FontWeight.w400),
                      //             ),
                      //             TextSpan(
                      //               text: "Register ",
                      //               style: GoogleFonts.montserrat(
                      //                   fontSize: 14,
                      //                   color: Colours().redcolor,
                      //                   fontWeight: FontWeight.w400),
                      //             ),
                      //             TextSpan(
                      //               text:
                      //                   "button, you agree to the public offer ",
                      //               style: GoogleFonts.montserrat(
                      //                   fontSize: 14,
                      //                   color: Color.fromRGBO(103, 103, 103, 1),
                      //                   fontWeight: FontWeight.w400),
                      //             ),
                      //           ]),
                      //         ),
                      //       )
                      //     : SizedBox(),

                      SizedBox(
                        height: 30,
                      ),
                      //login or singnup button
                      controller.is_login.value == true
                          ? Container(
                              height: 55,
                              width: 317,
                              decoration: BoxDecoration(
                                  color: Colours().redcolor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4))),
                              child: ElevatedButton(
                                onPressed: () {
                                  controller.Check_User_Validate();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colours().redcolor,

                                  // padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                                ),
                                child: Center(
                                  child: Text(
                                    "Login",
                                    style: GoogleFonts.montserrat(
                                        fontSize: 20,
                                        color:
                                            Colours().primary_backgroundcolor,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            )
                          : Container(
                              height: 55,
                              width: 317,
                              decoration: BoxDecoration(
                                  color: Colours().redcolor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4))),
                              child: ElevatedButton(
                                onPressed: () {
                                  controller.Check_User_Validate();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colours().redcolor,

                                  // padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                                ),
                                child: Center(
                                  child: Text(
                                    "Create Account",
                                    style: GoogleFonts.montserrat(
                                        fontSize: 20,
                                        color:
                                            Colours().primary_backgroundcolor,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ),
                      SizedBox(
                        height: 70,
                      ),
                      // Text(
                      //   "- OR Continue with -",
                      //   style: GoogleFonts.montserrat(
                      //       fontSize: 12,
                      //       color: Colours().primary_backgroundcolor_text,
                      //       fontWeight: FontWeight.w500),
                      // ),
                      //or login with google,apple,facebook
                      // Center(
                      //     child: Padding(
                      //   padding: EdgeInsets.all(8),
                      //   child: Container(
                      //     height: 100,
                      //     width: 230,
                      //     // color: Colors.amber,

                      //     child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //       crossAxisAlignment: CrossAxisAlignment.center,
                      //       children: [
                      //         GestureDetector(
                      //           onTap: () {},
                      //           child: Image.asset("assets/images/Google.png"),
                      //         ),
                      //         GestureDetector(
                      //           onTap: () {},
                      //           child: Image.asset("assets/images/apple.png"),
                      //         ),
                      //         GestureDetector(
                      //           onTap: () {},
                      //           child: Image.asset("assets/images/Facebook.png"),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // )),

                      //text
                      controller.is_login.value == true
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Create An Account",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                      color: Color.fromRGBO(87, 87, 87, 1),
                                      fontWeight: FontWeight.w400),
                                ),
                                TextButton(
                                    onPressed: () {
                                      controller.is_login.value = false;
                                      controller.Initialize_texfields();
                                    },
                                    child: Text(
                                      "Sign Up",
                                      style: GoogleFonts.montserrat(
                                          fontSize: 14,
                                          color: Colours().redcolor,
                                          decoration: TextDecoration.underline,
                                          decorationColor: Colours().redcolor,
                                          decorationStyle:
                                              TextDecorationStyle.solid,
                                          fontWeight: FontWeight.w600),
                                    ))
                              ],
                            )
                          :

                          ///
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "I Already Have an Account",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                      color: Color.fromRGBO(87, 87, 87, 1),
                                      fontWeight: FontWeight.w400),
                                ),
                                TextButton(
                                    onPressed: () {
                                      controller.is_login.value = true;
                                    },
                                    child: Text(
                                      "Login",
                                      style: GoogleFonts.montserrat(
                                          fontSize: 14,
                                          color: Colours().redcolor,
                                          decoration: TextDecoration.underline,
                                          decorationColor: Colours().redcolor,
                                          decorationStyle:
                                              TextDecorationStyle.solid,
                                          fontWeight: FontWeight.w600),
                                    ))
                              ],
                            )
                    ],
                  ))),
      ),
    );
  }
}
