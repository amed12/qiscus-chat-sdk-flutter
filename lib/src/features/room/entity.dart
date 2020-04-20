import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:qiscus_chat_sdk/src/core/extension.dart';
import 'package:qiscus_chat_sdk/src/features/message/entity.dart';
import 'package:qiscus_chat_sdk/src/features/user/entity/participant.dart';
import 'package:qiscus_chat_sdk/src/features/user/entity/user.dart';

class ChatRoom {
  final String uniqueId;
  final QRoomType type;
  final Option<String> name, avatarUrl;
  final Option<int> totalParticipants, unreadCount, id;
  final Option<IMap<String, dynamic>> extras;
  final Option<ISet<Participant>> participants;
  final Option<Message> lastMessage;
  final Option<User> sender;

  ChatRoom._({
    @required this.uniqueId,
    @required this.type,
    this.id,
    this.name,
    this.unreadCount,
    this.avatarUrl,
    this.totalParticipants,
    this.extras,
    this.participants,
    this.lastMessage,
    this.sender,
  });

  factory ChatRoom({
    @required String uniqueId,
    @required QRoomType type,
    Option<int> id,
    Option<String> name,
    Option<int> unreadCount,
    Option<String> avatarUrl,
    Option<int> totalParticipants,
    Option<IMap<String, dynamic>> extras,
    Option<ISet<Participant>> participants,
    Option<Message> lastMessages,
    Option<User> sender,
    Option<Message> lastMessage,
  }) =>
      ChatRoom._(
        uniqueId: uniqueId,
        type: type,
        id: id ?? none(),
        name: name ?? none(),
        unreadCount: unreadCount ?? none(),
        avatarUrl: avatarUrl ?? none(),
        totalParticipants: totalParticipants ?? none(),
        extras: extras ?? none(),
        participants: participants ?? none(),
        lastMessage: lastMessages ?? none(),
        sender: sender ?? none(),
      );

  factory ChatRoom.fromJson(Map<String, dynamic> json) {
    var participants = optionOf((json['participants'] as List))
        .map((it) => it.cast<Map<String, dynamic>>())
        .map((it) => it.map((json) => Participant.fromJson(json)))
        .map((it) => isetWithOrder(Participant.participantOrder, it));

    QRoomType _type;
    var jsonType = json['room_type'] as String;
    var isChannel = json['is_public_channel'] as bool;
    if (isChannel) {
      _type = QRoomType.channel;
    } else if (jsonType == 'single') {
      _type = QRoomType.single;
    } else if (jsonType == 'group') {
      _type = QRoomType.group;
    } else {
      _type = QRoomType.single;
    }
    return ChatRoom(
      name: optionOf(json['room_name'] as String),
      uniqueId: json['unique_id'] as String,
      id: optionOf(json['id'] as int),
      unreadCount: optionOf(json['unread_count'] as int),
      avatarUrl: optionOf(json['avatar_url'] as String),
      totalParticipants: optionOf(json['room_total_participants'] as int),
      extras: optionOf(json['extras'] as Map<String, dynamic>).map(imap),
      participants: participants,
      type: _type,
      sender: none<User>(),
      lastMessage: catching<Message>(
        () => Message(
          id: json['last_comment_id'] as int,
          text: optionOf(json['last_comment_message'] as String),
          sender: none(),
        ),
      ).toOption(),
    );
  }

  QChatRoom toModel() => QChatRoom(
        uniqueId: uniqueId,
        id: id.toNullable(),
        avatarUrl: avatarUrl.toNullable(),
        extras: extras.map((it) => it.toMap()).toNullable(),
        lastMessage: lastMessage.map((it) => it.toModel()).toNullable(),
        name: name.toNullable(),
        participants: participants
            .getOrElse(() => emptySet())
            .toIterable()
            .map((p) => p.toModel())
            .toList(growable: false),
        totalParticipants: participants.length(),
        type: type,
        unreadCount: unreadCount.toNullable(),
      );
}

class QChatRoom {
  final int id, unreadCount, totalParticipants;
  final String name, uniqueId, avatarUrl;
  final Map<String, dynamic> extras;
  final QMessage lastMessage;
  final QRoomType type;
  final List<QParticipant> participants;

  QChatRoom({
    @required this.id,
    this.name,
    this.uniqueId,
    this.unreadCount,
    this.avatarUrl,
    this.totalParticipants,
    this.extras,
    this.participants,
    this.lastMessage,
    this.type,
  });

  @override
  String toString() => 'QChatRoom('
      'id=$id,'
      'name=$name,'
      'uniqueId=$uniqueId,'
      'unreadCount=$unreadCount,'
      'avatarUrl=$avatarUrl,'
      'totalParticipants=$totalParticipants,'
      'extras=$extras,'
      'participants=$participants,'
      'lastMessage=$lastMessage,'
      'type=$type'
      ')';
}

enum QRoomType {
  single,
  group,
  channel,
}
