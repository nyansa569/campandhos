class Room {
  final String roomName;
  final int studentsInARoom;
  bool bathroom;
  bool kitchen;
  final int width;
  final int breadth;
  final List<String> images;
  final bool availability;
  final String image;
  Room({
    required this.roomName,
    required this.studentsInARoom,
    this.bathroom = false,
    this.kitchen = false,
    required this.width,
    required this.breadth,
    required this.images,
    required this.image,
    this.availability = true,
  });
  static List<Room> rooms = [
    Room(
        roomName: 'G 01',
        studentsInARoom: 3,
        width: 100,
        breadth: 100,
        images: [
          'https://soaneemrana.org/____impro/1/onewebmedia/IMG_6505.JPG?etag=%2241319-55b3922e%22&sourceContentType=image%2Fjpeg&quality=85',
        ],
        bathroom: true,
        image:
            'https://soaneemrana.org/____impro/1/onewebmedia/IMG_6505.JPG?etag=%2241319-55b3922e%22&sourceContentType=image%2Fjpeg&quality=85'),
    Room(
      roomName: 'G 02',
      studentsInARoom: 4,
      width: 100,
      breadth: 100,
      images: [
        'https://qph.cf2.quoracdn.net/main-qimg-56eed0ac278a1c0e57090419a397d98d-lq',
      ],
      image:
          'https://qph.cf2.quoracdn.net/main-qimg-56eed0ac278a1c0e57090419a397d98d-lq',
    ),
    Room(
        roomName: 'G 03',
        studentsInARoom: 6,
        width: 100,
        breadth: 100,
        images: [
          'https://nomadsworld.com/wp-content/uploads/2018/11/nomads-brisbane-hostel-dorm.jpg'
        ],
        image:
            'https://nomadsworld.com/wp-content/uploads/2018/11/nomads-brisbane-hostel-dorm.jpg'),
    Room(
        roomName: 'G 04',
        studentsInARoom: 5,
        width: 100,
        breadth: 100,
        images: [
          'https://cf.bstatic.com/images/hotel/max1024x768/174/174912999.jpg'
        ],
        image:
            'https://cf.bstatic.com/images/hotel/max1024x768/174/174912999.jpg'),
    Room(
        roomName: 'G 05',
        studentsInARoom: 4,
        width: 100,
        breadth: 100,
        images: [
          'https://cf.bstatic.com/images/hotel/max1024x768/263/26314845.jpg'
        ],
        image:
            'https://cf.bstatic.com/images/hotel/max1024x768/263/26314845.jpg'),
    Room(
        roomName: 'G 06',
        studentsInARoom: 2,
        width: 100,
        breadth: 100,
        images: [
          'https://presidencyuniversity.in/wp-content/uploads/2017/03/Hostel-infra.jpg'
        ],
        image:
            'https://presidencyuniversity.in/wp-content/uploads/2017/03/Hostel-infra.jpg'),
    Room(
        roomName: 'G 07',
        studentsInARoom: 8,
        width: 100,
        breadth: 100,
        images: [
          'https://www.abraham.travel/jerusalem/wp-content/uploads//2019/06/8bed2-1.jpg'
        ],
        image:
            'https://www.abraham.travel/jerusalem/wp-content/uploads//2019/06/8bed2-1.jpg'),
    Room(
        roomName: 'G 08',
        studentsInARoom: 8,
        width: 100,
        breadth: 100,
        images: [
          'https://www.abraham.travel/jerusalem/wp-content/uploads/2021/05/Grand-Family-with-Art2-April-2021-9.jpg'
        ],
        image:
            'https://www.abraham.travel/jerusalem/wp-content/uploads/2021/05/Grand-Family-with-Art2-April-2021-9.jpg'),
    Room(
        roomName: 'G 10',
        studentsInARoom: 3,
        width: 100,
        breadth: 100,
        images: [
          'https://q-xx.bstatic.com/xdata/images/hotel/max500/339757287.jpg?k=f1ec2dc247d7f0a446873d77cb86711b0bae56e5836751fa439f3f8d83471001&o='
        ],
        bathroom: true,
        image:
            'https://q-xx.bstatic.com/xdata/images/hotel/max500/339757287.jpg?k=f1ec2dc247d7f0a446873d77cb86711b0bae56e5836751fa439f3f8d83471001&o='),
  ];
}
