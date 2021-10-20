import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
class TakeFacultyAttendence extends StatefulWidget {
  const TakeFacultyAttendence({Key? key}) : super(key: key);

  @override
  _TakeFacultyAttendenceState createState() => _TakeFacultyAttendenceState();
}

class _TakeFacultyAttendenceState extends State<TakeFacultyAttendence> {
  String reg='';
  Future scan()async{
    final barcode=await FlutterBarcodeScanner.scanBarcode("green", "Cancel", true, ScanMode.QR);
    setState(() {
      reg=barcode;
    });
    //Navigator.push(context, MaterialPageRoute(builder: (context)=>SuccessScan(roll_no!)));
  }
  @override
  void initState() {
    scan();
    if(reg=='-1'){
      showMyDialog("Eror!",'could not scan your id');
    }
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(reg,style: TextStyle(
            fontSize: 24,
            color: Colors.red
        ),),
      ),
    );
  }
  Future<void> showMyDialog(String msg,String detail) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title:  Text(msg),
          content: Text(detail),
          actions: <Widget>[
            TextButton(
              child: const Text('ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
