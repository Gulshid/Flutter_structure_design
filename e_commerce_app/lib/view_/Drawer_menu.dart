import 'package:e_commerce_app/view_Model/E_Provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<EProvider>(context);
    return Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: GestureDetector(
                onTap: () {
                  pro.get_image();
                },

                child: CircleAvatar(
                  radius: 50.r,
                  backgroundColor: Colors.white,
                  backgroundImage:
                      pro.image != null ? FileImage(pro.image!) : null,

                  child:
                      pro.image == null
                          ? Icon(
                            Icons.add_a_photo_outlined,
                            color: Colors.black,
                            size: 35.sp,
                          )
                          : null,
                ),
              ),
              arrowColor: Colors.black,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10.r),
              ),
              accountName: Text(
                'Gulshid Zada',
                style: GoogleFonts.agbalumo(color: Colors.white),
              ),
              accountEmail: Text(
                'gulshidzada123@gmail.com',
                style: GoogleFonts.agbalumo(
                  color: Colors.white,
                  fontSize: 15.sp,
                ),
              ),
            ),

            DrawerHeader(
              child: Column(
                children: [
                  Text('Menu', style: TextStyle(color:pro.isDarkMode? Colors.white: Colors.black)),
                  SizedBox(height: 10.h),
                  Icon(Icons.bar_chart_sharp, size: 20.sp, color:pro.isDarkMode? Colors.white: Colors.brown),
                ],
              ),
            ),

            ListTile(
              leading: Icon(Icons.light_mode_sharp, color: Colors.black),
              title: Text('Dark Mode', style: TextStyle(color: Colors.black)),
              trailing: Switch(
                activeColor: Colors.white,
                inactiveTrackColor: const Color.fromARGB(255, 215, 214, 214),
                inactiveThumbColor: Colors.white,
                activeTrackColor: Colors.green,
                value: pro.isDarkMode,
                onChanged: (bool v) {
                  pro.toggleTheme();
                },
              ),
            ),
          ],
        ));
  
  }
}
