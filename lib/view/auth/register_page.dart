import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant/r.dart';
import '../main/main_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

enum Gender { lakiLaki, perempuan }

class _RegisterPageState extends State<RegisterPage> {
  List<String> classSlta = ["10", "11", "12", "Gap Year", "Umum"];
  String? kelas;
  String? gender;

  setGender(Gender type) {
    if (type == Gender.lakiLaki) {
      gender = "Laki-laki";
    } else {
      gender = "Perempuan";
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F3F5),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75.0),
        child: AppBar(
          elevation: 1,
          iconTheme: IconThemeData(color: Colors.black),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: Colors.white,
          title: Text(
            "Yuk isi data diri",
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Email",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    border: Border.all(
                      color: const Color(0XFFD6D6D6),
                    ),
                  ),
                  height: 50,
                  child: const TextField(
                    // controller: registrationController.email,
                    enabled: true,
                    decoration: InputDecoration(
                      disabledBorder: InputBorder.none,
                      border: InputBorder.none,
                      hintText: "Contoh: achieva10@gmail.com",
                      hintStyle: TextStyle(
                        color: Color(0XFFAAAAAA),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                const Text(
                  "Nama Lengkap",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    border: Border.all(
                      color: const Color(0XFFD6D6D6),
                    ),
                  ),
                  height: 50,
                  child: const TextField(
                    // controller: registrationController.email,
                    enabled: true,
                    decoration: InputDecoration(
                      disabledBorder: InputBorder.none,
                      border: InputBorder.none,
                      hintText: "Contoh: Achieva Futura",
                      hintStyle: TextStyle(
                        color: Color(0XFFAAAAAA),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Jenis Kelamin",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: (5),
                ),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setGender(Gender.lakiLaki);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: gender == "Laki-laki"
                                ? Color(0xFF3A7FD5)
                                : Colors.white,
                            border: Border.all(
                              color: gender == "Laki-laki"
                                  ? Color(0xFF3A7FD5)
                                  : Color(0XFFD6D6D6),
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: (32),
                            vertical: (12),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Laki-Laki",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: gender == "Laki-laki"
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: (8),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setGender(Gender.perempuan);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: gender == "Perempuan"
                                ? Color(0xFF3A7FD5)
                                : Colors.white,
                            border: Border.all(
                              color: gender == "Perempuan"
                                  ? Color(0xFF3A7FD5)
                                  : Color(0XFFD6D6D6),
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: (32),
                            vertical: (12),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Perempuan",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: gender == "Perempuan"
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Kelas",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: (5),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: (16),
                        vertical: (5),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        border: Border.all(
                          color: Color(0XFFD6D6D6),
                        ),
                      ),
                      height: 50,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          icon: Icon(Icons.keyboard_arrow_down),
                          isExpanded: true,
                          hint: Text(
                            "Pilih Kelas",
                            style: TextStyle(
                              color: Color(0XFFAAAAAA),
                            ),
                          ),
                          items: classSlta
                              .map((e) => DropdownMenuItem(
                                    child: Text(e),
                                    value: e,
                                  ))
                              .toList(),
                          value: kelas,
                          onChanged: (String? val) {
                            kelas = val;
                            setState(() {});
                            // validation();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                const Text(
                  "Nama Sekolah",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    border: Border.all(
                      color: const Color(0XFFD6D6D6),
                    ),
                  ),
                  height: 50,
                  child: const TextField(
                    // controller: registrationController.email,
                    enabled: true,
                    decoration: InputDecoration(
                      disabledBorder: InputBorder.none,
                      border: InputBorder.none,
                      hintText: "Contoh: SMA ABCDE",
                      hintStyle: TextStyle(
                        color: Color(0XFFAAAAAA),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 35),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: Color(0xFF3A7FD5),
                    fixedSize: Size(double.infinity, 64.34),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        side: BorderSide(color: R.colors.primary)),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => MainPage(),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "DAFTAR",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
