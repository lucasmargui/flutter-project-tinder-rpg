import 'dart:math';

import 'package:my_isekai/models/monster.dart';

class Monsters {
  // Função para gerar nomes de monstros medievais

  static Future getMonsters() async {
    List<Monster> monsters = [];

    List<String> monstersImg = [
      'https://cdn.discordapp.com/attachments/1046824853015113789/1209922898542989422/pngegg_9.png?ex=65e8af82&is=65d63a82&hm=62ed0bd3f6548f7f112bb92b6dda431c6aff9f8af645fbe45ee0ff89280ba36e&',
      'https://cdn.discordapp.com/attachments/1046824853015113789/1209922898979192962/pngegg_8.png?ex=65e8af82&is=65d63a82&hm=b49b50c8c19cdbfe60556fd9838c378f9fc90696e253336c6398657027a52eb4&',
      'https://cdn.discordapp.com/attachments/1046824853015113789/1209922899377520695/pngegg_7.png?ex=65e8af82&is=65d63a82&hm=9debc1e3a24aaa9cab65210aeb9082e6bf170a9f59bf08044f9359460caeb6f6&',
      'https://cdn.discordapp.com/attachments/1046824853015113789/1209922899717398569/pngegg_6.png?ex=65e8af82&is=65d63a82&hm=430a45a37972e1b12a05adb4a36cf0207b8273083f5ad207c9dfd5b84d694665&',
      'https://cdn.discordapp.com/attachments/1046824853015113789/1209922900174311466/pngegg_5.png?ex=65e8af82&is=65d63a82&hm=2e418f1e5052d41ac146871cc2cd6ae13fd2340b293ae94ea6bdc9a3c2c14130&',
      'https://cdn.discordapp.com/attachments/1046824853015113789/1209922900677623848/pngegg_4.png?ex=65e8af82&is=65d63a82&hm=085ef5abeb021cb2f7481bf2070eb35e41ea081160adc1aec2c1485e625969e4&',
      'https://cdn.discordapp.com/attachments/1046824853015113789/1209922901126422618/pngegg_3.png?ex=65e8af82&is=65d63a82&hm=b783e91b59f3c85953f78a8dd9632ec69f4c33652abce72e58df03c824cb8ba6&',
      'https://cdn.discordapp.com/attachments/1046824853015113789/1209922901508235334/pngegg_2.png?ex=65e8af83&is=65d63a83&hm=ab40396132760d89a85f1564480a2b9f03bca1796d7a0827a701f9c899428760&',
      'https://cdn.discordapp.com/attachments/1046824853015113789/1209922902019936276/pngegg_1.png?ex=65e8af83&is=65d63a83&hm=6bf2996ff36cd3c72eb75c4d65b70652478219eae29e43af99756e80170203eb&'
    ];

    // Lista de prefixos e sufixos para gerar nomes de monstros
    List<String> prefixos = [
      "Terrível",
      "Assustador",
      "Sinistro",
      "Demoníaco",
      "Maléfico",
      "Sombrio",
      "Poderoso",
    ];

    List<String> sufixos = [
      "das Trevas",
      "do Abismo",
      "do Terror",
      "da Perdição",
      "da Noite",
      "das Sombras",
      "do Caos",
      "do Medo",
    ];

    List<String> difficulty = ['S', 'A', 'B', 'C'];
    List<int> elementprimary = [0, 1, 2, 3];
    List<int> elementsecondary = [0, 1, 2, 3];
    List<int> zodiac = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];

    Random random = Random();
    String prefixo;
    String sufixo;

    for (int i = 0; i < 10; i++) {
      prefixo = prefixos[random.nextInt(prefixos.length)];
      sufixo = sufixos[random.nextInt(sufixos.length)];
      monsters.add(new Monster(
        id: i,
        difficulty: difficulty[Random().nextInt(3)],
        img: monstersImg[Random().nextInt(8)],
        strength: Random().nextInt(500),
        inteligence: Random().nextInt(500),
        agility: Random().nextInt(500),
        elementprimary: elementprimary[Random().nextInt(3)],
        elementsecondary: elementsecondary[Random().nextInt(3)],
        zodiac: zodiac[(Random().nextInt(11) + 1)],
        name: '$prefixo $sufixo',
      ));
    }

    return monsters;
  }
}
