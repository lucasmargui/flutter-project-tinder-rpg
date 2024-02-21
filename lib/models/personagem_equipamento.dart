import 'package:my_isekai/models/item.dart';

class PersonagemEquipamento {
  Item weapon;
  Item body;
  Item head;
  Item neck;
  Item feet;
  Item legs;
  Item shield;
  Item cape;
  Item ring;
  Item hands;

  PersonagemEquipamento({
    this.weapon,
    this.body,
    this.head,
    this.neck,
    this.feet,
    this.legs,
    this.shield,
    this.cape,
    this.ring,
    this.hands,
  }) {
    weapon ??= Item(
        idunique: 10,
        id: 10,
        inteligence: 24,
        strenght: 24,
        agility: 162,
        rarity: 3,
        name: 'weapon',
        slot: 'weapon');
    body ??= Item(
        idunique: 2,
        id: 2,
        inteligence: 3,
        strenght: 14,
        agility: 42,
        rarity: 1,
        name: 'body',
        slot: 'body');
    head ??= Item(
        idunique: 1,
        id: 1,
        inteligence: 3,
        strenght: 14,
        agility: 12,
        rarity: 3,
        name: 'head',
        slot: 'head');
    neck ??= Item(
        idunique: 7,
        id: 7,
        inteligence: 3,
        strenght: 24,
        agility: 152,
        rarity: 3,
        name: 'neck',
        slot: 'neck');
    feet ??= Item(
        idunique: 4,
        id: 4,
        inteligence: 34,
        strenght: 14,
        agility: 157,
        rarity: 2,
        name: 'feet',
        slot: 'feet');
    legs ??= Item(
        idunique: 6,
        id: 6,
        inteligence: 6,
        strenght: 15,
        agility: 44,
        rarity: 3,
        name: 'legs',
        slot: 'legs');
    shield ??= Item(
        idunique: 9,
        id: 9,
        inteligence: 3,
        strenght: 14,
        agility: 32,
        rarity: 1,
        name: 'shield',
        slot: 'shield');
    cape ??= Item(
        idunique: 3,
        id: 3,
        inteligence: 3,
        strenght: 4,
        agility: 124,
        rarity: 1,
        name: 'cape',
        slot: 'cape');
    ring ??= Item(
        idunique: 8,
        id: 8,
        inteligence: 3,
        strenght: 134,
        agility: 142,
        rarity: 2,
        name: 'ring',
        slot: 'ring');
    hands ??= Item(
        idunique: 5,
        id: 5,
        inteligence: 3,
        strenght: 184,
        agility: 72,
        rarity: 2,
        name: 'hands',
        slot: 'hands');
  }
}
