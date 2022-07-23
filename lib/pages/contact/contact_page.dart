import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_flutter/utils/app_colors.dart';
import 'package:portfolio_flutter/utils/dimensions.dart';
import 'package:portfolio_flutter/widgets/app_bar_text.dart';
import 'package:portfolio_flutter/widgets/contact_item.dart';
import 'package:portfolio_flutter/widgets/custom_drawer.dart';
import 'package:portfolio_flutter/widgets/custom_elevated_button.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: isDarkMode == true ? Colors.black : Colors.white,
          statusBarIconBrightness: isDarkMode == true ? Brightness.light : Brightness.dark),
    );

    Dimensions.context = context;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          iconTheme: IconThemeData(color: AppColors.red),
          title: const AppBarText(text: "Contact"),
        ),
        drawer: const CustomDrawer(),
        body: Container(
          padding: EdgeInsets.all(Dimensions.height20),
          width: double.maxFinite,
          height: double.maxFinite,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "Have you any questions?",
                  style: TextStyle(
                      fontSize: Dimensions.height20,
                      fontWeight: FontWeight.w600,
                      color: AppColors.red),
                ),
                SizedBox(
                  height: Dimensions.height20,
                ),
                Text(
                  "I'M AT YOUR SERVICES",
                  style: GoogleFonts.poppins(
                      fontSize: Dimensions.height10 * 1.5,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).textTheme.subtitle1?.color),
                ),
                SizedBox(
                  height: Dimensions.height30,
                ),
                ContactItem(
                    icon: Icons.phone,
                    iconColor: AppColors.red,
                    header: "Call Me On",
                    value: "+998946235947"),
                SizedBox(
                  height: Dimensions.height30,
                ),
                ContactItem(
                    icon: Icons.telegram,
                    iconColor: AppColors.red,
                    header: "Write Me On Telegram",
                    value: "https://t.me/MainActivityDotKt"),
                SizedBox(
                  height: Dimensions.height30,
                ),
                ContactItem(
                    icon: Icons.mail,
                    iconColor: AppColors.red,
                    header: "Write Me On E-Mail",
                    value: "mukatdisovilyas@gmail.com"),
                SizedBox(
                  height: Dimensions.height30,
                ),
                ContactItem(
                    icon: Icons.pending_rounded,
                    iconColor: AppColors.red,
                    header: "Check My Projects",
                    value: "https://github.com/IlyasMukatdisov"),
                SizedBox(
                  height: Dimensions.height30,
                ),
                Text(
                  "Send me an Email",
                  style: GoogleFonts.poppins(
                      fontSize: Dimensions.height20,
                      fontWeight: FontWeight.w600,
                      color: AppColors.red),
                ),
                SizedBox(
                  height: Dimensions.height20,
                ),
                Text(
                  "I'LL TRY TO RESPOND AS FAST AS POSSIBLE",
                  style: GoogleFonts.poppins(
                      fontSize: Dimensions.height10 * 1.5,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).textTheme.subtitle1?.color),
                ),
                SizedBox(
                  height: Dimensions.height20,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Email',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.grey.withOpacity(0.2), width: 1),
                      borderRadius: BorderRadius.circular(Dimensions.height20),
                    ),
                  ),
                ),
                SizedBox(
                  height: Dimensions.height20,
                ),
                TextField(
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    hintText: 'Text',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.grey.withOpacity(0.2), width: 1),
                      borderRadius: BorderRadius.circular(Dimensions.height20),
                    ),
                  ),
                ),
                SizedBox(
                  height: Dimensions.height20,
                ),
                Container(
                    width: double.maxFinite,
                    alignment: Alignment.centerLeft,
                    child: CustomElevatedButton(
                        onPressed: () {}, text: "Send Message"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
