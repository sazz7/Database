import 'package:flutter/material.dart';

class AddUser extends StatefulWidget {
  @override
  _AddUserState createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  // FormState
  final GlobalKey<FormState>formkey = GlobalKey<FormState>();
  var name ="";
  var email ="";
  var password ="";

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose(){
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  addUser(){

  }

  clearText(){
    nameController.clear();
    emailController.clear();
    passwordController.clear();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User add"),
      ),
      body: Form(
        key: formkey,
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: "Name:",
                labelText: "Name",
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 2),
                )
              ),
              controller: nameController,
              // validator required
              validator: (value){
                if (value == null || value.isEmpty){
                  return "Please Enter Name";
                }
                return null;
              },
            ),
            SizedBox(height: 20,),
            // Email
            TextFormField(
              decoration: InputDecoration(
                  hintText: "Email id:",
                  labelText: "Email",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 5,color: Colors.red),
                  )
              ),
              controller: emailController,
              validator: (value){
                if (value == null || value.isEmpty){
                  return "Please Enter Email id";
                }
                // clear condition
                else if(!value.contains("@")){
                  return "Please Valid Email id";
                }
                return null;
              },
            ),
            SizedBox(height: 20,),
            // password
            TextFormField(
              //autofocus: false,
              obscureText: true,
              decoration: InputDecoration(
                  hintText: "Password:",
                  labelText: "Password",

                  /*errorStyle: (
                  TextStyle(color: Colors.red)
                  ),*/

                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 2),
                  )
              ),
              controller: passwordController,
              validator: (value){
                if (value == null || value.isEmpty){
                  return "Please Enter Password";
                }
                else if(value.length < 6){
                  return "Password minimum of 6 characters ";
                }
                return null;
              },
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MaterialButton(
                  color: Colors.greenAccent,
                  onPressed: (){
                    if(formkey.currentState!.validate()){
                      setState(() {
                        name = nameController.text;
                        email = emailController.text;
                        password = passwordController.text;
                        addUser();
                        clearText();
                      });
                    }
                  },
                  child: Text("Register"),
                ),
                MaterialButton(
                  color: Colors.greenAccent,
                  onPressed: (){
                    clearText();
                  },
                  child: Text("Reset"),
                ),
              ],
            )
          ],),
        ),
      ),
    );
  }
}