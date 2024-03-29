import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recycling_app/camera/home.dart';
import '../about/aboutpage.dart';
import 'wards.dart';
import '../main.dart';
import '../sign-in/auth_service.dart';
import '../history/history.dart';
import '../settings/settings.dart';

import '../sign-in/login.dart';

void main() {
  runApp(Home());
}

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => HomePage();
}

class HomePage extends State<Home> {
  List<Ward> wards = tokyoWards;

  final user = FirebaseAuth.instance.currentUser!;
  //* search function
  void searchWard(String query) {
    final suggestions = tokyoWards.where((ward) {
      final wardName = ward.category.toLowerCase();
      final input = query.toLowerCase();

      return wardName.contains(input);
    }).toList();

    setState(() => wards = suggestions);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 932;
    double width = MediaQuery.of(context).size.width / 430;

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Builder(
            builder: (context) => Scaffold(
                  //* Appbar
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OnboardingPage()),
                          );
                        },
                        icon: const Icon(Icons.info_outline_rounded),
                      ),
                    ],
                  ),

                  body: Column(
                    children: <Widget>[
                      //*This block of code is the search bar
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          autofocus: true,
                          decoration: InputDecoration(
                            hintText: "Search Tokyo Wards",
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            prefixIcon: const Icon(Icons.search),
                          ),
                          onChanged: searchWard,
                        ),
                      ),

                      //*Displays the cards
                      Divider(height: 1),
                      Expanded(
                        child: ListView.builder(
                          itemCount: wards.length,
                          itemBuilder: (context, index) {
                            final ward = wards[index];
                            String category = ward.category;
                            String imgUrl = ward.imgUrl;

                            return GestureDetector(
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  elevation: 2,
                                  margin: const EdgeInsets.all(8),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.asset(
                                            imgUrl,
                                            width: double.infinity,
                                            height: 100,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: double.infinity,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.black.withOpacity(0.4),
                                        ),
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
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          CameraScreen(category: category)));
                                });
                          },
                        ),
                      ),
                    ],
                  ),

                  //* Drawer
                  drawer: Drawer(
                    child: Column(
                      children: [
                        // Drawer
                        DrawerHeader(
                          margin: const EdgeInsets.all(0),
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
                                      "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
                                      width: 100,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                //! Temporary place holder, change to user's name and email address later

                                Text(
                                  user.email!,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        //*History Tab
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
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HistoryPage()));
                            },
                          ),
                        ),

                        //* Settings Tab
                        ListTile(
                          title: Text(
                            'Setting',
                            style: TextStyle(fontSize: 18),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.black,
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SettingsPage()));
                          },
                        ),

                        //* Logout tab
                        ListTile(
                          title: Text(
                            'Log out',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.red,
                            ),
                          ),
                          onTap: () {
                            context.read<AuthService>().signOut();
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => Login()),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                )));
  }
}
