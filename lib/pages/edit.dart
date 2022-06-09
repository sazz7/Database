import 'package:flutter/material.dart';

class Edit extends StatefulWidget {
  const Edit({Key? key}) : super(key: key);
  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {

  final formkey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var name = "";
  var email = "";
  var password = "";

  void dispose(){
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  addUser(){}
  clearText(){}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit"),
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
              child: Text("Sing up"),
            )
          ],),
        ),
      ),
    );
  }
}
