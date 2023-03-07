// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'package:portfolio_flutter/utils/constants.dart';

import 'package:portfolio_flutter/utils/utils.dart';
import 'package:portfolio_flutter/widgets/contact_item.dart';
import 'package:portfolio_flutter/widgets/custom_elevated_button.dart';

class DesktopContactPage extends StatefulWidget {
  const DesktopContactPage({
    Key? key,
    required this.accent,
  }) : super(key: key);

  final Color accent;

  @override
  State<DesktopContactPage> createState() => _DesktopContactPageState();
}

class _DesktopContactPageState extends State<DesktopContactPage> {
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

    return Column(
      children: [
        Text(
          "Have you any questions?",
          style: TextStyle(
              fontSize: Theme.of(context).textTheme.headlineSmall?.fontSize,
              fontWeight: FontWeight.w600,
              color: widget.accent),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "I'M AT YOUR SERVICES",
          style: GoogleFonts.poppins(
              fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).textTheme.titleMedium?.color),
        ),
        const SizedBox(
          height: 30,
        ),
        Wrap(
          children: [
            ContactItem(
              icon: Icons.phone,
              iconColor: widget.accent,
              header: "Call Me On",
              value: "+998946235947",
            ),
            ContactItem(
              icon: Icons.telegram,
              iconColor: widget.accent,
              header: "Write Me On Telegram",
              value: "https://t.me/MainActivityDotKt",
            ),
            ContactItem(
              icon: Icons.mail,
              iconColor: widget.accent,
              header: "Write Me On E-Mail",
              value: "mukatdisovilyas@gmail.com",
            ),
            ContactItem(
                icon: Icons.pending_rounded,
                iconColor: widget.accent,
                header: "Check My Projects",
                value: "https://github.com/IlyasMukatdisov"),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        const SizedBox(
          height: 30,
        ),
        const SizedBox(
          height: 30,
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          "Send me an Email",
          style: GoogleFonts.poppins(
              fontSize: Theme.of(context).textTheme.headlineSmall?.fontSize,
              fontWeight: FontWeight.w600,
              color: widget.accent),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "I'LL TRY TO RESPOND AS FAST AS POSSIBLE",
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
              fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).textTheme.titleMedium?.color),
        ),
        const SizedBox(
          height: 20,
        ),
        TextField(
          controller: controllerSubject,
          decoration: InputDecoration(
            hintText: 'Subject',
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: widget.accent, width: 1),
              borderRadius: BorderRadius.circular(20),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: widget.accent, width: 1),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        TextField(
          controller: controllerMessage,
          maxLines: 8,
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: widget.accent, width: 1),
              borderRadius: BorderRadius.circular(20),
            ),
            hintText: 'Message',
            border: OutlineInputBorder(
              borderSide: BorderSide(color: widget.accent, width: 1),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          width: double.maxFinite,
          alignment: Alignment.centerLeft,
          child: CustomElevatedButton(
              accent: widget.accent,
              onPressed: () async {
                launchEmail(
                    toEmail: Constants.EMAIL,
                    subject: controllerSubject.text,
                    message: controllerMessage.text);
              },
              text: "Send Message"),
        ),
      ],
    );
  }
}
