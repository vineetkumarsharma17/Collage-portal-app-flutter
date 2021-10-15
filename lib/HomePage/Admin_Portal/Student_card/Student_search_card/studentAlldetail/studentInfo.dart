

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
  _StudentAllinformationState(this.regNo);
  List info=[];
  var name=TextEditingController();
  var rollNo=TextEditingController();
  var className=TextEditingController();
  var section=TextEditingController();
  var month=TextEditingController();
  var amount=TextEditingController();
  var otherFee=TextEditingController();
  var totalFee=TextEditingController();
  var remark=TextEditingController();
  initState(){
  getData();
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
      setState(() {
        info=obj["data"];
        if(info==null)
          showMyDialog("Server Error","Somthing went wrong ",context);
        print(info);
        //print("info");
      });
    }
    else showMyDialog("Server Error","Somthing went wrong ",context);
  }
  TextStyle _textStyle=TextStyle(
    color: Colors.black,
    fontSize: 15,
  );
  Map data=    {
      "name":"Vineet",
      "class":"5",
      "regno":"SNIICSTUD07112019847",
      "srno": "848",
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Detail"),
      ),
      body: VerticalTabs(
        backgroundColor: Colors.white,
        contentScrollAxis: Axis.vertical,
        //selectedTabBackgroundColor: Colors.blue[200],
        tabsElevation: 0,
        indicatorSide: IndicatorSide.end,
        disabledChangePageFromContentView: true,
        indicatorColor: Colors.blue,
        //selectedTabBackgroundColor:const Color(98977952),
        tabBackgroundColor: const Color(4294506744),
        tabTextStyle: const TextStyle(
            color: Colors.red
        ),
        tabsWidth: MediaQuery.of(context).size.width*.25,
        tabs: [
          Tab(child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
                child: Text("Fees history")),
          ),),
          Tab(child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
                margin: EdgeInsets.only(top: 10),
                child: Text("Siblings ")),
          ),),
          Tab(child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
                margin: EdgeInsets.only(top: 10),
                child: Text("Pending")),
          ),),
          Tab(child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
                margin: EdgeInsets.only(top: 10),
                child: Text("Submit Fee")),
          ),),

        ],
        contents: <Widget>[
          SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                       // color: Colors.teal,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(vertical: 10,horizontal: 3),
                    padding: EdgeInsets.all(10),

                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          child: Icon(Icons.person),
                          // backgroundImage:  ,
                          radius: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Sr.No:"+data["srno"],style: _textStyle,),
                              Text("Reg no:"+data["regno"],style: _textStyle,),
                              Text("Name:"+data["name"],style:_textStyle),
                              Text("Class:"+data["class"],style: _textStyle,),
                              Text("Section:"+data["section"],style: _textStyle,),

                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columnSpacing: 8,
                        showBottomBorder: true,
                          columns: [
                            DataColumn(label: Text("No",style: TextStyle(fontWeight: FontWeight.bold),)),
                            DataColumn(label: Text("Month",style: TextStyle(fontWeight: FontWeight.bold),)),
                            DataColumn(label: Text("Amount",style: TextStyle(fontWeight: FontWeight.bold),)),
                            DataColumn(label: Text("Date",style: TextStyle(fontWeight: FontWeight.bold),)),
                          ],
                          rows: feeDetail.map((value)  {
                            return DataRow(
                              cells: [
                                DataCell(Text(value["no"].toString())),
                                DataCell(Text(value["month"].toString())),
                                DataCell(Text(value["amount"].toString())),
                                DataCell(Text(value["date"].toString())),
                              ],
                            );
                          }).toList()),
                    ),
                  )
                ],
              ),
            ),
          ),
          Text("Slibling Relation"),
          Text("Pending Fee"),
          SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: Wrap(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 2.5,horizontal: 5),
                          padding: EdgeInsets.zero,
                          height: 55,
                          decoration:BoxDecoration(
                            border:Border.all(color: Colors.black38,width: 0),
                          ),
                          //width: MediaQuery.of(context).size.width*.3,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Stack(
                              children:[
                                TextFormField(
                                controller: rollNo,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                 // labelText: "Roll no",
                                ),
                              ),
                          Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Container(
                              color: Colors.white,
                              child: Text(
                          'Address',
                          style: TextStyle(color: Colors.blue[800]) ,
                          ),
                            ),
                          )
                          )
                              ]
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 2.5,horizontal: 5),
                          padding: EdgeInsets.zero,
                          height: 55,
                          decoration:BoxDecoration(
                            border:Border.all(color: Colors.black38,width: 0),
                          ),
                          //width: MediaQuery.of(context).size.width*.3,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: TextFormField(
                              controller: name,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: "Name",
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 2.5,horizontal: 5),
                          padding: EdgeInsets.zero,
                          height: 55,
                          decoration:BoxDecoration(
                            border:Border.all(color: Colors.black38,width: 0),
                          ),
                          //width: MediaQuery.of(context).size.width*.3,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: TextFormField(
                              controller: className,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: "Class",
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 2.5,horizontal: 5),
                          padding: EdgeInsets.zero,
                          height: 55,
                          decoration:BoxDecoration(
                            border:Border.all(color: Colors.black38,width: 0),
                          ),
                          //width: MediaQuery.of(context).size.width*.3,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: TextFormField(
                              controller: section,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: "Section",
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 2.5,horizontal: 5),
                          padding: EdgeInsets.zero,
                          height: 55,
                          decoration:BoxDecoration(
                            border:Border.all(color: Colors.black38,width: 0),
                          ),
                          //width: MediaQuery.of(context).size.width*.3,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: TextFormField(
                              controller: month,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: "Month",
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 2.5,horizontal: 5),
                          padding: EdgeInsets.zero,
                          height: 55,
                          decoration:BoxDecoration(
                            border:Border.all(color: Colors.black38,width: 0),
                          ),
                          //width: MediaQuery.of(context).size.width*.3,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: TextFormField(
                              controller: amount,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: "Amount",
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 2.5,horizontal: 5),
                          padding: EdgeInsets.zero,
                          height: 55,
                          decoration:BoxDecoration(
                            border:Border.all(color: Colors.black38,width: 0),
                          ),
                          //width: MediaQuery.of(context).size.width*.3,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: TextFormField(
                              controller: otherFee,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: "Other Fee",
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 2.5,horizontal: 5),
                          padding: EdgeInsets.zero,
                          height: 55,
                          decoration:BoxDecoration(
                            border:Border.all(color: Colors.black38,width: 0),
                          ),
                          //width: MediaQuery.of(context).size.width*.3,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: TextFormField(
                              controller: totalFee,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: "Total Fee",
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 2.5,horizontal: 5),
                          padding: EdgeInsets.zero,
                          height: 55,
                          decoration:BoxDecoration(
                            border:Border.all(color: Colors.black38,width: 0),
                          ),
                          //width: MediaQuery.of(context).size.width*.3,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: TextFormField(
                              maxLines: 6,
                              controller: remark,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: "Remark",
                              ),
                            ),
                          ),
                        ),


                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
