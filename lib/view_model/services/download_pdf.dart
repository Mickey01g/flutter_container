// import 'dart:io';
//
// import 'package:flutter_pdfview/flutter_pdfview.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:dio/dio.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:gsheets/gsheets.dart';
//
// const formUrl = "https://csjmu.ac.in/wp-content/uploads/docs/2021/09/Hostel-application-FORM.pdf";
//
// Future<bool> saveFile(String url, String fileName) async {
//   try {
//     if (await requestPermission(Permission.storage)) {
//       Directory?directory;
//       directory = await getExternalStorageDirectories();
//       String newPath = "";
//       List<String>paths = directory!.path.split("/");
//       for (int x = 1; x < paths.length; x++) {
//         String folder = paths[x];
//         if (folder != "Android") {
//           newPath += "/" + folder;
//         }
//         else {
//           break;
//         }
//       }
//     }
//     newPath = newPath + "/PDF_Download";
//     Directory(newPath);
//     File saveFile = File(directory.path + "/$fileName");
//     print(saveFile.path);
//     if (!await directory.exists()) {
//       await directory.create(recursive: true);
//     }
//     if (await directory.exists()) {
//       await Dio.download(formUrl, saveFile.path);
//     }
//     return true;
//   }catch(e){
//     return false;
//   }
// }
// void getFile(){
//   FileDownloader.downloadFile(
//
//   )
// }