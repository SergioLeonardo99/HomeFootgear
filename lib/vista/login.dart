import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:product_rain/vista/home.dart';
import 'package:product_rain/vista/inicio.dart';
import 'package:product_rain/vista/inicio_calzado.dart';
import 'package:product_rain/vista/registration.dart';
import 'package:fluttertoast/fluttertoast.dart';

class login extends StatefulWidget {
  const login({ Key? key }) : super(key: key);
      
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {

  // clave del formulario 
  final _formClave = GlobalKey<FormState>();

  //Editar Controlador
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

 //firebase
 final _auth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {

    // campo del email
    final emailCampo = TextFormField(

      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value){
        if(value!.isEmpty){
          return ("Por Favor Digite Su Correo");
        }
        //validacion del correo electronico 
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Ingrese Un Correo valido");
        }
        return null;
      },

      onSaved: (value){

        emailController.text = value!;

      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.email),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Email",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );


   
    // campo dela contraseña
    final passwordCampo = TextFormField(

      autofocus: false,
      controller: passwordController,
      obscureText: true,
    
      validator: (value){
        RegExp regex = new RegExp(r'^.{6,}$');
        if (value!.isEmpty){
          return ("La Contraseña Es Obligatoria");
          
        }
        if (!regex.hasMatch(value)) {
          return ("Digite La Contraseña Valida(Min. 6 caracteres)");
          
        }
      },

      onSaved: (value){

        passwordController.text = value!;

      },
      textInputAction: TextInputAction.done,
       decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Contraseña",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  


    final loginBoton = Material(

      elevation: 5,
      borderRadius: BorderRadius.circular(25),
      color: Colors.blue[900],
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,

        onPressed: (){ 
          registro(emailController.text, passwordController.text);  
        },
        child: Text(
        "Iniciar sesión",
        textAlign: TextAlign.center,
        style: TextStyle(

          fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),

    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(38.0),
              child: Form(
                key: _formClave,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                    children:<Widget>[
                      SizedBox(
                        height: 155,
                        child: Image.asset(
                          "assets/logo.png",
                          fit: BoxFit.contain,
                      )),

                      SizedBox(height: 60),
                      emailCampo,
                      SizedBox(height: 40),
                      passwordCampo,
                      SizedBox(height: 35),
                      loginBoton,
                      SizedBox(height: 43),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("No tiene ninguna cuenta?.  "),
                          GestureDetector(onTap: () {
                            Navigator.push(
                              context, MaterialPageRoute(
                                builder: (context) => 
                                RegistroScreen()));
                    
                          },
                          
                          child: Text(
                          "Crear una.", 
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.blue[900],
                              fontSize: 15),
                              ),
                              )
                        ])
                        
                    ],    
                  ),
                ),
            ),

            ),
          ),
        ),
     
    );
  }

  //funciones del login

  void registro(String email, String password) async{
    if (_formClave.currentState!.validate()) {
      await _auth
      .signInWithEmailAndPassword(email: email, password: password)
      .then((uid) => {
         Fluttertoast.showToast(msg: "Sesion Exitosa"),
         Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => paginaInicio())),
       }).catchError((e)
        {
          Fluttertoast.showToast(msg: e!.message);

        }

       );
      
    }
  }
}