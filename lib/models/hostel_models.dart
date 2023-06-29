import 'models.dart';

class Hostel {
  final String hostelName;
  final String description;
  final List<String> images;
  final double latLoc;
  final double lngLoc;
  final List<Room> hostelRooms;
  final String image;

  Hostel({
    required this.hostelName,
    required this.description,
    required this.images,
    required this.latLoc,
    required this.lngLoc,
    required this.hostelRooms,
    required this.image,
  });


  
  static List<Hostel> hostels = [
    Hostel(
      hostelName: 'Pentagon hostel',
      description:
          'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Ex dolore illum repellendus quam delectus quibusdam nobis? Explicabo facilis praesentium reprehenderit, rerum quis, aut quisquam totam exercitationem quae hic debitis impedit iusto et perspiciatis magni earum sed unde! Corrupti dolorum voluptatum, deleniti ex labore placeat id sed et. Suscipit nisi soluta eius cum provident voluptatum quod quibusdam consequatur, id ipsam est, veniam aperiam nihil eaque ab. Incidunt exercitationem ea veniam sit eveniet recusandae. Corporis et excepturi quae labore harum alias aspernatur quam similique aliquam nam perferendis in dolor iure ipsa, rem deleniti velit molestias? Quas, excepturi. Quo expedita dignissimos repellendus enim beatae numquam, corporis nostrum! Quasi debitis dignissimos aperiam sunt nesciunt cumque quas dolores, vel quos eos soluta quibusdam. Quod nulla exercitationem dolorum necessitatibus, eius eligendi maxime doloremque, magnam ipsum, optio delectus. Mollitia fuga libero impedit quis? Voluptas tenetur libero rem perspiciatis accusamus dolorem non, asperiores minima ut est eligendi omnis, voluptatibus vero ipsa saepe beatae. In, tempore accusamus. Blanditiis, omnis quia eaque aperiam excepturi libero, optio id similique facilis vel velit minima recusandae magni amet, a voluptatibus est illum alias cumque sed non quidem et sunt. Asperiores nostrum doloribus at autem ex! Ullam officia id corrupti eos sapiente! Nulla molestiae enim magni? Nisi, harum? A voluptates modi sed perspiciatis dolorum! Voluptatum necessitatibus repellendus natus vero quidem explicabo modi nobis aspernatur tenetur deserunt molestiae quisquam magni aliquid qui, autem, dolores veritatis possimus laudantium consequuntur magnam distinctio voluptate eum odio error? Iure nulla ipsum dignissimos ex sed fugiat reprehenderit obcaecati cum facilis fugit laborum in soluta commodi ut odio, aut neque dolorum quas, quo eius! Fugit obcaecati quibusdam modi. Illum voluptatem, quaerat alias quibusdam aliquam placeat, sint quam qui quia libero commodi. Laudantium blanditiis sint fugit, placeat eveniet enim quos hic, deserunt totam optio voluptatum labore natus vel porro molestiae perferendis sapiente?',
      images: [
        'https://blog.getrooms.co/wp-content/uploads/2019/04/pentagon-hostel-1024x768.jpg',
        'https://www.quatem.com/uploads/3/4/9/7/34974843/1070387_orig.jpg',
      ],
      latLoc: 10.8585873,
      lngLoc: -1.0752305,
      hostelRooms: Room.rooms,
      image:
          'https://blog.getrooms.co/wp-content/uploads/2019/04/pentagon-hostel-1024x768.jpg',
    ),
    Hostel(
      hostelName: 'Gateway hostel',
      description: 'The best hostel in Ghana',
      images: [
        'https://blog.getrooms.co/wp-content/uploads/2019/04/pentagon-hostel-1024x768.jpg',
        'https://www.quatem.com/uploads/3/4/9/7/34974843/1070387_orig.jpg',
      ],
      latLoc: 10.8585873,
      lngLoc: -1.0752305,
      hostelRooms: Room.rooms,
      image:
          'https://blog.getrooms.co/wp-content/uploads/2019/04/pentagon-hostel-1024x768.jpg',
    ),
    Hostel(
      hostelName: 'Palace hostel',
      description: 'A multicoloured 9 storey building',
      images: [
        'https://lh3.googleusercontent.com/p/AF1QipPlePk_mJ4BBWT0nVZmP6xilW3hllDp5mPNp4cS=w592-h404-n-k-no-v1-rj',
        'https://lh3.googleusercontent.com/p/AF1QipN6-EgNKkifKmjKMqEVpQjCzxe4b27mJd5jv4a7=w592-h404-n-k-no-v1-rj',
      ],
      latLoc: 10.8585873,
      lngLoc: -1.0752305,
      hostelRooms: Room.rooms,
      image:
          'https://lh3.googleusercontent.com/p/AF1QipPlePk_mJ4BBWT0nVZmP6xilW3hllDp5mPNp4cS=w592-h404-n-k-no-v1-rj',
    ),
    Hostel(
      hostelName: 'Palace hostel',
      description: 'A multicoloured 9 storey building',
      images: [
        'https://lh3.googleusercontent.com/p/AF1QipPlePk_mJ4BBWT0nVZmP6xilW3hllDp5mPNp4cS=w592-h404-n-k-no-v1-rj',
        'https://lh3.googleusercontent.com/p/AF1QipN6-EgNKkifKmjKMqEVpQjCzxe4b27mJd5jv4a7=w592-h404-n-k-no-v1-rj',
      ],
      latLoc: 10.8585873,
      lngLoc: -1.0752305,
      hostelRooms: Room.rooms,
      image:
          'https://lh3.googleusercontent.com/p/AF1QipPlePk_mJ4BBWT0nVZmP6xilW3hllDp5mPNp4cS=w592-h404-n-k-no-v1-rj',
    ),
    Hostel(
      hostelName: 'Palace hostel',
      description: 'A multicoloured 9 storey building',
      images: [
        'https://lh3.googleusercontent.com/p/AF1QipPlePk_mJ4BBWT0nVZmP6xilW3hllDp5mPNp4cS=w592-h404-n-k-no-v1-rj',
        'https://lh3.googleusercontent.com/p/AF1QipN6-EgNKkifKmjKMqEVpQjCzxe4b27mJd5jv4a7=w592-h404-n-k-no-v1-rj',
      ],
      latLoc: 10.8585873,
      lngLoc: -1.0752305,
      hostelRooms: Room.rooms,
      image:
          'https://lh3.googleusercontent.com/p/AF1QipPlePk_mJ4BBWT0nVZmP6xilW3hllDp5mPNp4cS=w592-h404-n-k-no-v1-rj',
    ),
    Hostel(
      hostelName: 'Palace hostel',
      description: 'A multicoloured 9 storey building',
      images: [
        'https://lh3.googleusercontent.com/p/AF1QipPlePk_mJ4BBWT0nVZmP6xilW3hllDp5mPNp4cS=w592-h404-n-k-no-v1-rj',
        'https://lh3.googleusercontent.com/p/AF1QipN6-EgNKkifKmjKMqEVpQjCzxe4b27mJd5jv4a7=w592-h404-n-k-no-v1-rj',
      ],
      latLoc: 10.8585873,
      lngLoc: -1.0752305,
      hostelRooms: Room.rooms,
      image:
          'https://lh3.googleusercontent.com/p/AF1QipPlePk_mJ4BBWT0nVZmP6xilW3hllDp5mPNp4cS=w592-h404-n-k-no-v1-rj',
    ),
    Hostel(
      hostelName: 'Palace hostel',
      description: 'A multicoloured 9 storey building',
      images: [
        'https://lh3.googleusercontent.com/p/AF1QipPlePk_mJ4BBWT0nVZmP6xilW3hllDp5mPNp4cS=w592-h404-n-k-no-v1-rj',
        'https://lh3.googleusercontent.com/p/AF1QipN6-EgNKkifKmjKMqEVpQjCzxe4b27mJd5jv4a7=w592-h404-n-k-no-v1-rj',
      ],
      latLoc: 10.8585873,
      lngLoc: -1.0752305,
      hostelRooms: Room.rooms,
      image:
          'https://lh3.googleusercontent.com/p/AF1QipPlePk_mJ4BBWT0nVZmP6xilW3hllDp5mPNp4cS=w592-h404-n-k-no-v1-rj',
    ),
    Hostel(
      hostelName: 'Palace hostel',
      description: 'A multicoloured 9 storey building',
      images: [
        'https://lh3.googleusercontent.com/p/AF1QipPlePk_mJ4BBWT0nVZmP6xilW3hllDp5mPNp4cS=w592-h404-n-k-no-v1-rj',
        'https://lh3.googleusercontent.com/p/AF1QipN6-EgNKkifKmjKMqEVpQjCzxe4b27mJd5jv4a7=w592-h404-n-k-no-v1-rj',
      ],
      latLoc: 10.8585873,
      lngLoc: -1.0752305,
      hostelRooms: Room.rooms,
      image:
          'https://lh3.googleusercontent.com/p/AF1QipPlePk_mJ4BBWT0nVZmP6xilW3hllDp5mPNp4cS=w592-h404-n-k-no-v1-rj',
    ),
    Hostel(
      hostelName: 'Palace hostel',
      description: 'A multicoloured 9 storey building',
      images: [
        'https://lh3.googleusercontent.com/p/AF1QipPlePk_mJ4BBWT0nVZmP6xilW3hllDp5mPNp4cS=w592-h404-n-k-no-v1-rj',
        'https://lh3.googleusercontent.com/p/AF1QipN6-EgNKkifKmjKMqEVpQjCzxe4b27mJd5jv4a7=w592-h404-n-k-no-v1-rj',
      ],
      latLoc: 10.8585873,
      lngLoc: -1.0752305,
      hostelRooms: Room.rooms,
      image:
          'https://lh3.googleusercontent.com/p/AF1QipPlePk_mJ4BBWT0nVZmP6xilW3hllDp5mPNp4cS=w592-h404-n-k-no-v1-rj',
    ),
    Hostel(
      hostelName: 'Palace hostel',
      description: 'A multicoloured 9 storey building',
      images: [
        'https://lh3.googleusercontent.com/p/AF1QipPlePk_mJ4BBWT0nVZmP6xilW3hllDp5mPNp4cS=w592-h404-n-k-no-v1-rj',
        'https://lh3.googleusercontent.com/p/AF1QipN6-EgNKkifKmjKMqEVpQjCzxe4b27mJd5jv4a7=w592-h404-n-k-no-v1-rj',
      ],
      latLoc: 10.8585873,
      lngLoc: -1.0752305,
      hostelRooms: Room.rooms,
      image:
          'https://lh3.googleusercontent.com/p/AF1QipPlePk_mJ4BBWT0nVZmP6xilW3hllDp5mPNp4cS=w592-h404-n-k-no-v1-rj',
    ),
  ];
}
