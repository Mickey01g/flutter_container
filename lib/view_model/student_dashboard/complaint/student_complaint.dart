import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_container/view_model/announcement_create/create_announcement.dart';
import 'package:gsheets/gsheets.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../component/sign_controller.dart';
import '../../services/data_fetch.dart';

const _credentials = r'''
  {
   "type": "service_account",
  "project_id": "csjmuhostel-e45f1",
  "private_key_id": "33a73d33c54653a37f26cb41886d5968a595665d",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDwdMZNA5CMf5in\ngbsEijKTItFGqoN1DuHjrO3VBiUxGyqHE0GSXxd8ZNh7KuFn82u7/T8YGW9vA7lz\nIJFjCg4FzDiE+AWO/l7bvRA0ymxc5V157HDjMAe5SQ4YklijccTOzA2GXYipybU0\nX5CiyYVAqXD3gfOaxP0hiO5ohENavYJpbmL3XMFQXkB0gP7yoFvN51lW7fmd4jMi\nB5tAJvWQj1aw0AqHh7LkQjG6vNqjcyzDRNh3mYaZv8G261aqXDhuJKvMOtTH+uae\nV6edPRPPoiAl039W8qiUYEeElH4B9vVQUqDlmfwuatexwrfyu6mYFA1YeX2J0NkV\nP4/11+UHAgMBAAECggEACAEDFs4vEhYvOSgu1vxYqaAnkjAb1xorN75qXkRpmYRb\neoqQDLTAneHneNYZEbI/HE9WOdGi7XGUyznCzSapB9Vf7kEpQjTCaJMXBoLUb5Us\n8uGFcnKHV0oQv42jiLFBSVbuflH/uhMeRoOF131Yw6nAOmTnfHfhKywZL35zlYIX\n4AOAUU0a0qL+aULKBR5JlBMwNvhQAQeca/HvbNGloXUa7cCXYQ+3RUJFTJmqjTvs\nKNA7WhzeRybrbxNZ61DR6IEzcFJqKUjW9RsHrATegNYjReVI2jdl9ItdieTGXpQO\nJn5VlHq2xtixhebPaq+ujJfLL8lT2GzPZp2sKt19cQKBgQD6r7v4DjrkZu7o5kVn\nV28LTQkjsBIE1MW2MgpYsp0Y37cXcgHmAdV9a97CGyB7sKqoYhfQqUhm/XhBJgfG\nOgpv/LwQLghIYQjfx4u5vjZBGANvhN2UizDReBP7UymmgFd/60b6ZEy8K5yQ5Gle\nkyHUloU/S6lcl8gOgCnNsSXV8QKBgQD1jYdtsQxBgvNqESwgrrIGWqOeIkAAIOA7\n+jcwClUPbr+s7RF8hGTlB40Wr94vyQJxKkTGSLADnrhxIovJZI5tSEO1Mpqy7ani\n760mmrlPfs5DQRQbFeSsV9DV0JECLjIPpWn91e+EAinxTRrDk3VO9apKbp94saY8\nxeToZx6SdwKBgDuIuI80cfAEMgDFjv332btJVD5RdjYHgdy/DY36/SwHFShQPvss\nvFLI52IZpyE4146dnSJE0ZkD4Sc3rOj6p7fowZDmHblysfTTIu+9qIzU8xvs5eJ9\nG97jMXuiSGXuXNlYOscEQuT9RnVyiUOYlZQzGvnpMhN3SF+JOGRNCbtBAoGBAL9N\nnf71emjnjqBJ9KkZsRSGNQaUBGyVMF1J2QkSY6Z8T9R3dbIeq0RLl73fEikEX2Su\n25nnM0n+tA9gLKugLd4x+J4IaMGRq1NkCvAShuDKGAQJhZJ8ggVK/SY3MWITf2j1\nJBhgPhQIY4jc20cXcMMtXZhTiuZK8QpT2ry86fKNAoGABiE6zgantnan2QpbyL1A\nNHQyN1Z27Oy9j+5LCrR1knBYTsn/goDoro56k9Yl2hF/TwAvIBkID2QSTBRPRfvW\ndln9wamIe5TysHy0kRfDbHSsOShoAn/YAABBLZhjurrloif4f2NqN54vpUl956l2\n9AN3i12Wlvp4ByziksCejO4=\n-----END PRIVATE KEY-----\n",
  "client_email": "hosteldatabase@csjmuhostel-e45f1.iam.gserviceaccount.com",
  "client_id": "116715855237137569487",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/hosteldatabase%40csjmuhostel-e45f1.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"

  }
  ''';

const spreadsheetid = "1XEiR6x2_ipo6BKt5q8AIsiedxuXHhVVfc0uBvBP2940";
Future<void>? hostelDatabase(String name, String room, String contact) async {
  final hostelbase = GSheets(_credentials);
  final ss = await hostelbase.spreadsheet(spreadsheetid);
  var sheet = ss.worksheetByTitle("description");
  await sheet?.values.insertValue(name, column: 1, row: 1);
  await sheet?.values.insertValue(room, column: 2, row: 1);
  await sheet?.values.insertValue(contact, column: 3, row: 1);
}

class MyComplaint extends StatefulWidget {
  const MyComplaint({super.key});

  @override
  State<MyComplaint> createState() => _MyComplaintState();
}

class _MyComplaintState extends State<MyComplaint> {
  static  List<String> list = <String>[
    'ELECTRICITY ',
    'MESS',
  ];

  String dropdownValue = list.first;
  final complaintcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String name = e1.name;
    String room = e1.room;
    String contact = e1.phone;

    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text("Complaint Form"),
      ),
      body: Material(
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      const Card(
                        margin: EdgeInsets.all(0),
                        child: Padding(
                          padding: EdgeInsets.only(top: 15, bottom: 10),
                          child: SizedBox(
                              width: 400,
                              child: Text(
                                "COMPLAINT",textScaleFactor: 1.3,
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              )),
                        ),
                      ),

                      //===============name section start form here==============
                      Padding(
                        padding: const EdgeInsets.only(left: 15, top: 20),
                        child: SizedBox(
                          height: 25,
                          child: Row(
                            children: [
                               Text("Name : "+"\t\t"+e1.name,textScaleFactor: 1.2,),
                               SizedBox(
                                width: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                      // ================room no section start from here==========
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: SizedBox(
                          height: 25,
                          child: Row(
                            children: [
                              Text("Room : "+"\t\t"+e1.room,textScaleFactor: 1.2,),
                              const SizedBox(
                                width: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                      // =============contact section here =============
                      Padding(
                        padding: const EdgeInsets.only(left: 15, bottom: 20),
                        child: SizedBox(
                          height: 25,
                          child: Row(
                            children: [
                              Text("Contact : "+"\t\t"+e1.phone,textScaleFactor: 1.2,),
                              const SizedBox(
                                width: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Divider(
                    height: 1,
                    thickness: .5,
                    indent: 0,
                    endIndent: 0,
                    color: Colors.black38,
                  ),
                ),
                //============Problem container start form here============
                Column(
                  children: [
                    const Card(
                      margin: EdgeInsets.all(0),
                      child: Padding(
                        padding: EdgeInsets.only(top: 15, bottom: 10),
                        child: SizedBox(
                            width: 400,
                            child: Text(
                              "COMPLAINT TYPE",textScaleFactor: 1.3,
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                      width: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Row(
                        children: [
                          const Text(
                            "Type :",
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          DropdownButton<String>(
                            value: dropdownValue,
                            icon: const Icon(Icons.arrow_downward),
                            elevation: 16,
                            style: const TextStyle(color: Colors.black),
                            onChanged: (String? value) {
                              // This is called when the user selects an item.
                              setState(() {
                                dropdownValue = value!;
                                if (kDebugMode) {
                                  print(dropdownValue);
                                }
                              });
                            },
                            items: list.map<DropdownMenuItem<String>>(
                                (String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                     Padding(
                      padding: EdgeInsets.only(
                          left: 15, bottom: 20, right: 10, top: 10),
                      child: TextField(
                        controller: complaintcontroller,
                        decoration: InputDecoration(
                            labelText: "Description",
                            labelStyle: TextStyle(fontSize: 18),
                            hintText: "Write your complaint here !"),
                        keyboardType: TextInputType.multiline,
                        minLines: 3,
                        maxLines: 5,
                      ),
                    )
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 70),
                  child: SingleChildScrollView(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: (){
                            // HostelDatabase();
                            DoGet().complaint(complaintcontroller.text, dropdownValue, e1.name, e1.room, e1.course);
                            // Fetch();
                  },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              "Save",
                              style: TextStyle(color: Colors.white),
                              textScaleFactor: 1.2,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Padding(
                              padding:
                                  EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                "Cancel",
                                style: TextStyle(color: Colors.white),
                                textScaleFactor: 1.2,
                                textAlign: TextAlign.center,
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

 Fetch() async{
  final CollectionReference contacts=FirebaseFirestore.instance.collection("users");
  final gsheets = GSheets(_credentials);
  final ss = await gsheets.spreadsheet(spreadsheetid);
  var sheet = ss.worksheetByTitle("description");
  int rows =sheet!.rowCount.length;
  print(rows);
  SignController.toastMessage(rows.toString());
  var cellsRow;
  for(var i=1; i<rows; i++){
    cellsRow=await sheet.cells.row(i);
    var temp =cellsRow.elementAt(2).value;
    print(temp);
    if (kDebugMode) {
      print(cellsRow.elementAt(0).value);
    }
    SignController.toastMessage("muthhi");
  }
}


HostelDatabase() async {

    final hostelbase = GSheets(_credentials);
    final ss = await hostelbase.spreadsheet(spreadsheetid);
    var sheet = ss.worksheetByTitle("description");
    await sheet?.values.insertValue("LODA", column: 1, row: 1);
    await sheet?.values.insertValue("LODA", column: 2, row: 2);
    await sheet?.values.insertValue("LODA", column: 3, row: 1);
    if (kDebugMode) {
      print("LAUDA BENCHO\n\n\n\n\n");
    }
  }

