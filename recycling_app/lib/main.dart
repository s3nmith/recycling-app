import 'package:flutter/material.dart';

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
        "category": "足立区 / Adaichi",
        "imgUrl":
            "https://upload.wikimedia.org/wikipedia/commons/thumb/0/08/Flag_of_Adachi%2C_Tokyo.svg/2560px-Flag_of_Adachi%2C_Tokyo.svg.png",
      },
      {
        "category": "荒川区 / Arakawa",
        "imgUrl":
            "https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/Flag_of_Arakawa%2C_Tokyo.svg/2560px-Flag_of_Arakawa%2C_Tokyo.svg.png",
      },
      {
        "category": "文京区 / Bunkyō",
        "imgUrl":
            "https://upload.wikimedia.org/wikipedia/commons/thumb/a/af/Flag_of_Bunkyo%2C_Tokyo.svg/2560px-Flag_of_Bunkyo%2C_Tokyo.svg.png",
      },
      {
        "category": "千代田区 / Chiyoda",
        "imgUrl":
            "https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Flag_of_Chiyoda%2C_Tokyo.svg/2560px-Flag_of_Chiyoda%2C_Tokyo.svg.png",
      },
      {
        "category": "中央区 / Chūō",
        "imgUrl":
            "https://upload.wikimedia.org/wikipedia/commons/thumb/4/40/Flag_of_Chuo%2C_Tokyo.svg/2560px-Flag_of_Chuo%2C_Tokyo.svg.png",
      },
      {
        "category": "江戸川区 / Edogawa",
        "imgUrl":
            "https://upload.wikimedia.org/wikipedia/commons/thumb/b/be/Flag_of_Edogawa%2C_Tokyo.svg/2560px-Flag_of_Edogawa%2C_Tokyo.svg.png",
      },
      {
        "category": "板橋区 / Itabashi",
        "imgUrl":
            "https://upload.wikimedia.org/wikipedia/commons/thumb/5/57/Flag_of_Itabashi%2C_Tokyo.svg/2560px-Flag_of_Itabashi%2C_Tokyo.svg.png",
      },
      {
        "category": "葛飾区 / Katsushika",
        "imgUrl":
            "https://upload.wikimedia.org/wikipedia/commons/thumb/4/43/Flag_of_Katsushika-ku%2C_Tokyo.svg/2560px-Flag_of_Katsushika-ku%2C_Tokyo.svg.png",
      },
      {
        "category": "北区 / Kita",
        "imgUrl":
            "https://upload.wikimedia.org/wikipedia/commons/thumb/0/01/Flag_of_Kita%2C_Tokyo.svg/2560px-Flag_of_Kita%2C_Tokyo.svg.png",
      },
      {
        "category": "江東区 /	Kōtō",
        "imgUrl":
            "https://upload.wikimedia.org/wikipedia/commons/thumb/6/61/Flag_of_Koto%2C_Tokyo.svg/2560px-Flag_of_Koto%2C_Tokyo.svg.png",
      },
      {
        "category": "目黒区 / Meguro",
        "imgUrl":
            "https://upload.wikimedia.org/wikipedia/commons/thumb/0/07/Flag_of_Meguro%2C_Tokyo.svg/2560px-Flag_of_Meguro%2C_Tokyo.svg.png",
      },
      {
        "category": "港区 / Minato",
        "imgUrl":
            "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Flag_of_Minato%2C_Tokyo.svg/2560px-Flag_of_Minato%2C_Tokyo.svg.png",
      },
      {
        "category": "	中野区 / Nakano",
        "imgUrl":
            "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ab/Flag_of_Nakano%2C_Tokyo.svg/2560px-Flag_of_Nakano%2C_Tokyo.svg.png",
      },
      {
        "category": "練馬区 / Nerima",
        "imgUrl":
            "https://upload.wikimedia.org/wikipedia/commons/thumb/9/94/Flag_of_Nerima%2C_Tokyo.svg/2560px-Flag_of_Nerima%2C_Tokyo.svg.png",
      },
      {
        "category": "大田区 / Ōta",
        "imgUrl":
            "https://upload.wikimedia.org/wikipedia/commons/thumb/6/68/Flag_of_Ota%2C_Tokyo.svg/2560px-Flag_of_Ota%2C_Tokyo.svg.png",
      },
      {
        "category": "世田谷区 / Setagaya",
        "imgUrl":
            "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c9/Flag_of_Setagaya%2C_Tokyo.svg/2560px-Flag_of_Setagaya%2C_Tokyo.svg.png",
      },
      {
        "category": "渋谷区 / Shibuya",
        "imgUrl":
            "https://upload.wikimedia.org/wikipedia/commons/thumb/3/31/Flag_of_Shibuya%2C_Tokyo.svg/2560px-Flag_of_Shibuya%2C_Tokyo.svg.png",
      },
      {
        "category": "品川区 / Shinagawa",
        "imgUrl":
            "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ab/Flag_of_Shinagawa%2C_Tokyo.svg/2560px-Flag_of_Shinagawa%2C_Tokyo.svg.png",
      },
      {
        "category": "新宿区 / Shinjuku",
        "imgUrl":
            "https://upload.wikimedia.org/wikipedia/commons/thumb/7/76/Flag_of_Shinjuku%2C_Tokyo.svg/2560px-Flag_of_Shinjuku%2C_Tokyo.svg.png",
      },
      {
        "category": "杉並区 / Suginami",
        "imgUrl":
            "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b2/Flag_of_Suginami%2C_Tokyo.svg/2560px-Flag_of_Suginami%2C_Tokyo.svg.png",
      },
      {
        "category": "墨田区 / Sumida",
        "imgUrl":
            "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4e/Flag_of_Sumida%2C_Tokyo.svg/2560px-Flag_of_Sumida%2C_Tokyo.svg.png",
      },
      {
        "category": "台東区 / Taitō",
        "imgUrl":
            "https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/Flag_of_Taito%2C_Tokyo.svg/2560px-Flag_of_Taito%2C_Tokyo.svg.png",
      },
      {
        "category": "豊島区 / Toshima",
        "imgUrl":
            "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5b/Flag_of_Toshima%2C_Tokyo.svg/2560px-Flag_of_Toshima%2C_Tokyo.svg.png",
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

                return Card(
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

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("클릭 되었습니다!");
        },
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.add,
          color: Colors.green,
        ),
      ),
    );
  }
}
