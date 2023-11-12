import 'package:flutter/material.dart';

class MyAppInfo extends StatelessWidget {
  const MyAppInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'About Me',
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
            )),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15,10,15,10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                CircleAvatar(
                  radius: 60,
                  foregroundImage: Image.asset('assets/images/aboutMe.png').image,
                ),
                const SizedBox(height: 10,),
                const Text("Shreyas Tembhare",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),),
                const Text("Machine Learning Developer",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),),
                const SizedBox(height: 25,),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('About Me:',
                    style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  ),
                ),
                const SizedBox(height: 5,),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Hello, I'm Shreyas Tembhare, the mind behind the Text Extractor app. As a passionate AI enthusiast, I strive to harness the power of artificial intelligence to enhance various facets of our lives. Motivated by a desire to simplify information retrieval, I envisioned and developed this app to seamlessly extract text from photos. Join me in embracing the future where AI transforms the way we interact with and extract valuable insights from the visual world around us.",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.left,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
