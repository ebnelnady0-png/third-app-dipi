import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/home/home_view.dart';
import '../auth_cubit/auth_cubit.dart';
import '../register/register.dart';

class Login extends StatelessWidget {
  const Login({super.key});
  @override
  Widget build(BuildContext context)  {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,

          title: Text(
            "login",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w400,
              color: Color(0xFF2563EB), // تم التغيير للأزرق
            ),
          ),
          centerTitle: true,
        ),
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is RegisterFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.redAccent, // تم التغيير لدرجة ألطف
                  content: Text(state.msg),
                ),
              );
            }

            if (state is RegisterSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.green,
                  content: Text('Register Success'),
                ),
              );

              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const HomeView()),
              );
            }
          },
          builder: (context, state) {
            final loadingState = state is RegisterLoading;
            final cubit = BlocProvider.of<AuthCubit>(context);
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 60),
                    Text(
                      "Enter your Email and \npassword to access your account",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF475569), // تم التغيير للرمادي الداكن
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: cubit.emailRegisterController,
                      decoration: InputDecoration(
                        fillColor: const Color(0xFFF1F5F9), // تم التغيير لرمادي فاتح جداً
                        filled: true,
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF2563EB)), // تم التغيير للأزرق
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFF1F5F9)), // تم التغيير لرمادي فاتح
                        ),
                        hintText: 'Email',
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: cubit.passwordRegisterController,
                      obscureText: true,
                      decoration: InputDecoration(
                        fillColor: const Color(0xFFF1F5F9), // تم التغيير لرمادي فاتح جداً
                        filled: true,
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF2563EB)), // تم التغيير للأزرق
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFF1F5F9)), // تم التغيير لرمادي فاتح
                        ),
                        hintText: 'Password',
                      ),
                    ),
                    SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Forgot Password",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF2563EB), // تم التغيير للأزرق
                        ),
                      ),
                    ),
                    SizedBox(height: 30),

                    ElevatedButton(
                      onPressed: loadingState
                          ? null
                          : () {
                        cubit.signUp();
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size.fromHeight(50),
                        backgroundColor: const Color(0xFF2563EB), // تم التغيير للأزرق
                      ),
                      child: loadingState
                          ? const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                          : const Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "don't have an account?",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF2563EB), // تم التغيير للأزرق
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => const RegisterView()),
                            );
                          },
                          child: Text(
                            " Register",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF2563EB), // تم التغيير للأزرق
                            ),
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}