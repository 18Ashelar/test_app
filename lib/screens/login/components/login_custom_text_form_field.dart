import 'package:flutter/material.dart';
 
class LoginCustomTextFormField extends StatelessWidget {
 const LoginCustomTextFormField(
     {Key? key,
     this.height,
     this.width,
     this.validate,
     this.controller,
     required this.textInputType,
     this.autovalidateMode,
     required this.obscureText,
     this.focusNode,
     this.onChanged,
     this.lableTextStyle,
     this.error,
     required this.readOnly,
     this.disableColor,
     this.suffixText,
     this.inputBorder,
     this.label})
     : super(key: key);
 
 final double? height;
 final double? width;
 final String? label;
 final bool obscureText;
 final String? Function(String?)? validate;
 final String Function(String?)? onChanged;
 final String? suffixText;
 
 final TextStyle? lableTextStyle;
 final FocusNode? focusNode;
 
 final AutovalidateMode? autovalidateMode;
 final TextEditingController? controller;
 //For Disable textFormField
 final Color? disableColor;
 final InputBorder? inputBorder;
 final bool readOnly;
 final TextInputType textInputType;
 final String? error;
 
 @override
 Widget build(BuildContext context) {
   return SizedBox(
     //margin: const EdgeInsets.only(left: 49.0, right: 36.0),
     width: width,
     height: height,
     child: TextFormField(
       controller: controller,
       autovalidateMode: autovalidateMode,
       enabled: readOnly,
       focusNode: focusNode,
       cursorColor: Theme.of(context).colorScheme.secondary,
       keyboardType: textInputType,
       onChanged: onChanged,
       validator: validate,
       obscureText: obscureText,
       decoration: InputDecoration(
         suffix: Text(
           suffixText ?? " ",
         ),
         labelText: label,
         isDense: true,
      
        hintStyle: TextStyle(
          fontFamily: "Roboto",
          color: const Color(0xFF000000).withOpacity(0.6),
          fontSize: 16.0,
        ),
        errorStyle: const TextStyle(
          fontFamily: "Roboto",
          color: Colors.red,
          fontSize: 14.0,
        ),
        suffixStyle: TextStyle(
            fontFamily: "Roboto",
            color: const Color(0xFF000000).withOpacity(0.6),
            fontSize: 16.0),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12),
        labelStyle: TextStyle(
          fontFamily: "Roboto",
          fontSize: 16.0,
          color: const Color(0xFF000000).withOpacity(0.6),
        ),
        enabledBorder:const OutlineInputBorder(
            borderSide: BorderSide(color:  Color(0xFF79747E),),
            borderRadius:  BorderRadius.all(Radius.circular(5.0))),
        focusedBorder:const OutlineInputBorder(
            borderSide: BorderSide(color:  Color(0xFF79747E),),
            borderRadius:  BorderRadius.all(Radius.circular(5.0))),
        border:const OutlineInputBorder(
            borderSide: BorderSide(color:  Color(0xFF79747E),),
            borderRadius:  BorderRadius.all(Radius.circular(5.0))),
       ),
     ),
   );
 }
}
 
