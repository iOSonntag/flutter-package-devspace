


part of devspace;

// ignore: camel_case_types
enum kBlueFormsControllerEvent {
  next,
  badInputs
}

class BlueFormsController extends ChangeNotifier {
  Map<String, String> _badInputMessages = {};

  kBlueFormsControllerEvent _currentEvent = kBlueFormsControllerEvent.next;
  kBlueFormsControllerEvent get currentEvent => _currentEvent;


  void next() {
    _currentEvent = kBlueFormsControllerEvent.next;
    notifyListeners();
  }

  void setBadInputMessages(Map<String, String> messages) {
    _currentEvent = kBlueFormsControllerEvent.badInputs;
    _badInputMessages = messages;
    notifyListeners();
  }

  Map<String, String> getBadInputMessages() {
    return _badInputMessages;
  }
}
