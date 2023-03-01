import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_flutter/provider/theme_provider.dart';
import 'package:portfolio_flutter/utils/constants.dart';
import 'package:portfolio_flutter/utils/dimensions.dart';
import 'package:portfolio_flutter/utils/utils.dart';
import 'package:portfolio_flutter/widgets/app_bar_text.dart';
import 'package:portfolio_flutter/widgets/contact_item.dart';
import 'package:portfolio_flutter/widgets/custom_drawer.dart';
import 'package:portfolio_flutter/widgets/custom_elevated_button.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ContactPage extends ConsumerStatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends ConsumerState<ContactPage> {
  final controllerSubject = TextEditingController();

  final controllerMessage = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    // Clean up the controller when the widget is removed from the
    // widget tree.
    controllerSubject.dispose();
    controllerMessage.dispose();
  }

  Future launchEmail(
      {required String toEmail,
      required String subject,
      required String message}) async {
    final url =
        'mailto:$toEmail?subject=${Uri.encodeFull(subject)}&body=${Uri.encodeFull(message)}';
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    Utils.setUiOverlay(context);

    Dimensions dimensions = Dimensions(context: context);
    Color accent = ref.read(themeProvider.notifier).accent;

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
                    color: Theme.of(context).textTheme.titleMedium?.color),
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
                    color: Theme.of(context).textTheme.titleMedium?.color),
              ),
              SizedBox(
                height: dimensions.height20,
              ),
              TextField(
                controller: controllerSubject,
                decoration: InputDecoration(
                  hintText: 'Subject',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: accent, width: 1),
                    borderRadius: BorderRadius.circular(dimensions.height20!),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: accent, width: 1),
                    borderRadius: BorderRadius.circular(dimensions.height20!),
                  ),
                ),
              ),
              SizedBox(
                height: dimensions.height20,
              ),
              TextField(
                controller: controllerMessage,
                maxLines: 8,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: accent, width: 1),
                    borderRadius: BorderRadius.circular(dimensions.height20!),
                  ),
                  hintText: 'Message',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: accent, width: 1),
                    borderRadius: BorderRadius.circular(dimensions.height20!),
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
                    onPressed: () async {
                      launchEmail(
                          toEmail: Constants.EMAIL,
                          subject: controllerSubject.text,
                          message: controllerMessage.text);
                    },
                    text: "Send Message"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
