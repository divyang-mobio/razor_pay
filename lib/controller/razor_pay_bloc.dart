import 'package:bloc/bloc.dart';
import 'package:oktoast/oktoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

part 'razor_pay_event.dart';

part 'razor_pay_state.dart';

class RazorPayBloc extends Bloc<RazorPayEvent, RazorPayState> {
  final razorpay = Razorpay();

  RazorPayBloc() : super(RazorPayInitial()) {
    on<CallPaymentMethod>((event, emit) {
      print("bloc");
      var options = {
        "key": "rzp_test_4mqsa1rV46SkJv",
        "amount": 1000 * 100,
        "name": "Test",
        "description": "Payment for the some test",
        "timeout": "180",
        "theme.color": "#03be03",
        "currency": "INR",
        "prefill": {
          "contact": "+910000000000",
          "email": "divyangp.mobio@gmail.com"
        },
        "external": {
          "wallets": ["paytm"]
        }
      };
      try {
        razorpay.open(options);
      } catch (e) {
        print(e.toString());
      }
    });
    void handlerPaymentSuccess(PaymentSuccessResponse response) =>
        showToast("Payment success", position: ToastPosition.bottom);

    void handlerErrorFailure(PaymentFailureResponse response) =>
        showToast("Payment Not Complete", position: ToastPosition.bottom);

    void handlerExternalWallet(ExternalWalletResponse response) =>
        showToast("Payment done With external Wallet",
            position: ToastPosition.bottom);

    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlerErrorFailure);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);

    @override
    Future<void> close() async {
      razorpay.clear();
      return super.close();
    }
  }
}
