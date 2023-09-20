import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
class HtmlTestScreen extends StatelessWidget {
  static String routeName = "/HtmlTestScreen";
  const HtmlTestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Html(
          data: r""" <p>This is a paragraph.</p>
<p>This is another paragraph.</p> """,
        ),
      ),
    );
  }
}
