import 'package:social_app/view/messages/service/messages_service.dart';

import '../service/base/messages_service_base.dart';

class MessagesRepository extends MessagesServiceBase {
  final MessagesService _messagesService;

  MessagesRepository(this._messagesService);
}
