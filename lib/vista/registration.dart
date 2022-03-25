import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:product_rain/modelo/usuario_model.dart';
import 'package:product_rain/vista/home.dart';
import 'package:product_rain/vista/login.dart';
class RegistroScreen extends StatefulWidget {
  const RegistroScreen({ Key? key }) : super(key: key);

  @override
  _RegistroScreenState createState() => _RegistroScreenState();
}

class _RegistroScreenState extends State<RegistroScreen> {

  final _auth = FirebaseAuth.instance;
  //obtner la contraseña
  final _formClave = GlobalKey<FormState>();
  // editar controlador
  
  final oneNameEditecontrolador = new TextEditingController();
  final twoNameEditecontrolador = new TextEditingController();
  final emailEditecontrolador = new TextEditingController();
  final passwordEditecontrolador = new TextEditingController();
  final passwordConfirmEditecontrolador = new TextEditingController();
 

  @override
  Widget build(BuildContext context) {

    //campo para el primer nombre

    final oneNameCampo = TextFormField(

      autofocus: false,
      controller: oneNameEditecontrolador,
      keyboardType: TextInputType.name,
      validator: (value){
        RegExp regex = new RegExp(r'^.{3,}$');
        if (value!.isEmpty){
          return ("El Primer Nombre Es Obligatorio");
          
        }
        if (!regex.hasMatch(value)) {
          return ("Digite Un Nombre Valido(Min. 3 caracteres)");
          
        }
      },
      onSaved: (value){

        oneNameEditecontrolador.text = value!;

      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.account_circle),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Nombre",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );

    //espacio para el segundo nombre

    final twoNameCampo= TextFormField(

      autofocus: false,
      controller: twoNameEditecontrolador,
      keyboardType: TextInputType.name,
       validator: (value){
        if (value!.isEmpty){
          return ("El Segundo Nombre Es Obligatorio");
          
        }
        return null;
      },

      onSaved: (value){

       twoNameEditecontrolador.text = value!;

      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.account_circle_sharp),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Apellido",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
   
      // espacio para el correo

    final emailCampo = TextFormField(

      autofocus: false,
      controller: emailEditecontrolador,
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

        emailEditecontrolador.text = value!;

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

      // campo para la contraseña
    final passwordCampo = TextFormField(

      autofocus: false,
      controller: passwordEditecontrolador,
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

        passwordEditecontrolador.text = value!;

      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Contraseña",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
 
    // campo confirmar contraseña
    final confirmPasswordCampo = TextFormField(

      autofocus: false,
      controller: passwordConfirmEditecontrolador,
      obscureText: true,
      validator: (value){
        if (passwordConfirmEditecontrolador.text.length > 6 && passwordConfirmEditecontrolador.text !=value) {
          return "Las Contraseñas no coinciden";
        }
        return null;
      },

      onSaved: (value){

        passwordConfirmEditecontrolador.text = value!;

      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key_sharp),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Confirme su contraseña",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );

    //Boton registro 

    final registroBoton = Material(

      elevation: 5,
      borderRadius: BorderRadius.circular(25),
      color: Colors.blue[900],
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,

        onPressed: (){
          signUp(emailEditecontrolador.text, passwordEditecontrolador.text);
        },
        child: Text(
        "Registrarte",
        textAlign: TextAlign.center,
        style: TextStyle(

          fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),

    );


     return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.blue[900]),
        onPressed: (){
          // ir hacia atras
          Navigator.of(context).pop();
        },
        ),

      ),
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

                      SizedBox(height: 45),
                      oneNameCampo,
                      SizedBox(height: 20),
                      twoNameCampo,
                      SizedBox(height: 20),
                      emailCampo,
                      SizedBox(height: 20),
                      passwordCampo,
                      SizedBox(height: 20),
                      confirmPasswordCampo,
                      SizedBox(height: 20),
                      registroBoton,
                      SizedBox(height: 15),
                    ],    
                  ),
                ),
            ),

            ),
          ),
        ),
     
    );
  }

  void signUp (String email, String password) async{
    if (_formClave.currentState!.validate()) {
      await _auth
      .createUserWithEmailAndPassword(email: email, password: password)
      .then((value) => {postDetailsToFirestore()})
      .catchError((e){
        Fluttertoast.showToast(msg: e!.message);
      });
      
    }
  }

  postDetailsToFirestore() async{

    // llamar a firestore
    //llamar alos controladores de los datos del usurio
    // enviar los datos al servidor

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? usuario = _auth.currentUser;

    UsuarioModel usuarioModel = UsuarioModel();

    // Cuando se escriban los valores

    usuarioModel.email = usuario!.email;
    usuarioModel.uid = usuario.uid;
    usuarioModel.primerNombre = oneNameEditecontrolador.text;
    usuarioModel.segundoNombre = twoNameEditecontrolador.text;


    await firebaseFirestore
    .collection("usuarios")
    .doc(usuario.uid)
    .set(usuarioModel.toMap());

    Fluttertoast.showToast(msg: "Cuenta creada con exito: )");

    Navigator.pushAndRemoveUntil((context),
    MaterialPageRoute(builder: (context) => login()),
    (route) => false);





  }
}