import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:login_app/colores.dart';
//import 'package:login_and_register/widgets/TextInput-Field.dart';
//import 'package:login_and_register/widgets/TextInput-password.dart';
import 'package:login_app/widgets/background-image.dart';
import 'package:login_app/widgets/widgets.dart';

class CreateNewAccount extends StatefulWidget{

  @override 
  CreateNewAccountState createState()=>CreateNewAccountState();
}

class CreateNewAccountState extends State<CreateNewAccount>{
  

late String _email;
late String _password;
 final GlobalKey<FormState> _formKey = GlobalKey();
  
   Map <String,String> _authData={'email': '', 'password': ''};
   TextEditingController _passwordController = new TextEditingController();

   Future _submit()async{
   if(!_formKey.currentState!.validate()){
     return;

   }
   _formKey.currentState!.save();
 }
  @override 
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        BackgroundImage(image: 'assets/img/login1.jpg'),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
                      child: Column(
              children:[
                SizedBox(
                  height: size.width * 0.1
                ),
                Stack(
                  children: [
                    Center(
                      child: ClipOval(
                              child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 3,sigmaY:3),
                             child: CircleAvatar(
                            radius: size.width * 0.14,
                            backgroundColor: Colors.grey[400]!.withOpacity(0.4),
                            child: Icon(
                              FontAwesomeIcons.user,
                              color: kWhile,
                              size: size.width * 0.1
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: size.width *0.08 ,
                      left: size.width * 0.56,
                         child: Container(
                        height: size.width * 0.12,
                        width: size.width * 0.12,
                        decoration: BoxDecoration(
                          color: kBlue,
                          shape: BoxShape.circle,
                          border: Border.all(color:kWhile, width: 2)
                        ),
                        child: Icon(
                          FontAwesomeIcons.arrowUp, color: kWhile,
                        ),
                      ),
                    )
                  ],
                ),
                 SizedBox(
                  height: size.width * 0.1
                ),
                Form(
                  key: _formKey ,
                                  child: Column(children: [
                    /*
                    TextInputField(
                    icon: FontAwesomeIcons.user,
                    hint:'User', 
                    inputAction: TextInputAction.next,
                   inputType: TextInputType.name,
                   )*/
                    Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
          height: size.height * 0.08,
          width: size.width * 0.8,
          decoration: BoxDecoration(
      color: Colors.grey[500]!.withOpacity(0.5),
      borderRadius: BorderRadius.circular(16)
          ),
          child: Center(
    
              child: TextFormField(
        
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Icon(FontAwesomeIcons.user, 
              size: 28,
              color: kWhile
              ),
            ),
            hintText: 'Usuario',
            hintStyle: kBodyText,
            
          ),
          style: kBodyText,
          keyboardType:TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          validator: (value){
            if(value!.isEmpty){
              return 'Usuario invalido';
            }
          },
        


        ),
      
          )
        ),
    )
                    ,
                   /*
                  TextInputField(
                    icon: FontAwesomeIcons.envelope,
                    hint:'Email', 
                    inputAction: TextInputAction.done,
                   inputType: TextInputType.emailAddress,
                   ),
                   */
               Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
          height: size.height * 0.08,
          width: size.width * 0.8,
          decoration: BoxDecoration(
      color: Colors.grey[500]!.withOpacity(0.5),
      borderRadius: BorderRadius.circular(16)
          ),
          child: Center(
    
      
              child: TextFormField(
        onChanged:  (value){_email = value;},
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Icon(FontAwesomeIcons.envelope, 
              size: 28,
              color: kWhile
              ),
            ),
            hintText: 'Correo electronico',
            hintStyle: kBodyText,
            
          ),
          style: kBodyText,
          keyboardType:TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          validator: (value){
            if(value!.isEmpty || !value.contains('@')){
              return 'Correo invalido';
            }
          },
          onSaved: (value){
            _authData['email']=value!;
          },


        ),
      ),
          )
        ),
    
                  
                  /*
                    PasswordInput(
                  icon: FontAwesomeIcons.lock,
                  hint: 'Password',
                  inputType: TextInputType.name,
                  inputAction: TextInputAction.done,
                    ),
                     PasswordInput(
                  icon: FontAwesomeIcons.lock,
                  hint: 'Confirm Password',
                  inputType: TextInputType.name,
                  inputAction: TextInputAction.done
                     ),
                     
                     */
                    
                     Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
          height: size.height * 0.08,
          width: size.width * 0.8,
          decoration: BoxDecoration(
      color: Colors.grey[500]!.withOpacity(0.5),
      borderRadius: BorderRadius.circular(16)
          ),
          child: Center(
     
              child: TextFormField(
                 onChanged:  (value){_password = value;},
          controller: _passwordController,
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Icon(FontAwesomeIcons.lock, 
              size: 28,
              color: kWhile
              ),
            ),
            hintText: 'Contraseña',
            hintStyle: kBodyText,
            
          ), 
          obscureText: true,
          style: kBodyText,
          keyboardType: TextInputType.name,
          textInputAction:TextInputAction.done,
          validator: (value){
            if(value!.isEmpty || value.length < 5 ){
              return 'La contraseña es muy corta';
            }
          },
          onSaved: (value){
            _authData['password']=value!;
          },

        ),
      ),
          )
        ),
    
                    //repetir contraseña
                     Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
          height: size.height * 0.08,
          width: size.width * 0.8,
          decoration: BoxDecoration(
      color: Colors.grey[500]!.withOpacity(0.5),
      borderRadius: BorderRadius.circular(16)
          ),
          child: Center(
      
              child: TextFormField(
     
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Icon(FontAwesomeIcons.lock, 
              size: 28,
              color: kWhile
              ),
            ),
            hintText: 'Repetir contraseña',
            hintStyle: kBodyText,
            
          ), 
          obscureText: true,
          style: kBodyText,
          keyboardType: TextInputType.name,
          textInputAction:TextInputAction.done,
          validator: (value){
            if(value != _passwordController){
              return 'Las contraseñas no coinciden';
            }
          },
          onSaved: (value){
            _authData['password']=value!;
          },

        ),
      ),
          )
        ),
    
                     SizedBox(
                       height: 25,
                     ),
                     Container(
      height: size.height * 0.08,
      width: size.width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: kBlue,
      ) ,
      child: TextButton(
        child: Text('Registrarme', style: kBodyText.copyWith(fontWeight: FontWeight.bold),),
        onPressed: (){
          _submit();
         
         
        },
        )
      ),
                   //  RoundButtonRegister(buttonName: 'Registrarme'),
                     SizedBox(
                       height: 25,
                     ),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Text(
                           'Posee ya una cuenta?',
                           style: kBodyText,
                         ),
                         GestureDetector(
                              onTap:(){
                                   Navigator.pushNamed(context, '/');                 
                              },
                               child: Text(
                             'Login',
                             style: kBodyText.copyWith(color:kBlue,
                             fontWeight: FontWeight.bold),
                           ),
                         ),
                       ],
                     ),
                     SizedBox(
                       height:20
                     )
                     
                  ],),
                )
              ] ,),
          )
        )
      ],
    ) ;
  }
}