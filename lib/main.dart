import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  runApp(
    MaterialApp(
      home: qr(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

TextEditingController t1 = TextEditingController();

class qr extends StatefulWidget {
  const qr({Key? key}) : super(key: key);

  @override
  State<qr> createState() => _qrState();
}

class _qrState extends State<qr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Genrate Code"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.black12, borderRadius: BorderRadius.circular(30)),
            padding: EdgeInsets.all(10),
            child: TextField(
              cursorColor: Colors.black,
              decoration: InputDecoration(
                  hintText: "Genrate Code",
                  hintStyle: TextStyle(color: Colors.black),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  )),
              controller: t1,
            ),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                fixedSize: Size(200, 50),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Genrate();
                    },
                  ),
                );
                // t1.text = "";
              },
              child: Text("Generate")),
        ],
      ),
    );
  }
}

class Genrate extends StatefulWidget {
  const Genrate({Key? key}) : super(key: key);

  @override
  State<Genrate> createState() => _GenrateState();
}

class _GenrateState extends State<Genrate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Qr Code"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: QrImage(
          data: t1.text,
          version: QrVersions.auto,
          // embeddedImage: AssetImage('Images/Ferrari.jpg'),
          // embeddedImageStyle: QrEmbeddedImageStyle(
          //   size: Size(50,50)
          // ),
          size: 300.0,
        ),
      ),
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Colors.black,fixedSize: Size(150, 50)),
        child: Text("Change Qr"),
        onPressed: () {
          t1.text = "";
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return qr();
              },
            ),
          );
        },
      ),
    );
  }
}
