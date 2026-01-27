import 'package:ui_task_2/models/chat_model.dart';
import 'package:ui_task_2/models/message_model.dart';

class ChatData {
  static final List<ChatModel> allChats = [
    ChatModel(
      partnerName: 'Haley James',
      avatar: 'https://i.pravatar.cc/150?u=haley', // Random avatar generator
      unreadCount: 9,
      messages: [
        MessageModel(message: "Hey! How are you?", isMyMessage: false),
        MessageModel(message: "I'm good, thanks!", isMyMessage: true),
        MessageModel(message: "Stand up for what you believe in", isMyMessage: true),
      ],
    ),
    ChatModel(
      partnerName: 'Nathan Scott',
      avatar: 'https://i.pravatar.cc/150?u=nathan',
      unreadCount: 0,
      messages: [
        MessageModel(message: 'One day you\'re seventeen and planning for someday. And then quietly and without...', isMyMessage: true),
      ],
    ),
    ChatModel(
      partnerName: 'Brooke Davis',
      avatar: 'https://i.pravatar.cc/150?u=brooke',
      unreadCount: 2,
      messages: [
        MessageModel(message: "Hey Lucas!", isMyMessage: false),
        MessageModel(message: "How's your project going?", isMyMessage: false),
        MessageModel(message: "Hi Brooke!", isMyMessage: true),
        MessageModel(message: "It's going well. Thanks for asking!", isMyMessage: true),
        MessageModel(message: "No worries. Let me know if you need any help 😉", isMyMessage: false),
        MessageModel(message: "You're the best!", isMyMessage: true),
        MessageModel(message: "I am who I am. No excuses.", isMyMessage: false),
      ],
    ),
    ChatModel(
      partnerName: 'Jamie Scott',
      avatar: 'https://i.pravatar.cc/150?u=jamie',
      unreadCount: 0,
      messages: [
        MessageModel(message: 'Some people are a little different. I think that\'s cool.', isMyMessage: false)
      ],
    ),
    ChatModel(
      partnerName: 'Marvin McFadden',
      avatar: 'https://i.pravatar.cc/150?u=mouth',
      unreadCount: 0,
      messages: [
        MessageModel(message: 'Last night in the NBA the Charlotte Bobcats quietly made a move that most sports fans...', isMyMessage: true)
      ],
    ),
    ChatModel(
      partnerName: 'Antwon Taylor',
      avatar: 'https://i.pravatar.cc/150?u=skills',
      unreadCount: 0,
      messages: [
        MessageModel(message: 'Meet me at the Rivercourt', isMyMessage: false)
      ],
    ),
    ChatModel(
      partnerName: 'Jake Jagielski',
      avatar: 'https://i.pravatar.cc/150?u=jake',
      unreadCount: 0,
      messages: [],
    ),
    ChatModel(
      partnerName: 'Peyton Sawyer', 
      avatar: 'https://i.pravatar.cc/150?u=skills', 
      unreadCount: 0, 
      messages: [
        MessageModel(message: 'Every song ends, but is that any reason not to enjoy the music?', isMyMessage: false)
      ]
    )
  ];
}