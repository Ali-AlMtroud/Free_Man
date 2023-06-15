// ----- STRINGS ------

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:google_fonts/google_fonts.dart';

//import 'models/product.dart';
// يجب تغيير هاد حسب الip
const baseURL = 'http://192.168.43.47:8000/api';
const imageURL = 'http://192.168.43.47:8000';
//--------Auth URL------------
const loginURL = baseURL + '/login';
const registerURL = baseURL + '/registeruser';
const logoutURL = baseURL + '/logout';
const userURL = baseURL + '/user';
//--------Product URL----------
const AllproductURL = baseURL + '/show_all_product';
const showfavoriteURL = baseURL + '/showfav';

const AddToFavoriteURL = baseURL + '/AddToFavorite';
const UnlikeURL = baseURL + '/unlike';
const RemoveFromFavoriteURL = baseURL + '/RemoveFromFavorite';


const MyProductURL = baseURL + '/show_my_products';
const OneproductURL = baseURL + '/show_single_product';
const rate_productURL = baseURL + '/rate_product';

//--------Comment URL----------
const commentsURL = baseURL + '/show_comments';
const CreateComment = baseURL + 'comment/store';

// ----- Errors -----
const serverError = 'Server error';
const unauthorized = 'Unauthorized';
const somethingWentWrong = 'Something went wrong, try again!';

TextStyle textstyel({size, color, weight}) {
  return TextStyle(
      fontFamily: 'RobotoCondensed',
      fontSize: size,
      fontWeight: weight,
      color: color);
}

Widget CustomButton(icon, function) {
  return InkWell(
    onTap: function,
    child: Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            offset: Offset(2, 5),
            blurRadius: 10,
          )
        ],
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Icon(icon),
    ),
  );
}


showSnackBar(BuildContext context, message) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.red,
      content: Container(

        child: Text(message,style:GoogleFonts.poppins(fontSize: 20,color: Colors.white),),
      )));
}

Widget MyProductItemIcon(IconData iconData, String text) {
  return Row(
    children: <Widget>[
      Icon(iconData, color: Colors.white),
      SizedBox(width: 2),
      Text(text, style: TextStyle(color: Colors.white))
    ],
  );
}
