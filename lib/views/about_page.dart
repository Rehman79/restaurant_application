import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/custom_text.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> siximg=[
      'lib/Assets/img/footer_five.png',
      'lib/Assets/img/footer3.png',
      'lib/Assets/img/footer_six.png',
      'lib/Assets/img/footer_one.png',
      'lib/Assets/img/footer_four.png',
      'lib/Assets/img/footer_two.png',
    ];
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Icon(Icons.abc, size: 100),
                SizedBox(height: 16),
                CustomText(
                  content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus lacinia odio vitae vestibulum vestibulum.',is_col_white: false,
                ),
                SizedBox(height: 16),
                // Email TextField and Button
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    IconButton(
                      icon: Icon(Icons.send),color: Theme.of(context).primaryColor,
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: CustomText(content: 'Email sent!')),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 32),

            // Contact Us Section
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(content: 'Contact Us',is_col_white: false,is_bold: true,),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined),
                      SizedBox(width: 8),
                      CustomText(content: '25950 Long Lane, North Ismael 14280',color: Colors.black.withOpacity(0.7)),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.phone_outlined),
                      SizedBox(width: 8),
                      CustomText(content: '00965 - 96659986',color: Colors.black.withOpacity(0.7)),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.mail_outline),
                      SizedBox(width: 8),
                      CustomText(content: 'Jeramine.connelly@yahoo.com',color: Colors.black.withOpacity(0.7)),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.access_time),
                      SizedBox(width: 8),
                      CustomText(content: 'Sun - Sat/10:00 AM - 8:00 PM',color: Colors.black.withOpacity(0.7)),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 32),

            // Social Links Section
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(content: 'Social Links',is_col_white: false,is_bold: true,),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.facebook),
                        onPressed: () => _launchURL('https://www.facebook.com'),
                      ),
                      IconButton(
                        icon: Icon(Icons.camera_alt), // Instagram Icon
                        onPressed: () => _launchURL('https://www.instagram.com'),
                      ),
                      IconButton(
                        icon: Icon(Icons.alternate_email), // Twitter/X Icon
                        onPressed: () => _launchURL('https://www.twitter.com'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 32),

            // Gallery Section
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(content: 'Gallery',is_col_white: false,is_bold: true,),
                  SizedBox(height: 16),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 6, // Assuming 6 images in the gallery
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 8.0,
                      crossAxisSpacing: 8.0,
                      childAspectRatio: 1,
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: AssetImage(siximg[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 20,),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 30.0),
        child: FloatingActionButton(onPressed: (){},child: Icon(Icons.person_outline),backgroundColor: Theme.of(context).primaryColor,),
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
