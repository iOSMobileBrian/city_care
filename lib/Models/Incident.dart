



class Incident{

  final String title;
  final String description;
  final String imageUrl;

  Incident( {this.title, this.description, this.imageUrl});

  factory Incident.fromJson(Map<String, dynamic> json){

    return Incident(
      title: json["title"],
      description: json["description"],
      imageUrl: json["imageUrl"]


);
  }
}