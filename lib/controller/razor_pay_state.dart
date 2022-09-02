part of 'razor_pay_bloc.dart';

abstract class RazorPayState {}

class RazorPayInitial extends RazorPayState {}

class PaymentSuccess extends RazorPayState {}

class PaymentFail extends RazorPayState {}

class RazorPayBlocError extends RazorPayState {}

