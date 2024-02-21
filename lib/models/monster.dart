class Monster {
  int id;
  String difficulty;
  String img;
  int strength;
  int inteligence;
  int agility;
  int elementprimary;
  int elementsecondary;
  int zodiac;
  String name;

  Monster({
    this.id = 0,
    this.difficulty = 'A',
    this.img =
        'https://cdn.discordapp.com/attachments/1046824853015113789/1209221387256995910/image.png?ex=65e6222c&is=65d3ad2c&hm=da77acf64ebdb9ac3b3e0cc929ff6ad428f2beb5bf4c95d232b2713d46ca18ec&',
    this.strength = 151,
    this.inteligence = 400,
    this.agility = 654,
    this.elementprimary = 1,
    this.elementsecondary = 2,
    this.zodiac = 6,
    this.name = 'Teste',
  });
}
