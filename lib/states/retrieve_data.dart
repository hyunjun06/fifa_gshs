import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;

Future<Map<String, dynamic>> retrieveData() async {
  const url =
      'https://docs.google.com/spreadsheets/u/1/d/1OAKREofSq5uB_qTpK2tL8UsZfesgdTX1DHS8AMnbcys/htmlview#';

  // Fetch the HTML page
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    // Parse the HTML document
    final document = parse(response.body);

    final table = document.querySelectorAll('table')[1];

    // Extract the table rows from tbody
    final rows = table.querySelectorAll('tbody tr');

    // Ensure there's at least one row to avoid index errors
    if (rows.isEmpty) {
      print('No rows found in the table.');
      return {};
    }

    // Initialize a list to hold the table data as maps
    final Map<String, dynamic> playerDataMap = {};

    final columnLabels =
        rows.map((row) => row.querySelectorAll('td')[1].text.trim()).toList();

    print("Column Labels --------------------------------------------------");
    print(columnLabels);

    // Iterate over the remaining columns (starting from column 1)
    final numColumns =
        rows[0].querySelectorAll('td').length; // Number of columns in the table
    for (var colIndex = 2; colIndex < numColumns; colIndex++) {
      final playerData = <String, String>{};

      for (var rowIndex = 0; rowIndex < rows.length; rowIndex++) {
        final cells = rows[rowIndex].querySelectorAll('td');

        // Ensure the cell exists before accessing
        if (colIndex < cells.length) {
          // Use the column label as the key and the corresponding column data as the value
          playerData[columnLabels[rowIndex]] = cells[colIndex].text.trim();
        }
      }

      if (playerData["OVR"] == null) {
        continue;
      } else {
        playerData["오버롤"] = playerData["OVR"]!;
      }

      if (playerData["강화(1~10)"] != null) {
        playerData.remove("강화(1~10)");
      }

      // Add the player data to the map
      playerDataMap[playerData["이름"]!] = playerData;
    }

    // Print the result (optional)
    print(
        "Player Data List --------------------------------------------------");
    print(playerDataMap);

    // Return the list of dictionaries
    return playerDataMap;
  } else {
    print('Failed to load the HTML page');
    return {};
  }
}
