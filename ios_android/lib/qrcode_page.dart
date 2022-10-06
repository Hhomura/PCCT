import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:fluttertoast/fluttertoast.dart';

class QRCodePage extends StatefulWidget {
  const QRCodePage({Key? key}) : super(key: key);

  @override
  State<QRCodePage> createState() => QRCodePageState();
}

class QRCodePageState extends State<QRCodePage>{
  String qrcode = "";

  read() async{
    try {
      String scan = await FlutterBarcodeScanner.scanBarcode(
          "#FFFF12",
          "Cancel",
          false,
          ScanMode.QR
      );
      setState(() => qrcode = (scan != '-1') ? scan : "Not Valid");
    } catch (e){
      Fluttertoast.showToast(
        msg: "Erro ao tentar efetuar o scan",
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (qrcode != '')
                Padding(
                  padding: const EdgeInsets.only(bottom: 24.0),
                  child: Text(
                    'Code: $qrcode',
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ElevatedButton.icon(
                onPressed: read,
                icon: const Icon(Icons.qr_code),
                label: const Text('Validate'),
              ),
            ],
          ),
        ),
      );
    }
  }