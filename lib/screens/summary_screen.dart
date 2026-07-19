import 'package:flutter/material.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const bgColor = Color(0xFFF9FAFB);

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [Image.asset('assets/images/logo.png', height: 90)],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSummaryCard(
              title: 'Pesanan Terlambat',
              subtitle: 'Cucian yang sudah lewat tenggat',
              count: '00',
              gradientColors: [
                const Color(0xFFEF4444),
                const Color(0xFFDC2626),
              ],
              bgIcon: Icons.error_outline,
              iconSize: 140,
              iconRight: -20,
              iconBottom: -30,
            ),
            const SizedBox(height: 16),
            _buildSummaryCard(
              title: 'Harus Selesai',
              subtitle: 'Cucian yang harus selesai hari ini',
              count: '00',
              gradientColors: [
                const Color(0xFFF59E0B),
                const Color(0xFFD97706),
              ],
              bgIcon: Icons.hourglass_bottom,
              iconSize: 130,
              iconRight: -10,
              iconBottom: -20,
            ),
            const SizedBox(height: 16),
            _buildSummaryCard(
              title: 'Selesai',
              subtitle: 'Cucian yang selesai hari ini',
              count: '00',
              gradientColors: [
                const Color(0xFF10B981),
                const Color(0xFF059669),
              ],
              bgIcon: Icons.check,
              iconSize: 160,
              iconRight: -30,
              iconBottom: -40,
            ),
            const SizedBox(height: 16),
            _buildSummaryCard(
              title: 'Baru Masuk',
              subtitle: 'Semua cucian aktif yang masuk hari ini',
              count: '00',
              gradientColors: [
                const Color(0xFF38BDF8),
                const Color(0xFF0284C7),
              ],
              bgIcon: Icons.local_laundry_service,
              iconSize: 130,
              iconRight: -20,
              iconBottom: -20,
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFE8F5E9),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.green.shade200.withOpacity(0.5),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.info_outline,
                    color: Colors.green.shade700,
                    size: 24,
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Text(
                      'Semua ringkasan data layanan yang diambil hari ini dan akan tereset di hari selanjutnya.',
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 80), // To make space for bottom nav bar
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryCard({
    required String title,
    required String subtitle,
    required String count,
    required List<Color> gradientColors,
    required IconData bgIcon,
    required double iconSize,
    required double iconRight,
    required double iconBottom,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: gradientColors.last.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Stack(
          children: [
            Positioned(
              right: iconRight,
              bottom: iconBottom,
              child: Icon(
                bgIcon,
                size: iconSize,
                color: Colors.white.withOpacity(0.15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          subtitle,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              count,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                                height: 1.0,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 6),
                              child: Text(
                                'Pesanan',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.9),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white.withOpacity(0.6),
                        width: 1.5,
                      ),
                    ),
                    child: const Icon(
                      Icons.chevron_right,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
