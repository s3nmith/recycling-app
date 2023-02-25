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
    // 음식 사진 데이터
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

    // 화면에 보이는 영역
    return Scaffold(
      appBar: AppBar(
        elevation: 0, // 그림자 없애기
        backgroundColor: Colors.white, // 배경 색상
        centerTitle: true, // title 중앙 정렬
        iconTheme: IconThemeData(color: Colors.black), // app bar icon color
        title: Text(
          "Tokyo Wards",
          style: TextStyle(
            color: Colors.black,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          /// My Button
          IconButton(
            onPressed: () {
              print("go my page");
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecondPage()),
              );
            },
            icon: Icon(
              Icons.person_outline,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          /// 검색
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
                // 돋보기 아이콘
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

          /// 카테고리 목록
          Expanded(
            child: ListView.builder(
              // 보여주려는 데이터 개수
              itemCount: dataList.length,
              // itemCount 만큼 반복되며 화면에 보여주려는 위젯
              // index가 0부터 dataList.length - 1까지 증가하며 전달됩니다.
              itemBuilder: (context, index) {
                // dataList에서 index에 해당하는 data 꺼내기
                Map<String, dynamic> data = dataList[index];
                String category = data["category"];
                String imgUrl = data["imgUrl"];

                // 카드 형태의 위젯
                return Card(
                  margin: const EdgeInsets.all(8),
                  // 위젯들을 위로 중첩하기 위해 Stack 위젯 사용
                  child: Stack(
                    alignment: Alignment.center, // 중앙 정렬
                    children: [
                      /// 배경 이미지
                      Image.network(
                        imgUrl,
                        width: double.infinity, // 가득 채우기
                        height: 100,
                        fit: BoxFit
                            .cover, // 이미지 비율을 유지하며 주어진 width와 height를 가득 채우기
                      ),

                      /// 배경 위에 글씨가 보이도록 반투명한 박스 추가
                      Container(
                        width: double.infinity,
                        height: 100,
                        color: Colors.black.withOpacity(0.4), // 투명도 40%
                      ),

                      /// 카테고리
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

      /// AppBar 왼쪽에 아이콘을 누를 때 왼쪽에서 오른쪽으로 나오는 위젯
      /// 해당 위젯을 추가하면 AppBar 왼쪽에 아이콘이 자동으로 추가됨
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
                width: double.infinity, // 가득 채우기
                child: Column(
                  children: [
                    /// 동그란 배경
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

                    /// 닉네임 상단 여백
                    SizedBox(height: 16),

                    /// 닉네임
                    Text(
                      "Jimmy",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    /// 이메일
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

            /// 이벤트 배너
            // 특정 비율로 위젯을 보여주기

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
