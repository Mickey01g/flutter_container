import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
class DownloadingDialog extends StatefulWidget {

  @override
  _DownloadingDialogState createState() => _DownloadingDialogState();
}

class _DownloadingDialogState extends State<DownloadingDialog> {
  Dio dio =Dio();
  double progress=0.0;
  void startDownloading()async{
    const String url =
        "https://storage.cloud.google.com/csjmuhostel-e45f1.appspot.com/Hostel-application-FORM.pdf";
    const String fileName="Hostel_Form.pdf";

    String path = await _getExternalStorageDirectory(fileName);

    await dio.download(
      url,
      path,
      onReceiveProgress:(receiveByte,totalBytes){
        setState(() {
          progress = receiveByte / totalBytes;
        });
        print(progress);
      },
      deleteOnError:true,
    ).then((_){
      Navigator.pop(context);
    });
  }
  Future<String> _getExternalStorageDirectory(String filename)async{
    final dir = await getApplicationDocumentsDirectory();
    return "${dir.path}/$filename";
  }

  @override
  void initState(){
    super.initState();
    startDownloading();
  }

  @override
  Widget build(BuildContext context) {
    String downloadingprogress = (progress * 100).toInt().toString();
    return AlertDialog(
      backgroundColor: Colors.black,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator.adaptive(),
          const SizedBox(height: 20,),
          Text("Downloading:$downloadingprogress%", style: const TextStyle(color: Colors.white,fontSize: 17),)
        ],
      ),
    );
  }
}

