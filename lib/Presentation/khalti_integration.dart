import 'package:flutter/material.dart';
import 'package:khalti_flutter/khalti_flutter.dart';

class KhaltiInit extends StatefulWidget {
  const KhaltiInit({super.key});

  @override
  State<KhaltiInit> createState() => _KhaltiInitState();
}

class _KhaltiInitState extends State<KhaltiInit> {
  TextEditingController amount = TextEditingController();
  int? parsedNumber;

  // Converting into Paisa as KHALTI amount only accept Paisa as it's amount
  amountConversion() {
    return int.parse(amount.text) * 100;
  }

  // void amtAonversion() {
  //   String input = amount.text;
  //   int? parsed = int.tryParse(input);

  //   setState(() {
  //     parsedNumber = parsed;
  //   });
  // }

  paymentMethod() {
    return KhaltiScope.of(context).pay(
      config: PaymentConfig(
          amount: amountConversion(), productIdentity: "", productName: ""),
      onSuccess: (sucess) {
        const sucess = SnackBar(content: Text("Payment Sucessfull"));
        ScaffoldMessenger.of(context).showSnackBar(sucess);
      },
      onFailure: (fail) {
        const fail = SnackBar(content: Text("Payment Sucessfull"));
        ScaffoldMessenger.of(context).showSnackBar(fail);
      },
      // In preferences you can chose may payment getway method
      preferences: [
        PaymentPreference.khalti,
        PaymentPreference.eBanking,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          shadowColor: Colors.blueAccent,
          elevation: 5,
          backgroundColor: Colors.black38,
          centerTitle: true,
          title: const Text(
            "Khalti Payment",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(25),
              child: Column(
                children: [
                  const Text(
                    " Khalti Payment Getway",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.disabled,
                    showCursor: false,
                    controller: amount,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      label: Text(
                        " Enter Amount",
                        style: TextStyle(fontSize: 12, letterSpacing: 1.5),
                      ),
                      prefixIcon: Icon(
                        Icons.account_circle_outlined,
                        size: 20,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                      fixedSize:
                          MaterialStateProperty.all<Size>(const Size(330, 30)),
                    ),
                    child: Text(
                      "Pay".toUpperCase(),
                      style: const TextStyle(
                          letterSpacing: 1.3, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    onPressed: () async {
                      paymentMethod();
                    },
                  ),

                  // KhaltiButton(
                  //     config: PaymentConfig(
                  //         amount: 1000,
                  //         productIdentity: "",
                  //         productName: "productName"),
                  //     onSuccess: (sucess) {
                  //       const sucess =
                  //           SnackBar(content: Text("Payment Sucessfull"));
                  //       ScaffoldMessenger.of(context).showSnackBar(sucess);
                  //     },
                  //     onFailure: (fail) {
                  //       const fail =
                  //           SnackBar(content: Text("Payment Sucessfull"));
                  //       ScaffoldMessenger.of(context).showSnackBar(fail);
                  //     })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
