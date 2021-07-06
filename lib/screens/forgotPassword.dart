import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:login_app/colores.dart';
import 'package:login_app/widgets/TextInput-Field.dart';
import 'package:login_app/widgets/background-image.dart';
import 'package:login_app/widgets/round-button-forgot.dart';

 class ForgotPassword extends StatelessWidget{

   @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children:[
        BackgroundImage(image: 'assets/img/login1.jpg'),
        Scaffold(

          backgroundColor: Colors.transparent ,
          appBar: AppBar(
             backgroundColor: Colors.transparent ,
              elevation: 0,
              leading: IconButton(
                onPressed:(){
                  Navigator.pop(context);
                } ,
                icon: Icon(
                Icons.arrow_back_ios,
                color: kWhile,
              ),
              ),
              title: Text('Forgot Password', style: kBodyText,),
              centerTitle: true,

          ), 
          body: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.1
                    ),
                    Container(
                      width: size.width *0.8,
                      child: Text(
                        'Ingresa tu correo y estaremos enviando los pasos para que recuperes tu contraseña',
                        style: kBodyText,
                      ),

                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextInputField(icon: FontAwesomeIcons.envelope,hint:'Email', inputAction: TextInputAction.done, inputType: TextInputType.emailAddress,),
                     SizedBox(
                      height: 20,
                    ),
                    RoundButtonForgot(buttonName: 'Enviar')

                  ],
                ),
              ),
            ],
          ),
        ),
      ],

      
    ) ;
  }
 }