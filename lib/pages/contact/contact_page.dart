import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_flutter/provider/theme_provider.dart';
import 'package:portfolio_flutter/utils/dimensions.dart';
import 'package:portfolio_flutter/widgets/app_bar_text.dart';
import 'package:portfolio_flutter/widgets/contact_item.dart';
import 'package:portfolio_flutter/widgets/custom_drawer.dart';
import 'package:portfolio_flutter/widgets/custom_elevated_button.dart';
import 'package:provider/provider.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: isDarkMode == true ? Colors.black : Colors.white,
          statusBarIconBrightness:
              isDarkMode == true ? Brightness.light : Brightness.dark),
    );

    Dimensions dimensions = Dimensions(context: context);
    return SafeArea(
      child: Consumer<ThemeProvider>(
        builder: (contextP, provider, child) {
          Color accent = provider.accent;

          return Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              elevation: 0,
              iconTheme: IconThemeData(color: accent),
              title: const AppBarText(text: "Contact"),
            ),
            drawer: const CustomDrawer(),
            body: Container(
              padding: EdgeInsets.all(dimensions.height20!),
              width: double.maxFinite,
              height: double.maxFinite,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      "Have you any questions?",
                      style: TextStyle(
                          fontSize: dimensions.height20,
                          fontWeight: FontWeight.w600,
                          color: accent),
                    ),
                    SizedBox(
                      height: dimensions.height20,
                    ),
                    Text(
                      "I'M AT YOUR SERVICES",
                      style: GoogleFonts.poppins(
                          fontSize: dimensions.height10! * 1.5,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).textTheme.subtitle1?.color),
                    ),
                    SizedBox(
                      height: dimensions.height30,
                    ),
                    ContactItem(
                        icon: Icons.phone,
                        iconColor: accent,
                        header: "Call Me On",
                        value: "+998946235947"),
                    SizedBox(
                      height: dimensions.height30,
                    ),
                    ContactItem(
                        icon: Icons.telegram,
                        iconColor: accent,
                        header: "Write Me On Telegram",
                        value: "https://t.me/MainActivityDotKt"),
                    SizedBox(
                      height: dimensions.height30,
                    ),
                    ContactItem(
                        icon: Icons.mail,
                        iconColor: accent,
                        header: "Write Me On E-Mail",
                        value: "mukatdisovilyas@gmail.com"),
                    SizedBox(
                      height: dimensions.height30,
                    ),
                    ContactItem(
                        icon: Icons.pending_rounded,
                        iconColor: accent,
                        header: "Check My Projects",
                        value: "https://github.com/IlyasMukatdisov"),
                    SizedBox(
                      height: dimensions.height30,
                    ),
                    Text(
                      "Send me an Email",
                      style: GoogleFonts.poppins(
                          fontSize: dimensions.height20,
                          fontWeight: FontWeight.w600,
                          color: accent),
                    ),
                    SizedBox(
                      height: dimensions.height20,
                    ),
                    Text(
                      "I'LL TRY TO RESPOND AS FAST AS POSSIBLE",
                      style: GoogleFonts.poppins(
                          fontSize: dimensions.height10! * 1.5,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).textTheme.subtitle1?.color),
                    ),
                    SizedBox(
                      height: dimensions.height20,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Email',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.grey.withOpacity(0.2), width: 1),
                          borderRadius:
                              BorderRadius.circular(dimensions.height20!),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: dimensions.height20,
                    ),
                    TextField(
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        hintText: 'Text',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.grey.withOpacity(0.2), width: 1),
                          borderRadius:
                              BorderRadius.circular(dimensions.height20!),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: dimensions.height20,
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
          );
        },
      ),
    );
  }
}
