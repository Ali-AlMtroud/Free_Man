import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:free_man/models/api_response.dart';
import 'package:free_man/models/product.dart';
import 'package:free_man/models/product_favorite.dart';
import 'package:free_man/services/user_service.dart';
import 'package:http/http.dart' as http;
import 'package:free_man/core/config/constant.dart';

// get all product
Future<ApiResponse> getAllProduct() async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    final response = await http.get(
      Uri.parse(AllproductURL),
      headers: {'Accept': 'application/json', 'Authorization': 'Bearer $token'},
    );

    switch (response.statusCode) {
      case 200:
        apiResponse.data = jsonDecode(response.body)["data"].map((p) {
          return Product.fromJson(p);
        }).toList();

        break;
      case 401:
        apiResponse.error = unauthorized;
        break;
      default:
        apiResponse.error = somethingWentWrong;
        break;
    }
  } catch (e) {
    apiResponse.error = serverError;
  }
  return apiResponse;
}

// gat one product
Future<ApiResponse> getProduct(productId) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    final response = await http.get(Uri.parse('$OneproductURL/$productId'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        });

    switch (response.statusCode) {
      case 200:
        apiResponse.data = Product.fromJson(jsonDecode(response.body)['data']);

        break;
      case 401:
        apiResponse.error = unauthorized;
        break;
      default:
        apiResponse.error = somethingWentWrong;
        break;
    }
  } catch (e) {
    apiResponse.error = serverError;
  }
  return apiResponse;
}



//-----search product
Future<ApiResponse> searchProduct(String text) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    print(text);
    final response = await http.get(Uri.parse('$baseURL/searchPN/$text'), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    }, );

    switch (response.statusCode) {
      case 200:
        apiResponse.data = jsonDecode(response.body)['massage']
            .map((p) => Product.fromJson(p))
            .toList();

        apiResponse.data as List<dynamic>;
        break;
      case 401:
        apiResponse.error = unauthorized;
        break;
      case 404:
        apiResponse.error = "not found";
        break;
      default:
        apiResponse.error = somethingWentWrong;
        break;
    }
  } catch (e) {
    print(e);
    apiResponse.error = serverError;
  }
  return apiResponse;
}

// Like or unlike post

Future<ApiResponse> likeProduct(int productId) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    final response = await http
        .get(Uri.parse('$baseURL/like/$productId'), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    },
    );
    switch (response.statusCode) {
      case 200:
        apiResponse.data = jsonDecode(response.body);
        print('success like');
        break;
      case 401:
        apiResponse.error = unauthorized;
        break;

      default:
        apiResponse.error = somethingWentWrong;
        break;
    }
  } catch (e) {
    apiResponse.error = serverError;
  }
  return apiResponse;
}
Future<ApiResponse> unlike(int productId) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    final response = await http
        .get(Uri.parse('$UnlikeURL/$productId'), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    },
    );
    switch (response.statusCode) {
      case 200:
        apiResponse.data = jsonDecode(response.body);
        print('success like');
        break;
      case 401:
        apiResponse.error = unauthorized;
        break;

      default:
        apiResponse.error = somethingWentWrong;
        break;
    }
  } catch (e) {
    apiResponse.error = serverError;
  }
  return apiResponse;
}
Future<ApiResponse> AddToFavorite(int productId) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    final response = await http
        .get(Uri.parse('$AddToFavoriteURL/$productId'), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    },
    );
    switch (response.statusCode) {
      case 200:
        apiResponse.data = jsonDecode(response.body);
        print('success like');
        break;
      case 401:
        apiResponse.error = unauthorized;
        break;
      case 404:
        apiResponse.error = jsonDecode(response.body)['data'];
        break;
      default:
        apiResponse.error = somethingWentWrong;
        break;
    }
  } catch (e) {
    apiResponse.error = serverError;
  }
  return apiResponse;
}
Future<ApiResponse> removeFromFavorite(int productId) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    final response = await http
        .delete(Uri.parse('$RemoveFromFavoriteURL/$productId'), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    },
    );
    switch (response.statusCode) {
      case 200:
        apiResponse.data = jsonDecode(response.body);

        break;
      case 401:
        apiResponse.error = unauthorized;
        break;

      default:
        apiResponse.error = somethingWentWrong;
        break;
    }
  } catch (e) {
    apiResponse.error = serverError;
  }
  return apiResponse;
}

Future<ApiResponse> showfavorite() async {

  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    final response = await http.get(
      Uri.parse(showfavoriteURL),
      headers: {'Accept': 'application/json', 'Authorization': 'Bearer $token'},
    );
     print(response.body);
    switch (response.statusCode) {
      case 200:
        apiResponse.data = jsonDecode(response.body)["data"].map((p) {
          return ProductFavorite.fromJson(p);
        }).toList();

        break;
      case 401:
        apiResponse.error = unauthorized;
        break;
      default:
        apiResponse.error = somethingWentWrong;
        break;
    }
  } catch (e) {
    print(e);
    apiResponse.error = serverError;
  }
  return apiResponse;
}


//--------get my product--------
Future<ApiResponse> getMyProduct() async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    final response = await http.get(Uri.parse('$baseURL/show_my_products'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        });
    print(response.body);
    switch (response.statusCode) {
      case 200:
        apiResponse.data = jsonDecode(response.body)["data"].map((p) {
          return Product.fromJson(p);
        }).toList();

        break;
      case 401:
        apiResponse.error = unauthorized;
        break;
      case 404:
        final errors = jsonDecode(response.body)['asd'];
        apiResponse.error = errors[errors.keys.elementAt(0)][0];
        break;
      default:
        apiResponse.error = somethingWentWrong;
        break;
    }
  } catch (e) {
    print(e);
    apiResponse.error = serverError;
  }
  return apiResponse;
}


Future<ApiResponse> createComment(String productId, String star) async {

  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    final response = await http.post(Uri.parse('$rate_productURL'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        }, body: {
          "star": star,
          "product_id":productId

    });

print(response.body);
    switch(response.statusCode){
      case 200:
        apiResponse.data = jsonDecode(response.body);
        break;
      case 403:
        apiResponse.error = jsonDecode(response.body);
        break;
      case 401:
        apiResponse.error = unauthorized;
        break;
      case 404:
        apiResponse.error = jsonDecode(response.body)['data'];
        break;
      default:
        apiResponse.error = somethingWentWrong;
        break;
    }
  }
  catch (e){
    print(e);
    apiResponse.error = serverError;
  }
  return apiResponse;
}
