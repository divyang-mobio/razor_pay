import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oktoast/oktoast.dart';
import 'package:razor_pay/controller/razor_pay_bloc.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<Razorpay>(
      create: (context) => Razorpay(),
      child: BlocProvider<RazorPayBloc>(
        create: (context) =>
            RazorPayBloc(RepositoryProvider.of<Razorpay>(context)),
        child: OKToast(
          child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(primarySwatch: Colors.blue),
            home: const MyHomePage(title: 'Flutter Demo Home Page'),
          ),
        ),
      ),
    );
  }
}
