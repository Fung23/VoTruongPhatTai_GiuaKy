import 'package:flutter/material.dart';

class DoctorItem extends StatelessWidget {
  final String image;
  final String name;
  final String specialist;
  const DoctorItem({
    Key? key,
    required this.image,
    required this.name,
    required this.specialist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Hiển thị hộp thoại với thông tin bác sĩ
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Thông tin bác sĩ"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(image),
                  ),
                  const SizedBox(height: 10),
                  Text("Bác sĩ: $name"),
                  Text("Chuyên khoa: $specialist"),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Đóng hộp thoại
                  },
                  child: const Text("Đóng"),
                ),
              ],
            );
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
          width: 160,
          decoration: BoxDecoration(
            color: const Color.fromARGB(95, 179, 173, 173),
            borderRadius: BorderRadius.circular(15.0),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 14.0),
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(image),
              ),
              const SizedBox(height: 10),
              Text(
                "Dr. $name",
                overflow: TextOverflow.fade,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                specialist,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.black54),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
