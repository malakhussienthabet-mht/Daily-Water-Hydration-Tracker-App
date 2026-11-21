import 'package:flutter/material.dart';
import '../Widgets/GenderCard.dart';
import '../Widgets/NumberCard.dart';
import '../Widgets/bottom_button.dart';
import '../calculate_function/water_calculator.dart';
import 'result_screen.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreen();
}

class _InputScreen extends State<InputScreen> {
  bool isMale = true;
  double hours = 2.0;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Water Tracker",
          style: TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: const Icon(
          Icons.water_drop_rounded,
          color: Color(0xFF00E5FF),
          size: 35,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // 1. Gender Selection Cards
            Expanded(
              child: Row(
                children: [
                  GenderCard(
                    title: "MALE",
                    icon: Icons.male,
                    isSelected: isMale,
                    onTap: () {
                      setState(() {
                        isMale = true;
                      });
                    },
                  ),
                  GenderCard(
                    title: "FEMALE",
                    icon: Icons.female,
                    isSelected: !isMale,
                    onTap: () {
                      setState(() {
                        isMale = false;
                      });
                    },
                  ),
                ],
              ),
            ),

            // 2. Activity Level Slider Card
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                decoration: boxStyle(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "ACTIVITY (hours/day)",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            color: Color(0xffB0BEC5),
                          ),
                        ),
                        Text(
                          "${hours.toStringAsFixed(0)} h",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                            color: Color(0xFF00E5FF),
                          ),
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: const Color(0xFF00E5FF),
                        inactiveTrackColor: const Color(0xFF111328),
                        thumbColor: const Color(0xFF00E5FF),
                        overlayColor: const Color(0x2900E5FF),
                        trackHeight: 4,
                      ),
                      child: Slider(
                        value: hours,
                        min: 0,
                        max: 8,
                        onChanged: (value) => setState(() => hours = value),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // 3. Weight and Age Cards
            Expanded(
              child: Row(
                children: [
                  NumberCard(
                    title: 'WEIGHT (kg)',
                    value: weight,
                    icon1: Icons.remove,
                    icon2: Icons.add,
                    onAdd: () {
                      if (weight < 200) {
                        setState(() => weight++);
                      }
                    },
                    onSub: () {
                      if (weight > 30) {
                        setState(() => weight--);
                      }
                    },
                  ),
                  NumberCard(
                    title: 'AGE (years)',
                    value: age,
                    icon1: Icons.remove,
                    icon2: Icons.add,
                    onAdd: () {
                      if (age < 100) {
                        setState(() => age++);
                      }
                    },
                    onSub: () {
                      if (age > 10) {
                        setState(() => age--);
                      }
                    },
                  ),
                ],
              ),
            ),

            // 4. Calculate Button
            BottomButton(
              text: "Calculate Water Intake",
              onTap: () {
                double result = WaterCalculator.calculateWater(
                  weight: weight,
                  hours: hours,
                );

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultScreen(
                      litres: result,
                      weight: weight,
                      age: age,
                      activityHours: hours,
                      isMale: isMale,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration boxStyle() {
    return BoxDecoration(
      color: const Color(0xFF1D1F33),
      borderRadius: BorderRadius.circular(15),
    );
  }
}
