

class Choice{

  final String title;
  final String iconUrl;
  final int id;

  const Choice(this.id, this.title, {this.iconUrl});

}

const List<Choice> choices = const <Choice>[
    Choice(2, "Logout"),
    Choice(1, "Settings")
];


