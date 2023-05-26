import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:gsheets/gsheets.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../component/sign_controller.dart';


class UserData {
  late String name;
  late String phone;
  late String email;
  UserData({required this.name,required this.phone,required this.email});
}
final e1=UserData(name: '', phone: '', email: '');



// String _name="";
// String _email="";
// int _phone="" as int;

fetch3() async{

  const credentials = r'''
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
  const spreadsheetId = "1XEiR6x2_ipo6BKt5q8AIsiedxuXHhVVfc0uBvBP2940";
  final CollectionReference contacts=FirebaseFirestore.instance.collection("users");
  final gSheets = GSheets(credentials);
  final ss = await gSheets.spreadsheet(spreadsheetId);
  //getting currentuser

  var sheet = ss.worksheetByTitle("description");
  int rows =sheet!.rowCount.length;
  try{
    List<Cell>? cellsRow;
    for(var i=1; i<rows; i++){
      cellsRow=await sheet?.cells.row(i);
      var username=cellsRow?.elementAt(0).value;
      var phone=cellsRow?.elementAt(1).value.toString();
      var email =cellsRow?.elementAt(2).value;

      var currentUser = FirebaseAuth.instance.currentUser;
      if (kDebugMode) {
        print(currentUser?.email);
      }
      if (currentUser!=null){
        var fEmail=currentUser.email.toString();
        if (fEmail==email) {

            e1.email=fEmail!;
            e1.phone=phone!;
            e1.name=username!;
          if (kDebugMode) {
            print("Data Uploaded ");
            print(e1.phone);
            print(e1.name);

          }
        }
        else{
          SignController.toastMessage("Something Went Wrong");
        }
      }
      else{
        SignController.toastMessage("User Not Found");
      }

    }


  }catch(e){
    if (kDebugMode) {
      print(e.toString());
    }
    SignController.toastMessage(e.toString());
  }

}