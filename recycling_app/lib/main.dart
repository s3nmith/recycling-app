import 'package:flutter/material.dart';
import 'secondpage.dart';
import 'camera.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> dataList = [
      {
        "category": "新宿区 / Shinjuku",
        "imgUrl":
            "https://upload.wikimedia.org/wikipedia/commons/thumb/7/76/Flag_of_Shinjuku%2C_Tokyo.svg/2560px-Flag_of_Shinjuku%2C_Tokyo.svg.png",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Tokyo Wards",
          style: TextStyle(
            color: Colors.black,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              print("go my page");
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecondPage()),
              );
            },
            icon: Image.asset('assets/images/logo.png'),
            /*
            Icon(
              Icons.person_outline,
            ),
            */
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              autofocus: true,
              onChanged: (text) {
                print(text);
              },
              onSubmitted: (text) {
                print("on submitted : $text");
              },
              decoration: InputDecoration(
                hintText: "Search Tokyo Wards",
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                prefixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    print("돋보기 아이콘 클릭");
                  },
                ),
              ),
            ),
          ),
          Divider(height: 1),
          Expanded(
            child: ListView.builder(
              itemCount: dataList.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> data = dataList[index];
                String category = data["category"];
                String imgUrl = data["imgUrl"];
                
                return GestureDetector(
                  child: Card(
                    margin: const EdgeInsets.all(8),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.network(
                          imgUrl,
                          width: double.infinity,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          width: double.infinity,
                          height: 100,
                          color: Colors.black.withOpacity(0.4),
                        ),
                        Text(
                          category,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder:(context)=>CameraScreen()));
                  }
                );
              },
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            // Drawer 윗 부분
            DrawerHeader(
              margin: const EdgeInsets.all(0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    "https://img.freepik.com/premium-photo/leaves-twig-corner-white-background_23-2148217806.jpg?w=1800",
                  ),
                ),
              ),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 36,
                      backgroundColor: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),

                        /// 이미지
                        child: Image.network(
                          "https://i.ibb.co/CwzHq4z/trans-logo-512.png",
                          width: 62,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      "Jimmy",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "jimmy@gmail.com",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 430),
              child: ListTile(
                title: Text(
                  'History',
                  style: TextStyle(fontSize: 18),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                ),
                onTap: () {},
              ),
            ),

            ListTile(
              title: Text(
                'Setting',
                style: TextStyle(fontSize: 18),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                'Log out',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.red,
                ),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}


