class Chats {
  // Non-nullable fields must be initialized, hence using 'required' keyword
  Chats({
    required String messageId,
    required String senderId,
    required String receiverId,
    required String message,
    required String timestamp,
  })  : _messageId = messageId,
        _senderId = senderId,
        _receiverId = receiverId,
        _message = message,
        _timestamp = timestamp;

  // These fields are required to be non-nullable, hence initialized in the constructor
  String _messageId;
  String _senderId;
  String _receiverId;
  String _message;
  String _timestamp;

  // Factory constructor to create an object from a JSON map
  factory Chats.fromJson(dynamic json) {
    return Chats(
      messageId: json['messageId'] ?? '',
      senderId: json['senderId'] ?? '',
      receiverId: json['receiverId'] ?? '',
      message: json['message'] ?? '',
      timestamp: json['timestamp'] ?? '',
    );
  }

  // Getter methods
  String get messageId => _messageId;
  String get senderId => _senderId;
  String get receiverId => _receiverId;
  String get message => _message;
  String get timestamp => _timestamp;

  // Setter for message (non-nullable)
  set message(String newMessage) {
    _message = newMessage;
  }

  // Method to convert object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'messageId': _messageId,
      'senderId': _senderId,
      'receiverId': _receiverId,
      'message': _message,
      'timestamp': _timestamp,
    };
  }
}