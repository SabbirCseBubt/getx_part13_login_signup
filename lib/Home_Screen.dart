import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_part13_login_signup/Log_In_Controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  LogInController controller=Get.put(LogInController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Log In"),),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children:

          [

            TextFormField(

              controller: controller.emailController.value ,
              decoration: InputDecoration(
              hintText: 'Email',
            ),
            ),
           const SizedBox(height: 10,),
            TextFormField(

              controller: controller.passwordController.value ,
              decoration: InputDecoration(
                hintText: 'Password',
              ),
            ),

            const SizedBox(height: 30,),
           Obx(() {
             return  InkWell(

               onTap: ()
               {
                 controller.logInApi();
               },
               child: controller.loading.value ?CircularProgressIndicator(): Container(

                 color: Colors.green,
                 height: 45,
                 child: Center(
                   child: Text("Log In"),
                 ),
               ),);
           })


        ],
        ),
      ),

    );
  }
}
