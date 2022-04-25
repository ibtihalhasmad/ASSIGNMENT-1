import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';

class screen extends StatelessWidget {
  const screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: SingleChildScrollView(
        child: Column(children: const [
          HomePage(),
        ]),
      )),
    );
  }
}

TextEditingController textEditingController = TextEditingController();
var amount = 0.0, result = 0.0;
String Crypto = "btc", Crypto2 = "btc";
String Fiat = "usd";
var valueCrypto = 0.0,
    nameCrypto = "",
    unitCrypto = " ",
    typeCrypto = "",
    valueCrypto2 = 0.0;
var valueFiat = 0.0, nameFiat = "", unitFiat = " ", typeFiat = "", des = "";
List<String> selectCrypto = [
  "btc",
  "eth",
  "ltc",
  "bch",
  "bnb",
  "eos",
  "xrp",
  "xlm",
  "link",
  "dot",
  "yfi",
  "sats",
  "bits",
  "xau",
  "xag",
];

List<String> selectCrypto2 = [
  "btc",
  "eth",
  "ltc",
  "bch",
  "bnb",
  "eos",
  "xrp",
  "xlm",
  "link",
  "dot",
  "yfi",
  "sats",
  "bits",
  "xau",
  "xag",
];

List<String> selectFiat = [
  "usd",
  "aed",
  "ars",
  "aud",
  "bdt",
  "bhd",
  "bmd",
  "brl",
  "cad",
  "chf",
  "clp",
  "cny",
  "czk",
  "dkk",
  "eur",
  "gbp",
  "hkd",
  "huf",
  "idr",
  "ils",
  "inr",
  "jpy",
  "krw",
  "kwd",
  "lkr",
  "mmk",
  "mxn",
  "myr",
  "ngn",
  "nok",
  "nzd",
  "php",
  "pkr",
  "pln",
  "rub",
  "sar",
  "sek",
  "sgd",
  "thb",
  "try",
  "twd",
  "uah",
  "vef",
  "vnd",
  "zar",
  "xdr",
];

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        decoration: const BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.elliptical(200, 40),
            bottomRight: Radius.elliptical(200, 40),
          ),
        ),
        height: 170,
        child: Align(
          alignment: Alignment.center,
          child: Text(
            "XCoin",
            style: GoogleFonts.varelaRound(fontSize: 60, color: Colors.white),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(
            right: 32.0, left: 32.0, bottom: 100.0, top: 32.0),
        child: Column(
          children: [
            const SizedBox(height: 30),
            const Text("Convert from Crypto to Fiat",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 134, 133, 133))),
            Image.asset(
              'assets/images/Xcoins.png',
              height: 70,
              width: 70,
            ),
            const SizedBox(height: 20),
            Container(
              width: 350,
              padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 15),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 214, 213, 208),
                  borderRadius: BorderRadius.circular(30)),
              child: DropdownButton(
                isExpanded: true,
                style: const TextStyle(
                    fontSize: 19, color: Color.fromARGB(255, 66, 64, 64)),
                borderRadius: BorderRadius.circular(10),
                value: Crypto,
                onChanged: (value) {
                  setState(() {
                    Crypto = value.toString();
                  });
                },
                items: selectCrypto.map((itemone) {
                  return DropdownMenuItem(value: itemone, child: Text(itemone));
                }).toList(),
              ),
            ),
            const SizedBox(height: 15),
            Container(
              width: 350,
              padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 15),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 214, 213, 208),
                  borderRadius: BorderRadius.circular(30)),
              child: DropdownButton(
                isExpanded: true,
                style: const TextStyle(
                    fontSize: 19, color: Color.fromARGB(255, 66, 64, 64)),
                borderRadius: BorderRadius.circular(10),
                value: Fiat,
                onChanged: (value) {
                  setState(() {
                    Fiat = value.toString();
                  });
                },
                items: selectFiat.map((itemone) {
                  return DropdownMenuItem(value: itemone, child: Text(itemone));
                }).toList(),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 10, 30, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: onPress,
                    child: const Text("GO", style: TextStyle(fontSize: 15)),
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(100, 30), primary: Colors.amber),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(140, 30), primary: Colors.amber),
                    child: const Text("Crypto to cyrpto",
                        style: TextStyle(fontSize: 15)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SecondRoute()),
                      );
                    },
                  )
                ],
              ),
            ),
            Text(des,
                style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 119, 117, 117))),
          ],
        ),
      ),
    ]);
  }

  Widget tabBar(IconData data, String title) {
    return Expanded(
      child: Column(
        children: [
          Icon(data),
          Text(title),
        ],
      ),
    );
  }

  Future<void> onPress() async {
    var url = Uri.parse("https://api.coingecko.com/api/v3/exchange_rates");
    var respone = await http.get(url);
    if (respone.statusCode == 200) {
      var jsonData = respone.body;
      var parsedData = json.decode(jsonData);
      valueCrypto = parsedData['rates'][Crypto]['value'];
      valueFiat = parsedData['rates'][Fiat]['value'];

      setState(() {
        result = valueFiat * valueCrypto;
        des =
            "The value of crypto: $valueCrypto The value of fiat: $valueFiat Result:" +
                result.toString();
      });
    }
  }
}

class SecondRoute extends StatefulWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  State<SecondRoute> createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Container(
        decoration: const BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.elliptical(200, 40),
            bottomRight: Radius.elliptical(200, 40),
          ),
        ),
        height: 170,
        child: Align(
          alignment: Alignment.center,
          child: Text(
            "XCoin",
            style: GoogleFonts.varelaRound(fontSize: 60, color: Colors.white),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(
            right: 32.0, left: 32.0, bottom: 100.0, top: 32.0),
        child: Column(
          children: [
            const SizedBox(height: 15),
            const Text("Convert from Crypto to Crypto",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 134, 133, 133))),
            Image.asset(
              'assets/images/Xcoins.png',
              height: 40,
              width: 40,
            ),
            const SizedBox(height: 20),
            Container(
              width: 350,
              padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 15),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 214, 213, 208),
                  borderRadius: BorderRadius.circular(30)),
              child: DropdownButton(
                isExpanded: true,
                style: const TextStyle(
                    fontSize: 19, color: Color.fromARGB(255, 66, 64, 64)),
                borderRadius: BorderRadius.circular(10),
                value: Crypto,
                onChanged: (value) {
                  setState(() {
                    Crypto = value.toString();
                  });
                },
                items: selectCrypto.map((itemone) {
                  return DropdownMenuItem(value: itemone, child: Text(itemone));
                }).toList(),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: 350,
              padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 15),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 214, 213, 208),
                  borderRadius: BorderRadius.circular(30)),
              child: DropdownButton(
                isExpanded: true,
                style: const TextStyle(
                    fontSize: 19, color: Color.fromARGB(255, 66, 64, 64)),
                borderRadius: BorderRadius.circular(10),
                value: Crypto2,
                onChanged: (value) {
                  setState(() {
                    Crypto2 = value.toString();
                  });
                },
                items: selectCrypto2.map((itemone) {
                  return DropdownMenuItem(value: itemone, child: Text(itemone));
                }).toList(),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 10, 30, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: onPress,
                    child: const Text("GO", style: TextStyle(fontSize: 15)),
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(100, 30), primary: Colors.amber),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(120, 30), primary: Colors.amber),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Crypto to fiat",
                        style: TextStyle(fontSize: 15)),
                  ),
                ],
              ),
            ),
            Text(des,
                style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 119, 117, 117))),
          ],
        ),
      ),
    ]));
  }

  Future<void> onPress() async {
    var url = Uri.parse("https://api.coingecko.com/api/v3/exchange_rates");
    var respone = await http.get(url);
    if (respone.statusCode == 200) {
      var jsonData = respone.body;
      var parsedData = json.decode(jsonData);
      valueCrypto = parsedData['rates'][Crypto]['value'];
      valueCrypto2 = parsedData['rates'][Crypto2]['value'];

      setState(() {
        result = valueCrypto2 * valueCrypto;
        des =
            "The value of 1st crypto: $valueCrypto The value of 2nd crypto: $valueCrypto2 Result:" +
                result.toString();
      });
    }
  }
}
