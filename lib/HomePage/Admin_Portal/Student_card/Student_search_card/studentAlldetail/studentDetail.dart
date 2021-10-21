

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:student_portal_app/component/alertdilog.dart';
import 'package:vertical_tabs/vertical_tabs.dart';
class StudentAllinformation extends StatefulWidget {
  String regNo;
  StudentAllinformation(this.regNo);

  @override
  _StudentAllinformationState createState() => _StudentAllinformationState(regNo);
}

class _StudentAllinformationState extends State<StudentAllinformation> {
  String regNo;
  _StudentAllinformationState(this.regNo){
    getData();
  }
  List sibling_list=[];
  var name=TextEditingController();
  var rollNo=TextEditingController();
  var className=TextEditingController();
  var section=TextEditingController();
  var month=TextEditingController();
  var amount=TextEditingController();
  var otherFee=TextEditingController();
  var totalFee=TextEditingController();
  var remark=TextEditingController();
  List benificiarySibling=[];
  String total_pending='0',presentClass='',fname='NA',edu_fees='0',session='NA';
  List fees_history=[],recipt_list=[],other_item_fees=[];
  List<bool> isSelected=[false,false,false,false];
  initState(){
    // getData();
  }
  Future getData()async{
    print("run");
    var reg={
      "regno":regNo
    };
    var response = await http.post(
        Uri.parse("http://sniic.co.in/admin/school_app/Sibling_List_By_Reg_json.php"),
        body: json.encode(reg));
    var obj = jsonDecode(response.body);
    if (obj["result"] == 'S'){
      print("++++++++++++++++++++++++++++++++++++++++++");
      // print(fees_history);
      // print(sibling_list);
      print(obj);
      print("++++++++++++++++++++++++++++++++++++++++++++=");
      setState(() {
        sibling_list=obj["sibling_list"];
        // benificiarySibling=obj["benificiary_sibling"];
        total_pending=obj["total_pending"].toString();
        presentClass=obj["class"];
        fees_history=obj["fees_history"];
        recipt_list=obj["recipt_list"];
        session=obj["session"];
        // fname=obj["fname"];
        edu_fees=obj["edu_fees"];
        // other_item_fees=obj["other_item_fees"];
        print("++++++++++++++++++++++++++++++++++++++++++");
        // print(fees_history);
        // print(sibling_list);
        print(obj);
        print("++++++++++++++++++++++++++++++++++++++++++++=");
        //print("info");
      });
      if(obj==null)
        showMyDialog("Server Error","Somthing went wrong ",context);
    }
    else showMyDialog("Error","Somthing went wrong ",context);
  }
  TextStyle _textStyle=TextStyle(
    color: Colors.black,
    fontSize: 15,
  );
  Map data=    {
    "name":"Vineet",
    "class":"5",
    "regno":"1213123133123",
    "srno":"848",
    "section": "Section A",
  };
  List <Map>feeDetail=<Map>[
    {
      "no":"1",
      "month":"July",
      "amount":"1200",
      "date":"11/7/2012",
    },
    {
      "no":"2",
      "month":"August",
      "amount":"1200",
      "date":"11/8/2012",
    },
    {
      "no":"3",
      "month":"September",
      "amount":"1200",
      "date":"11/9/2012",
    },{
      "no":"3",
      "month":"September",
      "amount":"1200",
      "date":"11/9/2012",
    },{
      "no":"3",
      "month":"September",
      "amount":"1200",
      "date":"11/9/2012",
    },{
      "no":"3",
      "month":"September",
      "amount":"1200",
      "date":"11/9/2012",
    },{
      "no":"3",
      "month":"September",
      "amount":"1200",
      "date":"11/9/2012",
    },{
      "no":"3",
      "month":"September",
      "amount":"1200",
      "date":"11/9/2012",
    },{
      "no":"3",
      "month":"September",
      "amount":"1200",
      "date":"11/9/2012",
    },
    {
      "no":"4",
      "month":"October",
      "amount":"1200",
      "date":"11/10/2012",
    }
  ];
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double radius=50;
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Detail"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 320,
              decoration: BoxDecoration(
                // color: Colors.teal,
                // border: Border.all(color: Colors.black38),
                  borderRadius: BorderRadius.circular(10)
              ),
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: 0,bottom: 3),
              //padding: EdgeInsets.all(10),
              child: Stack(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width:width,
                    height: 150,
                    child: Image.asset("assets/images/top.jpg",fit: BoxFit.fill,),
                  ),
                  Positioned(
                    left:(width/2)-radius,
                    top: 150-radius,
                    child: CircleAvatar(
                      radius: radius,
                      backgroundColor: Colors.green,
                      child: CircleAvatar(
                        child: Icon(Icons.person),
                        // backgroundImage:  ,
                        radius: radius-3,
                      ),
                    ),
                  ),
                //  SizedBox(height: 10,),
                  Positioned(
                    top: 150+radius+5,
                    left: width*.07,
                    child: Card(
                      child: Container(
                        width: width*.85,
                       // color: Colors.white,
                       // margin: EdgeInsets.only(left: 30),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //Text("Sr.No:"+data["srno"],style: _textStyle,),
                              Text("Reg no :"+regNo,style: _textStyle,),
                              Text("Name: "+data["name"],style:_textStyle),
                              Text("Class: "+presentClass,style: _textStyle,),
                              Text("Session: "+session,style: _textStyle,),
                              Text("Education Fee: "+edu_fees+"/month",style: _textStyle,),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OutlinedButton(onPressed: (){
                    showSiblings(context);
                  },
                    child: Text("Siblings"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OutlinedButton(onPressed:()=>showFeeHistory(context),
                    child: Text("Fee History"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OutlinedButton(onPressed: (){
                    showRecieptHistory(context);
                  },
                    child: Text("Fee Receipt history"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OutlinedButton(onPressed: (){
                    showMyDialog("Pending Fee", "Your pending fee is "+total_pending, context);
                  },
                    child: Text("Pending Fee"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OutlinedButton(onPressed: (){
                    showSiblings(context);
                  },
                    child: Text("Submit Fee"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  void showSiblings(context) {
    print(sibling_list);
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              margin: EdgeInsets.only(top: 10),
              child: ListView.builder(
                itemCount: sibling_list.length,
                itemBuilder: ((BuildContext context,int index)
          {
            return ListTile(
                leading: Icon(Icons.person),
                // trailing: Text("GFG",
                //   style: TextStyle(
                //       color: Colors.green, fontSize: 15),),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("SrNo: "+sibling_list[index]["srno"]),
                    SizedBox(height: 5,),
                    Text("RegNo: "+sibling_list[index]["regno"]),
                    SizedBox(height: 5,),
                    Text("Name: "+sibling_list[index]["name"]),
                    SizedBox(height: 5,),
                    Text("Father: "+sibling_list[index]["fname"]),
                    SizedBox(height: 5,),
                    Text("Mother: "+sibling_list[index]["mname"]),
                    SizedBox(height: 5,),
                    Text("Class: "+sibling_list[index]["class"]),
                    SizedBox(height: 5,),
                    Text("Section: "+sibling_list[index]["section"]),
                    SizedBox(height: 5,),
                    Text("Father: "+sibling_list[index]["fname"]),
                    SizedBox(height: 5,),
                    Text("Fee/month: "+sibling_list[index]["edufees"]),
                    SizedBox(height: 10,
                    child: Divider(color: Colors.red,thickness: 2,),),
                  ],
                )
            );
          }))
          ));
        });
  }
  void showFeeHistory(context) {
    print(fees_history);
    showModalBottomSheet(
        //isScrollControlled:true,
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
              child: Container(
                  margin: EdgeInsets.only(top: 10),
                  child: ListView.builder(
                      itemCount: fees_history.length,
                      itemBuilder: ((BuildContext context,int index)
                      {
                        return ListTile(
                            leading: Icon(Icons.person),
                            // trailing: Text("GFG",
                            //   style: TextStyle(
                            //       color: Colors.green, fontSize: 15),),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Class: "+fees_history[index]["class"]),
                                SizedBox(height: 5,),
                                Text("Season: "+fees_history[index]["ses"]),
                                SizedBox(height: 5,),
                                Text("Submitted Fee: "+fees_history[index]["submit_fees"]),
                                SizedBox(height: 5,),
                                Text("Education Fee: "+fees_history[index]["edu_fees"]),
                                SizedBox(height: 5,),
                                Text("Total Fee: "+fees_history[index]["total_fees"].toString()),
                                SizedBox(height: 5,),
                                Text("Pending Fee: "+fees_history[index]["pending_fees"].toString()),
                                SizedBox(height: 5,),
                                SizedBox(height: 10,
                                  child: Divider(color: Colors.red,thickness: 2,),),
                              ],
                            )
                        );
                      }))
              ));
        });
  }
  void showRecieptHistory(context) {
    print(recipt_list);
    showModalBottomSheet(
      //isScrollControlled:true,
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
              child: Container(
                  margin: EdgeInsets.only(top: 10),
                  child: ListView.builder(
                      itemCount: recipt_list.length,
                      itemBuilder: ((BuildContext context,int index)
                      {
                        return ListTile(
                            leading: Icon(Icons.person),
                            // trailing: Text("GFG",
                            //   style: TextStyle(
                            //       color: Colors.green, fontSize: 15),),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("SrNo: "+recipt_list[index]["sno"]),
                                SizedBox(height: 5,),
                                Text("Season: "+recipt_list[index]["ses"]),
                                SizedBox(height: 5,),
                                Text("Class: "+recipt_list[index]["class"]),
                                SizedBox(height: 5,),
                                Text("Date/Time: "+recipt_list[index]["dor"]),
                                SizedBox(height: 5,),
                                Text("Month Fee: "+recipt_list[index]["months_fees"]),
                                SizedBox(height: 5,),
                                Text("Education Fee: "+recipt_list[index]["educational_fees"]),
                                SizedBox(height: 5,),
                                Text("Remark: "+recipt_list[index]["remark"]),
                                SizedBox(height: 5,),
                                SizedBox(height: 10,
                                  child: Divider(color: Colors.red,thickness: 2,),),
                              ],
                            )
                        );
                      }))
              ));
        });
  }
}
