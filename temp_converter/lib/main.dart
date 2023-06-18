import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

enum Types { celsius, fahrenheit, kelvin }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ThermoScale',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.grey[900],
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.deepPurple,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple,
          ),
        ),
      ),
      home: const MyHomePage(title: 'ThermoScale'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Types selectedTemp = Types.celsius;
  final celsiusController = TextEditingController();
  final fahrenheitController = TextEditingController();
  final convertedCelsiusController = TextEditingController();
  final convertedKelvinController = TextEditingController();

  @override
  void dispose() {
    celsiusController.dispose();
    fahrenheitController.dispose();
    convertedCelsiusController.dispose();
    convertedKelvinController.dispose();
    super.dispose();
  }

  double convertToCelsius(double value, Types inputType) {
    switch (inputType) {
      case Types.celsius:
        return value;
      case Types.fahrenheit:
        return (value - 32) * 5 / 9;
      case Types.kelvin:
        return value - 273.15;
    }
  }

  double convertFromCelsius(double value, Types outputType) {
    switch (outputType) {
      case Types.celsius:
        return value;
      case Types.fahrenheit:
        return (value * 9 / 5) + 32;
      case Types.kelvin:
        return value + 273.15;
    }
  }

  void convertTemperature() {
    final inputValue = double.tryParse(celsiusController.text);
    if (inputValue != null) {
      final convertedCelsiusValue = convertToCelsius(inputValue, selectedTemp);
      final convertedFahrenheitValue =
          convertFromCelsius(convertedCelsiusValue, Types.fahrenheit);
      final convertedKelvinValue =
          convertFromCelsius(convertedCelsiusValue, Types.kelvin);
      convertedCelsiusController.text =
          convertedCelsiusValue.toStringAsFixed(2);
      fahrenheitController.text = convertedFahrenheitValue.toStringAsFixed(2);
      convertedKelvinController.text = convertedKelvinValue.toStringAsFixed(2);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 40,
                  child: SizedBox(
                    width: 200,
                    child: TextField(
                      controller: celsiusController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'ENTER TEMPERATURE',
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                SizedBox(
                  height: 56,
                  child: DropdownButton(
                    value: selectedTemp,
                    items: Types.values
                        .map(
                          (category) => DropdownMenuItem(
                            value: category,
                            child: Container(
                              height:
                                  56, // Set the height to match the TextButton
                              alignment: Alignment.center,
                              child: Text(
                                category
                                    .toString()
                                    .split('.')
                                    .last
                                    .toUpperCase(),
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      if (value == null) {
                        return;
                      }
                      setState(() {
                        selectedTemp = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
                TextField(
                  controller: convertedCelsiusController,
                  enabled: false,
                  decoration: const InputDecoration(
                    labelText: 'CELSIUS',
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: convertedKelvinController,
                  enabled: false,
                  decoration: const InputDecoration(
                    labelText: 'KELVIN',
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: fahrenheitController,
                  enabled: false,
                  decoration: const InputDecoration(
                    labelText: 'FAHRENHEIT',
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: convertTemperature,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple, // Set button color
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: const Text('CONVERT'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
