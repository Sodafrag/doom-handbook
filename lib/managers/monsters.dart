import '../models/library_item.dart';

String filePath = "assets/text/library_monsters";
String imagePath = "assets/images/library_monsters";

final monstersOverview = {
  "cover": "",
  "filePath": filePath + "/monsters_overview",
};

final List<LibraryItem> monstersData = [
  LibraryItem(
    id: "id01",
    name: "堕落者（Former Human）",
    thumbImg: imagePath + "/thumbMonster_01.jpg",
    filePath: filePath + "/monster_01",
    cover: imagePath + "/m01_00.jpg",
  ),
  LibraryItem(
    id: "id02",
    name: "幼魔（Imp）",
    thumbImg: imagePath + "/thumbMonster_02.jpg",
    filePath: filePath + "/monster_02",
    cover: imagePath + "/m02_00.jpg",
  ),
  LibraryItem(
    id: "id03",
    name: "粉红魔（Pinky）",
    thumbImg: imagePath + "/thumbMonster_03.jpg",
    filePath: filePath + "/monster_03",
    cover: imagePath + "/m03_00.jpg",
  ),
  LibraryItem(
    id: "id04",
    name: "巨脑魔（Cacodemon）",
    thumbImg: imagePath + "/thumbMonster_04.jpg",
    filePath: filePath + "/monster_04",
    cover: imagePath + "/m04_00.jpg",
  ),
  LibraryItem(
    id: "id05",
    name: "地狱男爵（Baron of Hell）",
    thumbImg: imagePath + "/thumbMonster_05.jpg",
    filePath: filePath + "/monster_05",
    cover: imagePath + "/m05_00.jpg",
  ),
  LibraryItem(
    id: "id06",
    name: "地狱骑士（Hell Knight）",
    thumbImg: imagePath + "/thumbMonster_06.jpg",
    filePath: filePath + "/monster_06",
    cover: imagePath + "/m06_00.jpg",
  ),
  LibraryItem(
    id: "id07",
    name: "亡魂（Revenant）",
    thumbImg: imagePath + "/thumbMonster_07.jpg",
    filePath: filePath + "/monster_07",
    cover: imagePath + "/m07_00.jpg",
  ),
  LibraryItem(
    id: "id08",
    name: "肥球（Mancubus）",
    thumbImg: imagePath + "/thumbMonster_08.jpg",
    filePath: filePath + "/monster_08",
    cover: imagePath + "/m08_00.jpg",
  ),
  LibraryItem(
    id: "id09",
    name: "迷失丧魂（Lost Soul）",
    thumbImg: imagePath + "/thumbMonster_09.jpg",
    filePath: filePath + "/monster_09",
    cover: imagePath + "/m09_00.jpg",
  ),
  LibraryItem(
    id: "id10",
    name: "机械蜘蛛（Arachnotron）",
    thumbImg: imagePath + "/thumbMonster_10.jpg",
    filePath: filePath + "/monster_10",
    cover: imagePath + "/m10_00.jpg",
  ),
  LibraryItem(
    id: "id11",
    name: "疼痛元素（Pain Elemental）",
    thumbImg: imagePath + "/thumbMonster_11.jpg",
    filePath: filePath + "/monster_11",
    cover: imagePath + "/m11_00.jpg",
  ),
  LibraryItem(
    id: "id12",
    name: "恶魔召唤师（Arch-vile）",
    thumbImg: imagePath + "/thumbMonster_12.jpg",
    filePath: filePath + "/monster_12",
    cover: imagePath + "/m12_00.jpg",
  ),
  LibraryItem(
    id: "id13",
    name: "DOOM3独有恶魔",
    thumbImg: imagePath + "/thumbMonster_13.jpg",
    filePath: filePath + "/monster_13",
    cover: imagePath + "/u01_00.jpg",
  ),
  LibraryItem(
    id: "id14",
    name: "DOOM2016独有恶魔",
    thumbImg: imagePath + "/thumbMonster_14.jpg",
    filePath: filePath + "/monster_14",
    cover: imagePath + "/u02_00.jpg",
  ),
  LibraryItem(
    id: "id15",
    name: "DOOM永恒独有恶魔",
    thumbImg: imagePath + "/thumbMonster_15.jpg",
    filePath: filePath + "/monster_15",
    cover: imagePath + "/u03_00.jpg",
  ),
  LibraryItem(
    id: "id16",
    name: "上位恶魔",
    thumbImg: imagePath + "/thumbMonster_16.jpg",
    filePath: filePath + "/monster_16",
    cover: imagePath + "/boss_00.jpg",
  ),
];
