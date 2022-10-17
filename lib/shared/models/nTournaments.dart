import 'dart:convert';

List<NTournaments> newtonGamesFromJson(String str) => List<NTournaments>.from(json.decode(str).map((x) => NTournaments.fromJson(x)));

String newtonGamesToJson(List<NTournaments> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NTournaments {
    NTournaments({
        this.id,
        this.url,
        this.name,
        this.priority,
        this.type,
        this.tournaments,
        this.meta,
    });

    int? id;
    String? url;
    String? name;
    int? priority;
    int? type;
    List<Tournament>? tournaments;
    NewtonGameMeta? meta;

    factory NTournaments.fromJson(Map<String, dynamic> json) => NTournaments(
        id: json["id"],
        url:json["url"],
        name: json["name"],
        priority:  json["priority"],
        type:json["type"],
        tournaments: json["tournaments"] == null ? null : List<Tournament>.from(json["tournaments"].map((x) => Tournament.fromJson(x))),
        meta: json["meta"] == null ? null : NewtonGameMeta.fromJson(json["meta"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "url": url == null ? null : url,
        "name": name == null ? null : name,
        "priority": priority == null ? null : priority,
        "type": type == null ? null : type,
        "tournaments": tournaments == null ? null : List<dynamic>.from(tournaments!.map((x) => x.toJson())),
        "meta": meta == null ? null : meta?.toJson(),
    };
}

class NewtonGameMeta {
    NewtonGameMeta({
        this.ui,
    });

    PurpleUi? ui;

    factory NewtonGameMeta.fromJson(Map<String, dynamic> json) => NewtonGameMeta(
        ui:  PurpleUi.fromJson(json["ui"]),
    );

    Map<String, dynamic> toJson() => {
        "ui": ui == null ? null : ui!.toJson(),
    };
}

class PurpleUi {
    PurpleUi({
        this.blockedText,
    });

    BlockedText? blockedText;

    factory PurpleUi.fromJson(Map<String, dynamic> json) => PurpleUi(
        blockedText:BlockedText.fromJson(json["blocked_text"]),
    );

    Map<String, dynamic> toJson() => {
        "blocked_text": blockedText == null ? null : blockedText!.toJson(),
    };
}

class BlockedText {
    BlockedText({
        this.text,
        this.style,
    });

    Translations? text;
    String? style;

    factory BlockedText.fromJson(Map<String, dynamic> json) => BlockedText(
        text: json["text"] == null ? null : Translations.fromJson(json["text"]),
        style: json["style"] == null ? null : json["style"],
    );

    Map<String, dynamic> toJson() => {
        "text": text == null ? null : text!.toJson(),
        "style": style == null ? null : style,
    };
}

class Translations {
    Translations({
        this.ro,
        this.en,
    });

    String? ro;
    String? en;

    factory Translations.fromJson(Map<String, dynamic> json) => Translations(
        ro: json["ro"],
        en: json["en"],
    );

    Map<String, dynamic> toJson() => {
        "ro":  ro,
        "en":  en,
    };
}

class Tournament {
    Tournament({
        this.id,
        this.missionGroupId,
        this.name,
        this.startDate,
        this.endDate,
        this.enrolled,
        this.activated,
        this.type,
        this.meta,
    });

    int? id;
    int? missionGroupId;
    String? name;
    DateTime? startDate;
    DateTime? endDate;
    bool? enrolled;
    bool? activated;
    int? type;
    TournamentMeta? meta;

    factory Tournament.fromJson(Map<String, dynamic> json) => Tournament(
        id: json["id"],
        missionGroupId:json["mission_group_id"],
        name: json["name"],
        startDate:  DateTime.fromMicrosecondsSinceEpoch(json["start_date"]),
        endDate: DateTime.fromMicrosecondsSinceEpoch(json["end_date"]),
        enrolled:  json["enrolled"],
        activated: json["activated"],
        type: json["type"],
        meta: json["meta"] == null ? null : TournamentMeta.fromJson(json["meta"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "mission_group_id":  missionGroupId,
        "name": name,
        "start_date":  startDate!.microsecondsSinceEpoch,
        "end_date": endDate!.microsecondsSinceEpoch,
        "enrolled":enrolled,
        "activated":  activated,
        "type":  type,
        "meta": meta == null ? null : meta!.toJson(),
    };
}

class TournamentMeta {
    TournamentMeta({
        this.ui,
        this.games,
        this.recommended,
        this.levels,
        this.sportFilters,
        this.stars,
        this.baseValuePerLeu,
    });

    FluffyUi? ui;
    List<int>? games;
    List<int>? recommended;
    int? levels;
    SportFilters? sportFilters;
    List<dynamic>? stars;
    dynamic baseValuePerLeu;

    factory TournamentMeta.fromJson(Map<String, dynamic> json) => TournamentMeta(
        ui: json["ui"] == null ? null : FluffyUi.fromJson(json["ui"]),
        games: json["games"] == null ? null : List<int>.from(json["games"].map((x) => x)),
        recommended: json["recommended"] == null ? null : List<int>.from(json["recommended"].map((x) => x)),
        levels: json["levels"],
        sportFilters: json["sport_filters"] == null ? null : SportFilters.fromJson(json["sport_filters"]),
        stars: json["stars"] == null ? null : List<dynamic>.from(json["stars"].map((x) => x)),
        baseValuePerLeu: json["base_value_per_leu"],
    );

    Map<String, dynamic> toJson() => {
        "ui": ui == null ? null : ui!.toJson(),
        "games": games == null ? null : List<dynamic>.from(games!.map((x) => x)),
        "recommended": recommended == null ? null : List<dynamic>.from(recommended!.map((x) => x)),
        "levels": levels == null ? null : levels,
        "sport_filters": sportFilters == null ? null : sportFilters!.toJson(),
        "stars": stars == null ? null : List<dynamic>.from(stars!.map((x) => x)),
        "base_value_per_leu": baseValuePerLeu,
    };
}

class SportFilters {
    SportFilters({
        this.prematch,
        this.live,
    });

    List<Live>? prematch;
    List<Live>? live;

    factory SportFilters.fromJson(Map<String, dynamic> json) => SportFilters(
        prematch: json["prematch"] == null ? null : List<Live>.from(json["prematch"].map((x) => Live.fromJson(x))),
        live: json["live"] == null ? null : List<Live>.from(json["live"].map((x) => Live.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "prematch": prematch == null ? null : List<dynamic>.from(prematch!.map((x) => x.toJson())),
        "live": live == null ? null : List<dynamic>.from(live!.map((x) => x.toJson())),
    };
}

class Live {
    Live({
        this.name,
        this.idCategory,
        this.idSport,
        this.idTournament,
    });

    String? name;
    String? idCategory;
    String? idSport;
    String? idTournament;

    factory Live.fromJson(Map<String, dynamic> json) => Live(
        name: json["name"],
        idCategory:  json["idCategory"],
        idSport: json["idSport"],
        idTournament: json["idTournament"],
    );

    Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "idCategory": idCategory == null ? null : idCategory,
        "idSport": idSport == null ? null : idSport,
        "idTournament": idTournament == null ? null : idTournament,
    };
}

class FluffyUi {
    FluffyUi({
        this.objectivesImage,
        this.cornerImage,
        this.gamesImage,
        this.topImage,
        this.currentPlaceImage,
        this.scoresImage,
        this.rules,
        this.prize1,
        this.prize2,
    });

    ImageDef? objectivesImage;
    ImageDef? cornerImage;
    ImageDef? gamesImage;
    ImageDef? topImage;
    ImageDef? currentPlaceImage;
    ImageDef? scoresImage;
    BlockedText? rules;
    BlockedText? prize1;
    BlockedText? prize2;

    factory FluffyUi.fromJson(Map<String, dynamic> json) => FluffyUi(
        objectivesImage: json["objectives_image"] == null ? null : ImageDef.fromJson(json["objectives_image"]),
        cornerImage: json["corner_image"] == null ? null : ImageDef.fromJson(json["corner_image"]),
        gamesImage: json["games_image"] == null ? null : ImageDef.fromJson(json["games_image"]),
        topImage: json["top_image"] == null ? null : ImageDef.fromJson(json["top_image"]),
        currentPlaceImage: json["current_place_image"] == null ? null : ImageDef.fromJson(json["current_place_image"]),
        scoresImage: json["scores_image"] == null ? null : ImageDef.fromJson(json["scores_image"]),
        rules: json["rules"] == null ? null : BlockedText.fromJson(json["rules"]),
        prize1: json["prize_1"] == null ? null : BlockedText.fromJson(json["prize_1"]),
        prize2: json["prize_2"] == null ? null : BlockedText.fromJson(json["prize_2"]),
    );

    Map<String, dynamic> toJson() => {
        "objectives_image": objectivesImage == null ? null : objectivesImage!.toJson(),
        "corner_image": cornerImage == null ? null : cornerImage!.toJson(),
        "games_image": gamesImage == null ? null : gamesImage!.toJson(),
        "top_image": topImage == null ? null : topImage!.toJson(),
        "current_place_image": currentPlaceImage == null ? null : currentPlaceImage!.toJson(),
        "scores_image": scoresImage == null ? null : scoresImage!.toJson(),
        "rules": rules == null ? null : rules!.toJson(),
        "prize_1": prize1 == null ? null : prize1!.toJson(),
        "prize_2": prize2 == null ? null : prize2!.toJson(),
    };
}

class ImageDef {
    ImageDef({
        this.url,
        this.style,
    });

    String? url;
    String? style;

    factory ImageDef.fromJson(Map<String, dynamic> json) => ImageDef(
        url: json["url"] == null ? null : json["url"],
        style: json["style"] == null ? null : json["style"],
    );

    Map<String, dynamic> toJson() => {
        "url": url == null ? null : url,
        "style": style == null ? null : style,
    };
}
