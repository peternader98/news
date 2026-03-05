import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppDrawer extends StatelessWidget {

  Function onDrawerClicked;

  AppDrawer({required this.onDrawerClicked, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      height: MediaQuery.of(context).size.height,
      color: Color(0xFF171717),
      child: Column(
        children: [
          Container(
            height: 166,
            color: Color(0xFFFFFFFF),
            child: Center(
              child: Text(
                'News App',
                style: GoogleFonts.inter(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF171717),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    onDrawerClicked();
                  },
                  child: Row(
                    children: [
                      Icon(Icons.home_filled, color: Color(0xFFFFFFFF)),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Go To Home',
                          style: GoogleFonts.inter(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12),
                Divider(color: Color(0xFFFFFFFF)),
                SizedBox(height: 12),
                Row(
                  children: [
                    Icon(Icons.imagesearch_roller_outlined, color: Color(0xFFFFFFFF)),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Theme',
                        style: GoogleFonts.inter(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                DropdownMenu(
                  width: double.infinity,
                  initialSelection: 'light',
                  onSelected: (value) {},
                  textStyle: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFFFFFFF),
                  ),
                  dropdownMenuEntries: [
                    DropdownMenuEntry(value: 'light', label: 'Light'),
                    DropdownMenuEntry(value: 'dark', label: 'Dark'),
                  ],
                ),
                SizedBox(height: 12),
                Divider(color: Color(0xFFFFFFFF)),
                SizedBox(height: 12),
                Row(
                  children: [
                    Icon(Icons.language, color: Color(0xFFFFFFFF)),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Language',
                        style: GoogleFonts.inter(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                DropdownMenu(
                  width: double.infinity,
                  initialSelection: 'english',
                  onSelected: (value) {},
                  textStyle: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFFFFFFF),
                  ),
                  dropdownMenuEntries: [
                    DropdownMenuEntry(value: 'english', label: 'English'),
                    DropdownMenuEntry(value: 'arabic', label: 'Arabic'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
