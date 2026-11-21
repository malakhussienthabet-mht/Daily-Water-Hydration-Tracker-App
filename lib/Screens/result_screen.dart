import 'package:flutter/material.dart';
import '../Widgets/bottom_button.dart';

class ResultScreen extends StatelessWidget {
  final double litres;
  final int weight;
  final int age;
  final double activityHours;
  final bool isMale;

  const ResultScreen({
    super.key,
    required this.litres,
    required this.weight,
    required this.age,
    required this.activityHours,
    this.isMale = true,
  });

  String getGuidanceText() {
    if (litres < 2.0) {
      return "Relatively low estimate within this educational formula. Spread your drinking over the day.";
    } else if (litres <= 3.0) {
      return "Spread your drinking over the day. Needs vary.";
    } else {
      return "Relatively high estimate due to weight or activity hours. Needs vary; consult a specialist if needed.";
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E21),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A0E21),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Your Daily Water Intake",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // 1. Result Card
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 28.0, horizontal: 20.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1D1F33),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: const Color(0xFF00E5FF),
                          width: 2.0,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.water_drop_rounded,
                            size: 65,
                            color: Color(0xFF00E5FF),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            "${litres.toStringAsFixed(2)} L / Day",
                            style: const TextStyle(
                              fontSize: 38,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF00E5FF),
                              letterSpacing: 0.5,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "Estimated value\n(educational formula)",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0xFFB0BEC5),
                              height: 1.3,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 14),

                    // 2. Disclaimer Card
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 18.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1D1F33),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Column(
                        children: [
                          Text(
                            "Educational estimate only — not medical advice",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFB0BEC5),
                            ),
                          ),

                        ],
                      ),
                    ),

                    const SizedBox(height: 14),

                    // 3. Guidance Card
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 18.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1D1F33),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Text(
                            getGuidanceText(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              height: 1.3,
                            ),
                          ),

                        ],
                      ),
                    ),

                    const SizedBox(height: 14),

                    // 4. Input Summary Card
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1D1F33),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(bottom: 10.0),
                            child: Text(
                              "Input Summary",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF00E5FF),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Left column
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildSummaryRow(
                                    icon: Icons.fitness_center,
                                    label: "Weight: ",
                                    value: "$weight kg",
                                  ),
                                  const SizedBox(height: 8),
                                  _buildSummaryRow(
                                    icon: Icons.calendar_today_rounded,
                                    label: "Age: ",
                                    value: "$age years",
                                  ),
                                ],
                              ),
                              // Right column
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildSummaryRow(
                                    icon: Icons.timer_outlined,
                                    label: "Activity: ",
                                    value: "${activityHours.toStringAsFixed(0)} h",
                                  ),
                                  const SizedBox(height: 8),
                                  _buildSummaryRow(
                                    icon: isMale ? Icons.male : Icons.female,
                                    label: "Gender: ",
                                    value: isMale ? "Male" : "Female",
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // 5. Re-calculate Button at the bottom
            BottomButton(
              text: "Re-calculate",
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 18, color: const Color(0xFF00E5FF)),
        const SizedBox(width: 6),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFFB0BEC5),
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
