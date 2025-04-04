 
 
 import 'package:flashcurrent/Colors.dart';
import 'package:flashcurrent/app/modules/authentication/controllers/authentication_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

   final Color _txtfield_boxcolor=Color.fromRGBO(243, 243, 243, 1);
   final Color _txtfield_txtcolor=Color.fromRGBO(103, 103, 103, 1);
Widget Email_textformfield(){
 AuthenticationController controller=Get.find();

 return Container(
                
                  height: 70,
                  width: 317,
                  child:  TextFormField(
                      style:GoogleFonts.montserrat(
                          color: _txtfield_txtcolor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500
                          ),
                      controller: controller.txt_email_controller,
                      onTap: () {
                        controller.txt_email_controller.selection =
                            TextSelection(
                                baseOffset: 0,
                                extentOffset: controller
                                    .txt_email_controller.value.text.length);
                      },
                      validator: (value) {
                                      if (!(value!.isEmail)) {
                                        return 'invalidemail';
                                      } else {
                                        return null;
                                      }
                                    },
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color:Colours().primary_backgroundcolor_text),
                        ),
                        filled: true,
                        fillColor: _txtfield_boxcolor,
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Colours().primary_backgroundcolor_text),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colours().primary_backgroundcolor_text)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colours().primary_backgroundcolor_text)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colours().primary_backgroundcolor_text)),
                           prefixIcon:Icon(Icons.person) ,
                        label: Text("Email"),
                        labelStyle: GoogleFonts.montserrat( color: _txtfield_txtcolor,
                          fontSize: 14,
                          height: 2,
                          fontWeight: FontWeight.w500 ),

                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                      ),
                    ),
                  
                );
}
Widget Username_textformfield(){
 AuthenticationController controller=Get.find();

 return Container(
                
                  height: 70,
                  width: 317,
                  child:  TextFormField(
                      style:GoogleFonts.montserrat(
                          color: _txtfield_txtcolor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500
                          ),
                      controller: controller.txt_username_controller,
                      onTap: () {
                        controller.txt_username_controller.selection =
                            TextSelection(
                                baseOffset: 0,
                                extentOffset: controller
                                    .txt_username_controller.value.text.length);
                      },
                       inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z]+$')), // Only alphabets
          ],
                      validator: (value) {
                                      if ((value!.isEmpty)) {
                                        return 'Enter a username';
                                      } else {
                                        return null;
                                      }
                                    },
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color:Colours().primary_backgroundcolor_text),
                        ),
                        filled: true,
                        fillColor: _txtfield_boxcolor,
                        
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Colours().primary_backgroundcolor_text),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colours().primary_backgroundcolor_text)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colours().primary_backgroundcolor_text)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colours().primary_backgroundcolor_text)),
                           prefixIcon:Icon(Icons.person) ,
                        label: Text("Username"),
                        
                        labelStyle: GoogleFonts.montserrat( color: _txtfield_txtcolor,
                          fontSize: 14,
                          height: 2,
                          fontWeight: FontWeight.w500 ),

                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                      ),
                    ),
                  
                );
}
Widget Password_textformfield(){
 AuthenticationController controller=Get.find();

 return Container(
                
                  height: 70,
                  width: 317,
                  child: Obx(() =>TextFormField(
                      style:GoogleFonts.montserrat(
                          color:_txtfield_txtcolor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500
                          ),
                            obscureText: !controller.is_visiblepassword.value,
                      controller: controller.txt_password_controller,
                      onTap: () {
                        controller.txt_password_controller.selection =
                            TextSelection(
                                baseOffset: 0,
                                extentOffset: controller
                                    .txt_password_controller.value.text.length);
                      },validator: (value) {
                                if (value.toString().length < 6) {
                                  return 'length should be greater than or equal 6';
                                } else {
                                  return null;
                                }
                              },
                      
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color:Colours().primary_backgroundcolor_text),
                        ),
                        filled: true,
                        fillColor: _txtfield_boxcolor,
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Colours().primary_backgroundcolor_text),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colours().primary_backgroundcolor_text)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colours().primary_backgroundcolor_text)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colours().primary_backgroundcolor_text)),
                           prefixIcon: Icon(Icons.lock),
                           suffixIcon: GestureDetector(
                                      onTap: () {
                                        controller.is_visiblepassword.value =
                                            !controller
                                                .is_visiblepassword.value;
                                      },
                                      child: controller
                                                    .is_visiblepassword.value ==
                                                false
                                            ? Icon(
                                                LineIcons.eyeAlt,
                                                color: Colors.black,
                                                size: 30,
                                              )
                                            : Icon(
                                                LineIcons.eyeSlash,
                                                color: Colors.black,
                                                size: 30,
                                              ),
                                      ),
                        label: Text("Password"),
                        labelStyle: GoogleFonts.montserrat( color: _txtfield_txtcolor,
                          fontSize: 14,
                          height: 2,
                          fontWeight: FontWeight.w500 ),

                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                      ),
                    ),
                  
                ));
}
Widget Confirm_Password_textformfield(){
 AuthenticationController controller=Get.find();

 return Container(
                
                  height: 70,
                  width: 317,
                  child:Obx(() =>  TextFormField(
                      style:GoogleFonts.montserrat(
                          color:_txtfield_txtcolor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500
                          ),
                            obscureText: !controller.is_visiblepassword1.value,
                      controller: controller.txt_password_repeat_controller,
                      onTap: () {
                        controller.txt_password_repeat_controller.selection =
                            TextSelection(
                                baseOffset: 0,
                                extentOffset: controller
                                    .txt_password_repeat_controller.value.text.length);
                      },
                      validator: (value) {
                                if (value.toString()!=controller.txt_password_controller.text) {
                                  return 'Password is not same as above';
                                } else {
                                  return null;
                                }
                              },
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color:Colours().primary_backgroundcolor_text),
                        ),
                        filled: true,
                        fillColor: _txtfield_boxcolor,
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Colours().primary_backgroundcolor_text),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colours().primary_backgroundcolor_text)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colours().primary_backgroundcolor_text)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colours().primary_backgroundcolor_text)),
                           prefixIcon: Icon(Icons.lock),
                           suffixIcon: GestureDetector(
                                      onTap: () {
                                        controller.is_visiblepassword1.value =
                                            !controller
                                                .is_visiblepassword.value;
                                      },
                                      child: controller
                                                    .is_visiblepassword1.value ==
                                                false
                                            ? Icon(
                                                LineIcons.eyeAlt,
                                                color: Colors.black,
                                                size: 30,
                                              )
                                            : Icon(
                                                LineIcons.eyeSlash,
                                                color: Colors.black,
                                                size: 30,
                                              ),
                                      ),
                        label: Text("ConfirmPassword"),
                        labelStyle: GoogleFonts.montserrat( color: _txtfield_txtcolor,
                          fontSize: 14,
                          height: 2,
                          fontWeight: FontWeight.w500 ),

                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                      ),
                    ),
                  
                ));
}

Widget ForgotEmail_textformfield(){
 AuthenticationController controller=Get.find();

 return Container(
                
                  height: 70,
                  width: 317,
                  child:  TextFormField(
                      style:GoogleFonts.montserrat(
                          color: _txtfield_txtcolor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500
                          ),
                      controller: controller.txt_forgotemail_controller,
                      onTap: () {
                        controller.txt_forgotemail_controller.selection =
                            TextSelection(
                                baseOffset: 0,
                                extentOffset: controller
                                    .txt_forgotemail_controller.value.text.length);
                      },
                      validator: (value) {
                                      if (!(value!.contains('@'))) {
                                        return 'invalid email';
                                      } else {
                                        return null;
                                      }
                                    },
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color:Colours().primary_backgroundcolor_text),
                        ),
                        filled: true,
                        fillColor: _txtfield_boxcolor,
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Colours().primary_backgroundcolor_text),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colours().primary_backgroundcolor_text)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colours().primary_backgroundcolor_text)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colours().primary_backgroundcolor_text)),
                           prefixIcon:Icon(Icons.email) ,
                        label: Text("Enter your email address"),
                        labelStyle: GoogleFonts.montserrat( color: _txtfield_txtcolor,
                          fontSize: 14,
                          height: 2,
                          fontWeight: FontWeight.w500 ),

                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                      ),
                    ),
                  
                );
}
