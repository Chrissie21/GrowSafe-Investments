import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class TeamPage extends StatelessWidget {
  final List<Map<String, dynamic>> teamLevels = [
    {
      'level': 'My LV1 members',
      'investment': 0.0,
      'rebate': 0.0,
      'people': 0,
      'rebatePercentage': 2.0,
    },
    {
      'level': 'My LV2 members',
      'investment': 0.0,
      'rebate': 0.0,
      'people': 0,
      'rebatePercentage': 2.0,
    },
    {
      'level': 'My LV3 members',
      'investment': 0.0,
      'rebate': 0.0,
      'people': 0,
      'rebatePercentage': 1.0,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;

    final fontScale = isSmallScreen ? 1.0 : 1.2;
    final spacing = isSmallScreen ? 20.0 : 30.0;

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(spacing * 0.5),
            color: const Color(0xFF2A2A2A),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'My Team Data',
                  style: TextStyle(
                    fontSize: 20 * fontScale,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                _buildPlatformButton(
                  context: context,
                  label: 'Invite',
                  color: Colors.orange,
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Invite clicked (Mock)')),
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: spacing),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: spacing * 0.5),
            child: Column(
              children: teamLevels.map((level) {
                return Card(
                  color: const Color(0xFF2A2A2A),
                  margin: EdgeInsets.only(bottom: spacing * 0.5),
                  child: Padding(
                    padding: EdgeInsets.all(spacing * 0.5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                level['level'],
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
                                      Text('Investment',
                                          style: TextStyle(color: Colors.white70, fontSize: 14 * fontScale)),
                                      Text('\T\s\h${level['investment']}',
                                          style: TextStyle(color: Colors.white, fontSize: 14 * fontScale)),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Rebate',
                                          style: TextStyle(color: Colors.white70, fontSize: 14 * fontScale)),
                                      Text('\T\s\h${level['rebate']}',
                                          style: TextStyle(color: Colors.white, fontSize: 14 * fontScale)),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('People',
                                          style: TextStyle(color: Colors.white70, fontSize: 14 * fontScale)),
                                      Text('${level['people']}',
                                          style: TextStyle(color: Colors.white, fontSize: 14 * fontScale)),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: spacing * 0.5),
                        CircleAvatar(
                          backgroundColor: Colors.blue,
                          radius: isSmallScreen ? 20 : 25,
                          child: Text(
                            '${level['rebatePercentage']}%',
                            style: TextStyle(color: Colors.white, fontSize: 14 * fontScale),
                          ),
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
}