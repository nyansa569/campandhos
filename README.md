# cnahr

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DetailedHostel(
                            hData: data[index],
                          ),
                        ),
                      );
                    },
                    child: ListCard(
                      name: data[index].hostelName,
                      image: data[index].image,
                      description: data[index].description,
                      subSect:
                          '${data[index].hostelRooms.length} rooms available',
                    ),
                  );
                },