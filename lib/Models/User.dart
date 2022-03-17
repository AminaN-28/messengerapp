class User {
  String userName;
  String image;

  String email;
  String password;

  String uid;
  String statut;
  User(this.uid,this.statut, this.userName, this.email, this.password, this.image);

  //String get statut => null;

 User.fromJson(dynamic json){
       uid: json['uid'];
       userName: json['username'];
       email: json['email'];
       urlImage: json['password'];
       status : json['status'];
     
   }


 
}
