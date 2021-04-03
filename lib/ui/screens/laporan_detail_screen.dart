// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:power_on_hand/core/constant/constant.dart';
// import 'package:power_on_hand/ui/screens/user_type/direktur/bottom_menu/base_bottom_menu.dart';
// import 'package:power_on_hand/ui/widgets/grafik/rounded_chip_color.dart';

// class LaporanDetailScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BaseBottomMenu(
//       title: 'Laporan Lapangan Detail',
//       children: [
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: paddingX),
//           child: ListBody(
//             children: [
//               Text(
//                 'Laporan Lapangan',
//                 style: GoogleFonts.roboto(
//                   fontSize: 18,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//               SizedBox(height: 16),
//               Text(
//                 'Penyidik',
//                 style: GoogleFonts.roboto(fontSize: 14),
//               ),
//               SizedBox(height: 4),
//               Text(
//                 'Brigadir Bagas Dermawan',
//                 style: GoogleFonts.roboto(
//                   fontSize: 14,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: 12),
//               Text(
//                 'Nama Tersangka',
//                 style: GoogleFonts.roboto(fontSize: 14),
//               ),
//               SizedBox(height: 4),
//               Text(
//                 'David Oey',
//                 style: GoogleFonts.roboto(
//                   fontSize: 14,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: 4),
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: RoundedChipColor(
//                   text: 'Lihat Foto Identitas',
//                   color: Colors.red.shade700,
//                   fontColor: Colors.white,
//                   padding: 12,
//                 ),
//               ),
//               SizedBox(height: 12),
//               Text(
//                 'Perkara',
//                 style: GoogleFonts.roboto(fontSize: 14),
//               ),
//               SizedBox(height: 4),
//               Text(
//                 'Rem quis enim. Ex officiis aperiam. Facere cum iure rerum qui. Impedit quia mollitia ut vel aut sed tempora. Dolorem et quisquam.',
//                 style: GoogleFonts.roboto(
//                   fontSize: 14,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: 12),
//               Text(
//                 'TKP',
//                 style: GoogleFonts.roboto(fontSize: 14),
//               ),
//               SizedBox(height: 4),
//               Text(
//                 'https://www.google.com/maps/place/49.46800006494457,17.11514008755796',
//                 style: GoogleFonts.roboto(
//                   fontSize: 14,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: 4),
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: RoundedChipColor(
//                   text: 'Lihat Foto TKP',
//                   color: Colors.red.shade700,
//                   fontColor: Colors.white,
//                   padding: 12,
//                 ),
//               ),
//               SizedBox(height: 12),
//               Text(
//                 'Barang Bukti',
//                 style: GoogleFonts.roboto(fontSize: 14),
//               ),
//               Text(
//                 'Laptop Asus dan 2 handphone merk Xiomi 5a',
//                 style: GoogleFonts.roboto(
//                   fontSize: 14,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: 4),
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: RoundedChipColor(
//                   text: 'Lihat Foto Barang Bukti',
//                   color: Colors.red.shade700,
//                   fontColor: Colors.white,
//                   padding: 12,
//                 ),
//               ),
//               SizedBox(height: 12),
//               Text(
//                 'Identitas Terlapor',
//                 style: GoogleFonts.roboto(fontSize: 14),
//               ),
//               Text(
//                 'David Oey',
//                 style: GoogleFonts.roboto(
//                   fontSize: 14,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: 4),
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: RoundedChipColor(
//                   text: 'Lihat Foto Identitas',
//                   color: Colors.red.shade700,
//                   fontColor: Colors.white,
//                   padding: 12,
//                 ),
//               ),
//               SizedBox(height: 12),
//               Text(
//                 'Foto Sidik Jari',
//                 style: GoogleFonts.roboto(fontSize: 14),
//               ),
//               SizedBox(height: 4),
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: RoundedChipColor(
//                   text: 'Foto Sidik Jari',
//                   color: Colors.red.shade700,
//                   fontColor: Colors.white,
//                   padding: 12,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
