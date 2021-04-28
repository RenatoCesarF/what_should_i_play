import 'package:flutter/material.dart';
import 'package:project/shared/models/websites_model.dart';
import 'package:url_launcher/url_launcher.dart';

class s extends StatefulWidget {
  final Websites website;

  s(this.website);

  @override
  _sState createState() => _sState();
}

class _sState extends State<s> {
  Color categoryColor;
  Image svg;

  @override
  Widget build(BuildContext context) {}
}

class WebsiteLinkComponent extends StatelessWidget {
  final Websites website;

  WebsiteLinkComponent(this.website);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async => {
        await canLaunch(this.website.url)
            ? await launch(this.website.url)
            : throw 'Could not launch ${this.website.url}'
      },
      child: Container(
        decoration: BoxDecoration(
            color: getBackgroundColor(),
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            )),
        width: 50,
        height: 50,
        child: getSymbol(),
      ),
    );
  }

  Color getBackgroundColor() {
    switch (website.category) {
      case 1:
        return Color(0xffB5E6FF); //Color(0xffCDEEFF);
        break;
      case 2:
        return Color(0xffF4D35E);
        break;
      case 4:
        return Color(0xff1773EA);
        break;
      case 5:
        return Color(0xff1c9cea);
        break;
      case 6:
        return Color(0xff8C45F7);
        break;
      case 8:
        return Color(0xff322A5C);
        break;
      case 9:
        return Color(0xffF70000);
        break;
      case 11:
        return Color(0xffA2B1D2);
        break;
      case 12:
        return Color(0xff3DDB84);
        break;
      case 13:
        return Color(0xff171A21);
        break;
      case 14:
        return Color(0xffF74300);
        break;
      case 15:
        return Color(0xffFD254B);
        break;
      case 16:
        return Color(0xff111111);
        break;
      case 17:
        return Color(0xff722B91);
        break;
      case 18:
        return Color(0xff6E85D3);
        break;
      default:
        return Color(0xffE6E6E7);
        break;
    }
  }

  Widget getSymbol() {
    switch (website.category) {
      case 1:
        return Image.asset('assets/images/symbols/website.png',
            scale: 9, color: Color(0xff0D3B66));
        break;
      case 2:
        return Image.asset(
          'assets/images/symbols/book.png',
          color: Color(0xff100B00),
          scale: 15,
        );
        break;
      case 3:
        return Image.asset('assets/images/symbols/wikipedia.png', scale: 12);
        break;
      case 4:
        return Image.asset('assets/images/symbols/facebook.png',
            scale: 12, color: Color(0xffFFFBFC));
        break;
      case 5:
        return Image.asset('assets/images/symbols/twitter.png',
            scale: 15, color: Color(0xffFFFBFC));
        break;
      case 6:
        return Image.asset('assets/images/symbols/twitch.png',
            scale: 10, color: Color(0xffFFFBFC));
        break;
      case 8:
        return Image.asset('assets/images/symbols/instagramLogo.png');
      case 9:
        return Icon(Icons.play_arrow_rounded, color: Colors.white, size: 35);
        break;
      case 10:
        return Image.asset('assets/images/symbols/iphone.png', scale: 10);
        break;
      case 11:
        return Icon(Icons.tablet_mac_rounded, size: 35, color: Colors.black);
        break;
      case 12:
        return Image.asset('assets/images/symbols/android.png',
            scale: 14, color: Colors.black87);
        break;
      case 13:
        return Image.asset('assets/images/symbols/steam.png',
            scale: 5, color: Color(0xffFFFBFC));
        break;
      case 14:
        return Image.asset('assets/images/symbols/reddit.png',
            scale: 12, color: Color(0xffFFFBFC));
        break;
      case 15:
        return Image.asset('assets/images/symbols/itch.png',
            scale: 10, color: Color(0xffFFFBFC));
        break;
      case 16:
        return Image.asset('assets/images/symbols/epicGames.png',
            scale: 30, color: Color(0xffFFFBFC));
        break;
      case 17:
        return Image.asset('assets/images/symbols/gog.png',
            scale: 12, color: Color(0xffFFFBFC));
        break;
      case 18:
        return Image.asset('assets/images/symbols/discord.png',
            scale: 13, color: Color(0xffFFFBFC));
        break;
      default:
        return Image.asset('assets/images/symbols/world.png', scale: 12);
    }
  }
}
