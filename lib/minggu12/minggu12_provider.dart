import 'package:flutter/foundation.dart';

class Data {
  final String text;
  final String imageUrl;
  final String subtext;
  final String subtext2;

  Data(
      {required this.text,
      required this.imageUrl,
      required this.subtext,
      required this.subtext2});
}

class Minggu12Provider with ChangeNotifier {
  List<Data> dataList = [
    Data(
        text: 'Tesla',
        imageUrl:
            'https://cdn.icon-icons.com/icons2/2699/PNG/512/tesla_logo_icon_169601.png',
        subtext: 'automotive company',
        subtext2: 'Elon Musk'),
    Data(
        text: 'Toyota',
        imageUrl:
            'https://cdn.icon-icons.com/icons2/1834/PNG/512/iconfindertoyotalogo4141639-115964_115917.png',
        subtext: 'automotive company',
        subtext2: 'Akio Toyoda'),
    Data(
        text: 'Nissan',
        imageUrl:
            'https://cdn.icon-icons.com/icons2/3913/PNG/512/nissan_logo_icon_248364.png',
        subtext: 'automotive company',
        subtext2: 'Makoto Uchida'),
    Data(
        text: 'Ford',
        imageUrl:
            'https://cdn.icon-icons.com/icons2/2699/PNG/512/ford_logo_icon_169155.png',
        subtext: 'automotive company',
        subtext2: 'Henry Ford'),
    Data(
        text: 'KFC',
        imageUrl:
            'https://cdn.icon-icons.com/icons2/3912/PNG/512/kfc_logo_icon_247916.png',
        subtext: 'restaurant chain',
        subtext2: 'Colonel Sanders'),
    Data(
        text: 'Pizza Hut',
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/id/thumb/d/d2/Pizza_Hut_logo.svg/1200px-Pizza_Hut_logo.svg.png',
        subtext: 'restaurant chain',
        subtext2: 'Frank Carney'),
    Data(
        text: 'Burger King',
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cc/Burger_King_2020.svg/1200px-Burger_King_2020.svg.png',
        subtext: 'restaurant chain',
        subtext2: 'James McLamore'),
    Data(
        text: 'McDonald',
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/McDonald%27s_Golden_Arches.svg/1200px-McDonald%27s_Golden_Arches.svg.png',
        subtext: 'restaurant chain',
        subtext2: 'Ray Kroc'),
    Data(
        text: 'Team Liquid',
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/en/thumb/f/f1/Team_Liquid_logo.svg/1200px-Team_Liquid_logo.svg.png',
        subtext: 'esport organization',
        subtext2: 'Victor Goossens'),
    Data(
        text: 'Natus Vincere',
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/en/thumb/a/ac/NaVi_logo.svg/1200px-NaVi_logo.svg.png',
        subtext: 'esport organization',
        subtext2: 'Yevhen Zolotarov'),
    Data(
        text: 'T1',
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/en/thumb/f/f9/T1_logo.svg/1200px-T1_logo.svg.png',
        subtext: 'esport organization',
        subtext2: 'Joe Marsh'),
    Data(
        text: 'RRQ',
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/6/69/RRQ_%28Rex_Regum_Qeon%29_Logo_%28SVG%29_-_Vector69Com.svg/2560px-RRQ_%28Rex_Regum_Qeon%29_Logo_%28SVG%29_-_Vector69Com.svg.png',
        subtext: 'esport organization',
        subtext2: 'Adrian Pauline'),
    Data(
        text: 'Ikea',
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c5/Ikea_logo.svg/200px-Ikea_logo.svg.png',
        subtext: 'houseware',
        subtext2: 'Ingvar F. Kamprad'),
    Data(
        text: '7-Eleven',
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/id/thumb/d/d4/7-eleven-brand.svg/1200px-7-eleven-brand.svg.png',
        subtext: 'convenience store',
        subtext2: 'Joe C. Thompson'),
    Data(
        text: 'Ace Hardware',
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ad/Ace_Hardware_Logo.svg/1200px-Ace_Hardware_Logo.svg.png',
        subtext: 'houseware',
        subtext2: 'John Venhuizen'),
    Data(
        text: 'Carrefour',
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5b/Carrefour_logo.svg/1200px-Carrefour_logo.svg.png',
        subtext: 'retail company',
        subtext2: 'Alexandre Bompard'),
    Data(
        text: 'Uniqlo',
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/9/92/UNIQLO_logo.svg/1029px-UNIQLO_logo.svg.png',
        subtext: 'retail company',
        subtext2: 'Tadashi Yanai'),
    Data(
        text: 'Shopee',
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0e/Shopee_logo.svg/1442px-Shopee_logo.svg.png',
        subtext: 'e-commerce',
        subtext2: 'Forrest Li'),
    Data(
        text: 'Tokopedia',
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/e/eb/Toped_2018-05.png/150px-Toped_2018-05.png',
        subtext: 'e-commerce',
        subtext2: 'William Tanuwijaya'),
    Data(
        text: 'Amazon',
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/Amazon_logo.svg/1200px-Amazon_logo.svg.png',
        subtext: 'e-commerce',
        subtext2: 'Jeff Bezos'),
    Data(
        text: 'Meta',
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/Meta_Platforms_Inc._logo.svg/1280px-Meta_Platforms_Inc._logo.svg.png',
        subtext: 'tech company',
        subtext2: 'Mark Zuckerberg'),
    Data(
        text: 'Discord',
        imageUrl:
            'https://cdn.icon-icons.com/icons2/2108/PNG/512/discord_icon_130958.png',
        subtext: 'social media',
        subtext2: 'Jason Citron'),
    Data(
        text: 'TikTok',
        imageUrl:
            'https://cdn.icon-icons.com/icons2/2037/PNG/512/media_social_tiktok_icon_124256.png',
        subtext: 'video hosting',
        subtext2: 'Zhang Yiming'),
    Data(
        text: 'YouTube',
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/7/72/YouTube_social_white_square_%282017%29.svg/1200px-YouTube_social_white_square_%282017%29.svg.png',
        subtext: 'video hosting',
        subtext2: 'Jawed Karim'),
    Data(
        text: 'Nike',
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/id/thumb/e/e4/Nike%28c%29.svg/1200px-Nike%28c%29.svg.png',
        subtext: 'clothing company',
        subtext2: 'Bill Bowerman'),
    Data(
        text: 'Adidas',
        imageUrl:
            'https://cdn.icon-icons.com/icons2/2699/PNG/512/adidas_logo_icon_169639.png',
        subtext: 'clothing company',
        subtext2: 'Adolf Dassler'),
    Data(
        text: 'Levis',
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/0/09/Levis-logo-quer.svg/220px-Levis-logo-quer.svg.png',
        subtext: 'clothing company',
        subtext2: 'Levi Strauss'),
    Data(
        text: 'Rolex',
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/id/thumb/9/95/Rolex_logo.svg/1200px-Rolex_logo.svg.png',
        subtext: 'watch company',
        subtext2: 'Hans Wilsdorf'),
    Data(
        text: 'Samsung',
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/2/24/Samsung_Logo.svg/1280px-Samsung_Logo.svg.png',
        subtext: 'tech company',
        subtext2: 'Lee Byung-chul'),
    Data(
        text: 'Apple',
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/commons/7/70/Logo_Apple.inc.gif',
        subtext: 'tech company',
        subtext2: 'Steve Jobs'),
  ];
}
