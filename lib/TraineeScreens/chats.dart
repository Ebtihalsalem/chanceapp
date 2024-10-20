// /// messageId : "1"
// /// senderId : "user123"
// /// receiverId : "user456"
// /// message : "مرحبا، كيف حالك؟"
// /// timestamp : "2024-10-18T13:00:00"
//
// class Chats {
//   Chats({
//       String? messageId,
//       String? senderId,
//       String? receiverId,
//       String? message,
//       String? timestamp,}){
//     _messageId = messageId;
//     _senderId = senderId;
//     _receiverId = receiverId;
//     _message = message;
//     _timestamp = timestamp;
// }
//
//   Chats.fromJson(dynamic json) {
//     _messageId = json['messageId'];
//     _senderId = json['senderId'];
//     _receiverId = json['receiverId'];
//     _message = json['message'];
//     _timestamp = json['timestamp'];
//   }
//   String? _messageId;
//   String? _senderId;
//   String? _receiverId;
//   String? _message;
//   String? _timestamp;
// Chats copyWith({  String? messageId,
//   String? senderId,
//   String? receiverId,
//   String? message,
//   String? timestamp,
// }) => Chats(  messageId: messageId ?? _messageId,
//   senderId: senderId ?? _senderId,
//   receiverId: receiverId ?? _receiverId,
//   message: message ?? _message,
//   timestamp: timestamp ?? _timestamp,
// );
//   String? get messageId => _messageId;
//   String? get senderId => _senderId;
//   String? get receiverId => _receiverId;
//   String? get message => _message;
//   String? get timestamp => _timestamp;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['messageId'] = _messageId;
//     map['senderId'] = _senderId;
//     map['receiverId'] = _receiverId;
//     map['message'] = _message;
//     map['timestamp'] = _timestamp;
//     return map;
//   }
//
// }

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
