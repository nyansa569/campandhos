import 'models.dart';

class School {
  final String schoolName;
  final String city;
  final List<String> images;
  final double latLoc;
  final double lngLoc;
  List<Hostel> schoolHostels;
  final String description;
  final String image;
  School({
    required this.schoolName,
    required this.city,
    required this.images,
    required this.latLoc,
    required this.lngLoc,
    required this.schoolHostels,
    required this.description,
    required this.image,
  });
  static List<School> schools = [
    School(
      schoolName: 'Ghana Telecom',
      city: 'Accra',
      images: [
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsrUf_CtUUkJKOB1H2vNQoS2BzVfmfzAznzkDaOMwa3sMqcbfutLVLSU5pTpuqhYqedlw&usqp=CAU'
      ],
      latLoc: 5.6037,
      lngLoc: 0.1870,
      schoolHostels: Hostel.hostels,
      description: 'Knowledge is power and schools are the banks or nkowledge',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsrUf_CtUUkJKOB1H2vNQoS2BzVfmfzAznzkDaOMwa3sMqcbfutLVLSU5pTpuqhYqedlw&usqp=CAU',
    ),
    School(
      schoolName: 'University of Professional Studies, Accra',
      city: 'Accra',
      images: ['https://upsa.edu.gh/wp-content/uploads/2020/11/centres-1.jpg'],
      latLoc: 5.6037,
      lngLoc: 0.1870,
      schoolHostels: Hostel.hostels,
      description: 'Knowledge is power and schools are the banks or nkowledge',
      image: 'https://upsa.edu.gh/wp-content/uploads/2020/11/centres-1.jpg',
    ),
    School(
      schoolName: 'University of Ghana, Legon',
      city: 'Accra',
      images: [
        'https://admission.ug.edu.gh/applying/sites/default/files/admissionsHomePage.png'
      ],
      latLoc: 5.6037,
      lngLoc: 0.1870,
      schoolHostels: Hostel.hostels,
      description: 'Knowledge is power and schools are the banks or nkowledge',
      image:
          'https://admission.ug.edu.gh/applying/sites/default/files/admissionsHomePage.png',
    ),
  ];
}
