import 'package:flutter/material.dart';

class Wid1 extends StatefulWidget {
  @override
  State<Wid1> createState() => _Wid1State();
}

class _Wid1State extends State<Wid1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose Role"),
        centerTitle: true,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            GestureDetector(
              onTap: () {
                print("User chosen");
              },
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Container(
                  width: 150,
                  height: 200,
                  padding: EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Image.asset("images/user.png" , width: 100, height:100),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "User",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(width: 20),
            GestureDetector(
              onTap: () {
                print("Herafy chosen");
              },
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Container(
                  width: 150,
                  height: 200,
                  padding: EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Image.asset("images/worker.png", width: 100, height: 100,),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Herafy",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
