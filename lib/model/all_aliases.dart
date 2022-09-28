class AllAliases {
  AllAliases({
    required this.aliases,
  });
  late final List<Aliases> aliases;

  AllAliases.fromJson(Map<String, dynamic> json) {
    aliases =
        List.from(json['aliases']).map((e) => Aliases.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['aliases'] = aliases.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Aliases {
  Aliases({
    required this.creationDate,
    required this.creationTimestamp,
    required this.disablePgp,
    required this.email,
    required this.enabled,
    required this.id,
    this.latestActivity,
    required this.mailbox,
    required this.mailboxes,
    this.name,
    required this.nbBlock,
    required this.nbForward,
    required this.nbReply,
    this.note,
    required this.pinned,
    required this.supportPgp,
  });
  late final String creationDate;
  late final int creationTimestamp;
  late final bool disablePgp;
  late final String email;
  late final bool enabled;
  late final int id;
  late final LatestActivity? latestActivity;
  late final Mailbox mailbox;
  late final List<Mailboxes> mailboxes;
  late final Null name;
  late final int nbBlock;
  late final int nbForward;
  late final int nbReply;
  late final String? note;
  late final bool pinned;
  late final bool supportPgp;

  Aliases.fromJson(Map<String, dynamic> json) {
    creationDate = json['creation_date'];
    creationTimestamp = json['creation_timestamp'];
    disablePgp = json['disable_pgp'];
    email = json['email'];
    enabled = json['enabled'];
    id = json['id'];
    latestActivity = null;
    mailbox = Mailbox.fromJson(json['mailbox']);
    mailboxes =
        List.from(json['mailboxes']).map((e) => Mailboxes.fromJson(e)).toList();
    name = null;
    nbBlock = json['nb_block'];
    nbForward = json['nb_forward'];
    nbReply = json['nb_reply'];
    note = null;
    pinned = json['pinned'];
    supportPgp = json['support_pgp'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['creation_date'] = creationDate;
    _data['creation_timestamp'] = creationTimestamp;
    _data['disable_pgp'] = disablePgp;
    _data['email'] = email;
    _data['enabled'] = enabled;
    _data['id'] = id;
    _data['latest_activity'] = latestActivity;
    _data['mailbox'] = mailbox.toJson();
    _data['mailboxes'] = mailboxes.map((e) => e.toJson()).toList();
    _data['name'] = name;
    _data['nb_block'] = nbBlock;
    _data['nb_forward'] = nbForward;
    _data['nb_reply'] = nbReply;
    _data['note'] = note;
    _data['pinned'] = pinned;
    _data['support_pgp'] = supportPgp;
    return _data;
  }
}

class LatestActivity {
  LatestActivity({
    required this.action,
    required this.contact,
    required this.timestamp,
  });
  late final String action;
  late final Contact contact;
  late final int timestamp;

  LatestActivity.fromJson(Map<String, dynamic> json) {
    action = json['action'];
    contact = Contact.fromJson(json['contact']);
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['action'] = action;
    _data['contact'] = contact.toJson();
    _data['timestamp'] = timestamp;
    return _data;
  }
}

class Contact {
  Contact({
    required this.email,
    required this.name,
    required this.reverseAlias,
  });
  late final String email;
  late final String name;
  late final String reverseAlias;

  Contact.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    reverseAlias = json['reverse_alias'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['email'] = email;
    _data['name'] = name;
    _data['reverse_alias'] = reverseAlias;
    return _data;
  }
}

class Mailbox {
  Mailbox({
    required this.email,
    required this.id,
  });
  late final String email;
  late final int id;

  Mailbox.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['email'] = email;
    _data['id'] = id;
    return _data;
  }
}

class Mailboxes {
  Mailboxes({
    required this.email,
    required this.id,
  });
  late final String email;
  late final int id;

  Mailboxes.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['email'] = email;
    _data['id'] = id;
    return _data;
  }
}
