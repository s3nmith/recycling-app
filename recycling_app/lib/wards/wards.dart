class Ward {
  final String category;
  final String imgUrl;

  const Ward({
    required this.category,
    required this.imgUrl,
  });
}

const tokyoWards = [
  Ward(
      category: '足立区 / Adachi', //ward type
      imgUrl: 'assets/images/wards/adachi.png'), //name of image
  Ward(
    category: '荒川区 / Arakawa',
    imgUrl: 'assets/images/wards/arakawa.png',
  ),
  Ward(
    category: '文京区 / Bunkyo',
    imgUrl: 'assets/images/wards/bunkyo.png',
  ),
  Ward(
    category: '千代田区 / Chiyoda',
    imgUrl: 'assets/images/wards/chiyoda.png',
  ),
  Ward(
    category: '中央区 / Chuo',
    imgUrl: 'assets/images/wards/chuo.png',
  ),
  Ward(
    category: '江戸川区 / Edogawa',
    imgUrl: 'assets/images/wards/edogawa.png',
  ),
  Ward(
    category: '板橋区 / Itabashi',
    imgUrl: 'assets/images/wards/itabashi.png',
  ),
  Ward(
    category: '葛飾区 / Katsushika',
    imgUrl: 'assets/images/wards/katsushika.png',
  ),
  Ward(
    category: '北区 / Kita',
    imgUrl: 'assets/images/wards/kita.png',
  ),
  Ward(
    category: '江東区 / Koto',
    imgUrl: 'assets/images/wards/koto.png',
  ),
  Ward(
    category: '目黒区 / Meguro',
    imgUrl: 'assets/images/wards/meguro.png',
  ),
  Ward(
    category: '港区 / Minato',
    imgUrl: 'assets/images/wards/minato.png',
  ),
  Ward(
    category: '中野区 / Nakano',
    imgUrl: 'assets/images/wards/nakano.png',
  ),
  Ward(
    category: '練馬区 / Nerima',
    imgUrl: 'assets/images/wards/nerima.png',
  ),
  Ward(
    category: '大田区 / Ota',
    imgUrl: 'assets/images/wards/ota.png',
  ),
  Ward(
    category: '世田谷区 / Setagaya',
    imgUrl: 'assets/images/wards/setagaya.png',
  ),
  Ward(
    category: '渋谷区 / Shibuya',
    imgUrl: 'assets/images/wards/shibuya.png',
  ),
  Ward(
    category: '品川区 / Shinagawa',
    imgUrl: 'assets/images/wards/shinagawa.png',
  ),
  Ward(
    category: '新宿区 / Shinjuku',
    imgUrl: 'assets/images/wards/shinjuku.png',
  ),
  Ward(category: '杉並区 / Suginami', imgUrl: 'assets/images/wards/suginami.png'),
  Ward(category: '墨田区 / Sumida', imgUrl: 'assets/images/wards/sumida.png'),
  Ward(category: '台東区 / Taito', imgUrl: 'assets/images/wards/taito.png'),
  Ward(category: '豊島区 / Toshima', imgUrl: 'assets/images/wards/toshima.png'),
];
