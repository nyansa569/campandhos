import 'package:cnahr/models/models.dart';

class City {
  final String cityName;
  final String image;
  final List<School> schoolList;
  City({
    required this.cityName,
    required this.image,
    required this.schoolList,
  });
  static List<City> cities = [
    City(
        cityName: 'Accra',
        image: 'https://ama.gov.gh/img/fade-slider/accra-1.jpg',
        schoolList: School.schools),
    City(
        cityName: 'Tema',
        image:
            'https://ocdn.eu/images/pulscms/ZGU7MDA_/8dc9969154149b71470a2a3219bdc478.jpg',
        schoolList: School.schools),
    City(
        cityName: 'Takoradi',
        image:
            'https://www.travellens.co/content/images/2022/05/Accra-Ghana.jpg',
        schoolList: School.schools),
    City(
        cityName: 'Dansoman',
        image:
            'https://norvanreports.com/wp-content/uploads/2020/09/Accra.jpeg',
        schoolList: School.schools),
    City(
        cityName: 'Ho',
        image:
            'https://buzzghana.com/wp-content/uploads/2015/03/Airport-Residential-Area-Accra.jpg',
        schoolList: School.schools),
  ];
}
