import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> investmentOptions = [
    {
      'name': 'Mining Machine (VIP1)',
      'dailyIncome': 4.0,
      'totalIncome': 120.0,
      'price': 100.0,
      'image': 'https://via.placeholder.com/150',
    },
    {
      'name': 'Mining Machine (VIP2)',
      'dailyIncome': 285.0,
      'totalIncome': 2000.0,
      'price': 3300.0,
      'image': 'https://via.placeholder.com/150',
    },
    {
      'name': 'Mining Machine (VIP3)',
      'dailyIncome': 8.0,
      'totalIncome': 240.0,
      'price': 200.0,
      'image': 'https://via.placeholder.com/150',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;

    final cardWidth = isSmallScreen ? screenWidth * 0.25 : 120.0;
    final fontScale = isSmallScreen ? 1.0 : 1.2;
    final spacing = isSmallScreen ? 20.0 : 30.0;

    return SingleChildScrollView(
      child: Column(
        children: [
          // Header Section (Adaptive Layout)
          Container(
            padding: EdgeInsets.all(spacing * 0.5),
            color: const Color(0xFF2A2A2A),
            child: kIsWeb
                ? (isSmallScreen
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'GrowSafe Investments',
                            style: TextStyle(
                              fontSize: 18 * fontScale,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              _buildPlatformButton(
                                context: context,
                                label: 'Normal',
                                color: Colors.blue,
                                onPressed: () {},
                              ),
                              const SizedBox(width: 8),
                              _buildPlatformButton(
                                context: context,
                                label: 'VIP',
                                color: Colors.grey,
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'GrowSafe Investments',
                            style: TextStyle(
                              fontSize: 20 * fontScale,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            children: [
                              _buildPlatformButton(
                                context: context,
                                label: 'Normal',
                                color: Colors.blue,
                                onPressed: () {},
                              ),
                              const SizedBox(width: 8),
                              _buildPlatformButton(
                                context: context,
                                label: 'VIP',
                                color: Colors.grey,
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ],
                      ))
                : Center(
                    child: Text(
                      'GrowSafe Investments',
                      style: TextStyle(
                        fontSize: 18 * fontScale,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
          ),
          SizedBox(height: spacing),
          Container(
            padding: EdgeInsets.all(spacing * 0.5),
            color: const Color(0xFF2A2A2A),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildMetricCard(
                      title: 'Balance',
                      value: '\T\s\h0.0',
                      icon: Icons.account_balance_wallet,
                      width: cardWidth,
                      fontScale: fontScale,
                    ),
                    _buildMetricCard(
                      title: 'Devices',
                      value: '0',
                      icon: Icons.devices,
                      width: cardWidth,
                      fontScale: fontScale,
                    ),
                    _buildMetricCard(
                      title: 'Profit',
                      value: '\T\s\h0.0',
                      icon: Icons.trending_up,
                      width: cardWidth,
                      fontScale: fontScale,
                    ),
                  ],
                ),
                SizedBox(height: spacing * 0.5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildPlatformActionButton(
                      context: context,
                      label: 'Recharge',
                      icon: Icons.add_circle,
                      color: Colors.green,
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Recharge clicked (Mock)')),
                        );
                      },
                    ),
                    SizedBox(width: spacing * 0.5),
                    _buildPlatformActionButton(
                      context: context,
                      label: 'Withdraw',
                      icon: Icons.remove_circle,
                      color: Colors.blue,
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Withdraw clicked (Mock)')),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: spacing * 1.5),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: spacing * 0.5),
            child: Column(
              children: investmentOptions.map((option) {
                return Card(
                  color: const Color(0xFF2A2A2A),
                  margin: EdgeInsets.only(bottom: spacing * 0.5),
                  child: Padding(
                    padding: EdgeInsets.all(spacing * 0.5),
                    child: Row(
                      children: [
                        Container(
                          width: isSmallScreen ? 60 : 80,
                          height: isSmallScreen ? 60 : 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              image: NetworkImage(option['image']),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: spacing * 0.5),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                option['name'],
                                style: TextStyle(
                                  fontSize: 18 * fontScale,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Daily income',
                                          style: TextStyle(color: Colors.white70, fontSize: 14 * fontScale)),
                                      Text('\T\s\h${option['dailyIncome']}',
                                          style: TextStyle(color: Colors.white, fontSize: 14 * fontScale)),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text('Total income',
                                          style: TextStyle(color: Colors.white70, fontSize: 14 * fontScale)),
                                      Text('\T\s\h${option['totalIncome']}',
                                          style: TextStyle(color: Colors.white, fontSize: 14 * fontScale)),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text('Price: \T\s\h${option['price']}',
                                  style: TextStyle(color: Colors.white70, fontSize: 14 * fontScale)),
                            ],
                          ),
                        ),
                        SizedBox(width: spacing * 0.5),
                        _buildPlatformButton(
                          context: context,
                          label: 'Invest',
                          color: Colors.blue,
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Invested in ${option['name']} (Mock)')),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMetricCard({
    required String title,
    required String value,
    required IconData icon,
    required double width,
    required double fontScale,
  }) {
    return Card(
      color: const Color(0xFF3A3A3A),
      child: Container(
        width: width,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Icon(icon, color: Colors.green, size: 30 * fontScale),
            const SizedBox(height: 8),
            Text(title, style: TextStyle(color: Colors.white70, fontSize: 14 * fontScale)),
            const SizedBox(height: 4),
            Text(value, style: TextStyle(fontSize: 18 * fontScale, color: Colors.white, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _buildPlatformButton({
    required BuildContext context,
    required String label,
    required Color color,
    required VoidCallback onPressed,
  }) {
    if (kIsWeb) {
      return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(label),
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
        ),
      );
    } else {
      return ElevatedButton(
        onPressed: onPressed,
        child: Text(label),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
      );
    }
  }

  Widget _buildPlatformActionButton({
    required BuildContext context,
    required String label,
    required IconData icon,
    required Color color,
    required VoidCallback onPressed,
  }) {
    if (kIsWeb) {
      return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: ElevatedButton.icon(
          onPressed: onPressed,
          icon: Icon(icon, size: 20),
          label: Text(label),
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            elevation: 5,
          ),
        ),
      );
    } else {
      return ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, size: 20),
        label: Text(label),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 5,
        ),
      );
    }
  }
}