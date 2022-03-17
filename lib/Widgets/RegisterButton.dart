import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messenger_app/Providers/RegisterProviders.dart';
import 'package:messenger_app/networkings/Networking.dart';
import 'package:provider/provider.dart';

import '../RouteGenerator.dart';
import 'FormWidget.dart';

class RegisterButton extends StatefulWidget {
  @override
  _RegisterButtonState createState() => _RegisterButtonState();
}

class _RegisterButtonState extends State<RegisterButton>
    with TickerProviderStateMixin {
  Networking networking = new Networking();

  FirebaseAuth auth = FirebaseAuth.instance;

  //champ de texte

  String uid;

  //creer une variable contenant une chaine(l'erreur sur le test userCredentiel)

  FormWidget form = new FormWidget();
  final formkey = GlobalKey<FormState>();

  String statut = "online";

  //networking.

  AnimationController animationController;

  Animation button;
  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    button = new Tween(begin: 320.0, end: 70.0).animate(new CurvedAnimation(
        parent: animationController, curve: new Interval(0.0, 0.250)));
  }

  @override
  Widget build(BuildContext context) {
    print(animationController.value);
    return Consumer<RegisterProviders>(
      builder: (_, model, __) {
        return AnimatedBuilder(
          animation: animationController,
          builder: (context, widget) {
            return GestureDetector(
              //key: model.keyForm,
              onTap: () async {
                //ceci va nous permettre de valider notre formulaire si on clique sur le bouton
                //register et va retourner un booleen
                //si cest vrai le formulaire est valide
                //sinon il est pas
                // print(model);

                if (model.keyForm.currentState.validate()) {
                  print("ok");
                  print(model.emailtextEditingController.text);
                  print(model.passwordtextEditingController.text);
                  print(model.usernametextEditingController.text);
                  print(model.pickedfile);
                  print("ca passe");
                  int result = await Networking.registerwithEmailAndPassword(
                      model.emailtextEditingController.text,
                      model.passwordtextEditingController.text);
                  int connect = await Networking.login();

                  if (result == 1) {
                    print("OK NICKEL");
                     print("******* SAVE DATAS INTO DATABASE********");
                     Networking.saveUserToDatabase(
                         model.emailtextEditingController.text,
                         model.usernametextEditingController.text,
                         model.passwordtextEditingController.text,
                         model.pickedfile);
                    print("******* SAVE DATAS INTO DATABASE********");
                    Networking.saveUserToDatabaseContact(
                        model.emailtextEditingController.text,
                        model.usernametextEditingController.text,
                        statut,
                        model.messagetextEditingController.text,
                        model.pickedfile);
                  } else {
                    print("NOT NICKEL");
                    print("SOMETHING WENT WRONG");
                  }
                  Navigator.pushNamed(context, RouteGenerator.homeScreen);
                }
                //passer a la page home ou connexion
                //int rsltconnect = await Networking.signWithEmailAndPassword(
                // model.emailtextEditingController.text,
                //model.passwordtextEditingController.text);
              },
              child: Container(
                width: button.value,
                height: 50,
                alignment: FractionalOffset.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Colors.blue),
                child: button.value > 80
                    ? Text(
                        "Get started",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )
                    : Center(
                        child: CircularProgressIndicator(
                        backgroundColor: Colors.white,
                      )),
              ),
            );
          },
        );
      },
    );
  }
}
