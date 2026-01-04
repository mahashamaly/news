import 'package:flutter/material.dart';
import 'package:news/constants/app_sizes.dart';
import 'package:news/features/auth/login-screen.dart';
import 'package:news/features/core/datasource/local-data/Preferences_manager.dart';
import 'package:news/features/core/widgets/custom_text_form_faild.dart';
import 'package:news/features/home/home-screen.dart';
import 'package:news/features/main/main-screen.dart';

class Registerscreen extends StatefulWidget {
  Registerscreen({super.key});

  @override
  State<Registerscreen> createState() => _RegisterscreenState();
}

class _RegisterscreenState extends State<Registerscreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswardController = TextEditingController();

  final GlobalKey<FormState> _form = GlobalKey();
  String?errorMessage;
  bool isLoading=false;

  void register()async{
setState(() {
  isLoading=true;
  errorMessage=null;
});
Future.delayed(Duration(seconds: 3));
  final savedEmali= PreferencesManager().getString("user-email");
  //هنا يعنى فى ايميل متسجل اله من قبل
if(savedEmali!=null&&savedEmali==emailController.text.trim()){
  setState(() {
    errorMessage="User ALready Register";
    isLoading=false;
  });

}else{
//هنا أول مرة يسجل المستخدم
// بما أنو اول مرة يسجل راح احفظ بياناته
await  PreferencesManager().setString("user-email", emailController.text.trim());
await  PreferencesManager().setString("user-password", emailController.text.trim());
await   PreferencesManager().setBool("is-logged-in", true);

setState(() {
  isLoading=false;
});
Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Mainscreen()),  
);
}
  
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/background-img.png'),
          ),
        ),

        child: Padding(
          padding: EdgeInsets.all(AppSizes.r16),
          child: Form(
            key: _form,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Image.asset('assets/img/logo.png', height: AppSizes.h45)),
                SizedBox(height: AppSizes.ph40),
                Text(
                  "Welcome to Newts",
                  style: TextStyle(fontSize: AppSizes.sp20, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: AppSizes.ph24),
                CustomTextFormField(
                  controller: emailController,
                  hintText: 'maha@gmail.com',
                  title: 'Email',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please Enter Email";
                    }
                    final RegExp emailRegExp = RegExp(
                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                    );
                    if (!emailRegExp.hasMatch(value)) {
                      return "please Enter valid  Email";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: AppSizes.ph24),
                CustomTextFormField(
                  controller: passwordController,
                  hintText: '*************',
                  title: 'Password',
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please Enter password";
                    }
                    final RegExp emailRegExp = RegExp(
                      r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&]).{6,20}$',
                    );
                    if (!emailRegExp.hasMatch(value)) {
                      return "please Enter valid  password";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: AppSizes.ph24),
                CustomTextFormField(
                  controller: confirmPasswardController,
                  obscureText: true,
                  hintText: '*************',
                  title: "Confirm Passward",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please Enter password";
                    }
                    final RegExp emailRegExp = RegExp(
                      r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&]).{6,20}$',
                    );
                    if (!emailRegExp.hasMatch(value)) {
                      return "please Enter valid  password";
                    } else {
                      return null;
                    }
                  },
                ),

                 if(errorMessage!=null)
                   Padding(
                     padding:  EdgeInsets.symmetric(vertical: AppSizes.ph8),
                     child: Text(errorMessage!,style: TextStyle(color: Colors.red),),
                   ),
                  



                SizedBox(height: AppSizes.ph24),
                SizedBox(
                  width: double.infinity,
                  height: AppSizes.h48,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_form.currentState?.validate() ?? false) {
                        return register();
                      }
                    },
                    child:isLoading?CircularProgressIndicator(): Text('Sign Up'),
                  ),
                ),
                SizedBox(height: AppSizes.ph24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Have an account ?", style: TextStyle(fontSize: AppSizes.sp14)),
                    SizedBox(width: AppSizes.pw8),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          fontSize: AppSizes.sp16,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

