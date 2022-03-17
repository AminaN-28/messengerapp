import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  String label;
  Icon icon;
  FormFieldValidator<String> validator;
  TextEditingController textEditingController = TextEditingController();
  TextFormFieldWidget(this.textEditingController, this.label, this.icon, this.validator);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: TextFormField(
        controller: textEditingController,
        validator: (validator) ,
        // {
        //   return validator.isEmpty || validator.length < 2 ? 'Cannot be empty or not correct. Verify your datas'
        //       : null;
        //   //si ce que le user a saisi est null ou inferieur a 2caracteres retourner null
        // },

        decoration: new InputDecoration(
            border: new OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(30.0),
              ),
            ),
            filled: true,
            hintStyle: new TextStyle(color: Colors.black),
            hintText: label,
            prefixIcon: icon,
            fillColor: Colors.white70),
      ),
    );
  }
}
