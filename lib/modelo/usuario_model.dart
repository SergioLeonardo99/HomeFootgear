class UsuarioModel{
  String? uid;
  String? email;
  String? primerNombre;
  String? segundoNombre;


  UsuarioModel({this.uid, this.email, this.primerNombre, this.segundoNombre});

  // datos instanciados que el servididor recibe

  factory UsuarioModel.fromMap(map){
    return UsuarioModel(
       uid: map['uid'],
       email: map['email'],
       primerNombre: map['primerNombre'],
       segundoNombre: map['segundoNombre'],

    );    

  }
    // enviar datos al server 

    Map<String, dynamic> toMap(){
      return{
        'uid': uid,
        'email': email,
        'primerNombre': primerNombre,
        'segundoNombre': segundoNombre,
      };
    }

}