import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:login_app/colores.dart';
import 'package:login_app/widgets/widgets.dart';

class LoginScreen  extends StatefulWidget{
  @override
  LoginScreenState createState()=>LoginScreenState();
}

class LoginScreenState  extends State<LoginScreen>{
 
 final GlobalKey<FormState> _formKey = GlobalKey();
 Map<String, String> _authData = {'email': '', 'password': ''};

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
        BackgroundImage(image: 'assets/img/login2.jpg',),
        Scaffold(
          backgroundColor: Colors.transparent,
          body:  Column(children: [
            Flexible(child: Center(child: Text("Medical Tech", style: TextStyle(fontSize: 61.1, color: Colors.white, fontWeight: FontWeight.bold)))),
           
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [

              Container(
                 padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                         

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
                child: Icon(FontAwesomeIcons.envelope, 
                size: 28,
                color: kWhile
                ),
            ),
            hintText: 'Email',
            hintStyle: kBodyText,
            
          ),
          style: kBodyText,
          keyboardType:TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          validator: (value){
            if(value!.isEmpty || !value.contains('@')){
                return 'Invalid email';
            }
          },
          onSaved: (value){
            _authData['email']=value!;
          },

          
        ),
        
      
          ),
          
        ),
       
    ),
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
            child: Icon( FontAwesomeIcons.lock, 
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
        textInputAction: TextInputAction.done,

       validator: (value){
            if(value!.isEmpty || value.length < 5 ){
              return 'La contraseña es muy corta';
            }
          },
          onSaved: (value){
            _authData['password']=value!;
          },
      ),
          )
        ),
    )
                    ],
                  ),
  
    
                  ),
                  
              ),
              
               
/*
TextFormField(
     
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Icon(FontAwesomeIcons.envelope, 
              size: 28,
              color: kWhile
              ),
            ),
            hintText: 'Email',
            hintStyle: kBodyText,
            
          ),
          style: kBodyText,
          keyboardType:TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          validator: (value){
            if(value!.isEmpty || !value.contains('@')){
              return 'Invalid email';
            }
          },
          onSaved: (value){
            _authData['email']=value!;
          },


        ),
*/ 
                
                /*
                TextInputField(
                  icon: FontAwesomeIcons.envelope,
                  hint: 'Email',
                  inputType: TextInputType.emailAddress,
                  inputAction: TextInputAction.next,
                )
                */
               /* PasswordInput(
              icon: FontAwesomeIcons.lock,
              hint: 'Password',
              inputType: TextInputType.name,
              inputAction: TextInputAction.done,
            )*/
            
     
    
            GestureDetector(
              onTap: ()=> Navigator.pushNamed(context, 'ForgotPassword'),
              child: Text("Forgot Password", style: kBodyText ),
            ),
            SizedBox(
              height: 25,
            ),
            /*
            RoundButton(buttonName: 'Login',),
            */
           Container(
      height: size.height * 0.08,
      width: size.width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: kBlue,
      ) ,
      child: TextButton(
        child: Text('Login', style: kBodyText.copyWith(fontWeight: FontWeight.bold),),
        onPressed: (){
          _submit();
        },
        )
      ),
            SizedBox(
              height: 25
            ),
           
              ],
            ),
             Container(
              child: GestureDetector(
                onTap: ()=> Navigator.pushNamed(context, 'CreateNewAccount'),
                child: 
                  Text('Create New Account',
                  style:kBodyText),
                
              ),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(width: 1, color: kWhile))
              ),
              ),
              SizedBox(
                height: 20
              )

            
          ]
          ,)
        ),
        
      ],
    ) ;
  }
}
