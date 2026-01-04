import 'package:flutter/material.dart';
import 'package:news/constants/app_sizes.dart';
import 'package:news/features/auth/register-screen.dart';
import 'package:news/features/core/datasource/local-data/Preferences_manager.dart';
import 'package:news/features/core/widgets/custom_text_form_faild.dart';
import 'package:news/features/main/main-screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _form = GlobalKey();
  String?errorMessage;
  bool isLoading=false;
  void Login()async{
setState(() {
  isLoading=true;
  errorMessage=null;
});
Future.delayed(Duration(seconds: 3));
  final savedEmali= PreferencesManager().getString("user-email");
  final savedPassword=PreferencesManager().getString("user-password");
if(savedEmali==null&&savedPassword==null){
  //هنا لازم اول اشى تعمل ريجستر
  setState(() {
    errorMessage="No Account Found Please Register First";
    isLoading=false;
  });
      return; // مهم جداً حتى ما يكمل الكود
}
//فى حالة يلى دخلته ما بساوى القيم الحقيقية المدخلة
if(savedEmali!=emailController.text&&savedPassword!=passwordController.text){
  setState(() {
    errorMessage="Incorrect Email or Password";
    isLoading=false;
  });
      return; // مهم جداً حتى ما يكمل الكود
}
await   PreferencesManager().setBool("is-logged-in", true);
setState(() {
  errorMessage=null;
  isLoading=false;
});


Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Mainscreen()),  
);



 
  
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
          padding:  EdgeInsets.all(AppSizes.r16),
          child: Form(
            key: _form,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Image.asset('assets/img/logo.png', height: AppSizes.h45)),
                SizedBox(height: AppSizes.h40),
                Text(
                  "Welcome to Newts",
                  style: TextStyle(fontSize: AppSizes.sp20, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: AppSizes.h24),
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
                
                  
                SizedBox(height: AppSizes.h24),
                CustomTextFormField(
                  controller: passwordController,
                  hintText: '*************',
                  title: 'Password',
                  obscureText: true,
                  validator: (value){
                   
                    if (value == null || value.isEmpty) {
                      return "please Enter password";
                    }
                    final RegExp emailRegExp = RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&]).{6,20}$');
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
                        Login();
                      }
                    },
                    child:isLoading?CircularProgressIndicator():Text('Sign In'),
                  ),
                ),
                SizedBox(height:AppSizes.ph24 ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don’t have an account ?",
                      style: TextStyle(fontSize: AppSizes.sp14),
                    ),
                    SizedBox(width: AppSizes.pw8),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Registerscreen(),
                          ),
                        );
                      },
                      child: Text(
                        "Sign Up",
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
