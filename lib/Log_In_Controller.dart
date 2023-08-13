
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class LogInController extends GetxController
{

  final emailController=TextEditingController().obs;
  final passwordController=TextEditingController().obs;
  RxBool loading=false.obs;

  void logInApi()
  async{
    loading.value=true;
    
   try{
     final response= await post(Uri.parse('https://reqres.in/api/login'),
         body: {
           'email':emailController.value.text,
           'password':passwordController.value.text



         }





     );

     var data=jsonDecode(response.body);


     if(response.statusCode==200)
     {
       loading.value=false;

       Get.snackbar('Log in Sucessfull',"Congratulations");


     }

     else
     {
       loading.value=false;
       Get.snackbar('Log in Failed', data['error']);



     }
   }
   catch(e)
   {
     loading.value=false;
     Get.snackbar('Error in Failed', e.toString());
   }




  }





}