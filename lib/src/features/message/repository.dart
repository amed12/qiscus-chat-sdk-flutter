part of qiscus_chat_sdk.usecase.message;

abstract class MessageRepository {
  Task<Either<QError, Message>> sendMessage(
    int roomId,
    String message, {
    String type = 'text',
    String uniqueId,
    Map<String, dynamic> extras,
    Map<String, dynamic> payload,
  });

  Task<Either<QError, List<Message>>> getMessages(
    int roomId,
    int lastMessageId, {
    bool after,
    int limit,
  });

  Task<Either<QError, Unit>> updateStatus({
    int roomId,
    int readId,
    int deliveredId,
  });

  Task<Either<QError, List<Message>>> deleteMessages({
    @required List<String> uniqueIds,
    bool isForEveryone = true,
    bool isHard = true,
  });
}
