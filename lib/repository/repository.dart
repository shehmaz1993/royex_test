
import 'dart:convert';
import 'package:http/http.dart';
import 'package:royex_test/Models/model_class.dart';
import 'package:http/http.dart' as http;

class Repository{
  String url='https://alhafidh-market-test.myshopify.com/admin/api/2023-01/products/7030430367788.json';

  Future<Response> getResponse() async {
    var response=  await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "X-Shopify-Access-Token": "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",
      },

    );
    return response;
  }



  Future<List<ModelOfProduct>> fetchProducts()async{
    try{
      var response = await  getResponse();
      if(response.statusCode==200){
       var info = json.decode(response.body);
       List<dynamic> lst=info['product']['images'];
       return lst.map((element) => ModelOfProduct.fromJson(element)).toList();
      }
      else{
        throw Exception('Request Error: ${response.statusCode}');
      }
    }
    catch(ex){
      rethrow;
    }
  }
  Future<Map<String,dynamic>> fetchMap()async{
    try{
      var response =await  getResponse();

      if(response.statusCode==200){
        var info = json.decode(response.body);

        Map<String,dynamic> map=info['product'];

       return map;
      }
      else{
        throw Exception('Request Error: ${response.statusCode}');
      }
    }
    catch(ex){
      rethrow;
    }
  }



}