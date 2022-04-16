import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/constant/r.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import '../../model/album.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Album? album;
  fetchData() async {
    final result = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
    if (result.statusCode == 200) {
      final json = jsonDecode(result.body);
      album = Album.fromJson(json);
      setState(() {});
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Oopss.. Ada masalah!")));
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF3F7F8),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              if (album != null)
                Text(album!.title!)
              else
                Text("Belum ada data."),
              Padding(
                padding: const EdgeInsets.all(21.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hi, Achieva!",
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            "Selamat Datang",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      "assets/main/ic_avatar.png",
                      width: 35,
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: R.colors.primary,
                ),
                height: 147,
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        "Mau kerjain latihan soal apa hari ini?",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          height: 1.5,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    FractionalTranslation(
                      translation: Offset(0.04, 0),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Image.asset(
                          "assets/main/img_home.png",
                          width: MediaQuery.of(context).size.width * 0.6,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
