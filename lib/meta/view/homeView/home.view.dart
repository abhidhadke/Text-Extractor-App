import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:textscanner/app/routes/app.routes.dart';
import 'package:textscanner/core/notifier/homeNotifier/home.notifer.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Textractor", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600),),
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).pushNamed(AppRoutes.aboutMe);
          }, icon: const Icon(Icons.info_outline_rounded, color: Colors.white,))
        ],
      ),
      backgroundColor: Colors.black54,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              RichText(
                text: const TextSpan(
                  text: "Text",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                  children: [
                    TextSpan(
                      text: ' It',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: ' Out !!',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 100,
                child: Image.asset('assets/images/logo.png'),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.blueAccent),
                    ),
                    child: const Text(
                      'Gallery',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    onPressed: () {
                      Provider.of<HomeNotifer>(context, listen: false)
                          .pickUserImage(
                              context: context, source: ImageSource.gallery);
                    },
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.blueAccent),
                    ),
                    child: const Text(
                      'Camera',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    onPressed: () {
                      Provider.of<HomeNotifer>(context, listen: false)
                          .pickUserImage(
                              context: context, source: ImageSource.camera);
                    },
                  )
                ],
              ),
              Provider.of<HomeNotifer>(context, listen: true).getLoading == true
                  ? Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                            child: (Provider.of<HomeNotifer>(context, listen: false)
                                .getUserImage != null) ? Image.file(
                                Provider.of<HomeNotifer>(context, listen: false)
                                    .getUserImage!) : const SizedBox(),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SelectionArea(
                            child: Text(
                              Provider.of<HomeNotifer>(context, listen: true)
                                  .finalText!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 20.0,
                                color: Colors.white60,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Provider.of<HomeNotifer>(context, listen: true).finishedLoading == true ? ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.lightBlue),
                            ),
                            child: const Text(
                              'Copy It !!',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            onPressed: () async {
                              Provider.of<HomeNotifer>(context, listen: false)
                                  .copyTextToClipBoard(context: context);
                            },
                          ) :
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all(Colors.lightBlue),
                            ),
                            child: const Text(
                              'Convert',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            onPressed: () async {
                              Provider.of<HomeNotifer>(context, listen: false)
                                  .getImageFromText(context: context);
                            },
                          )
                        ],
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
