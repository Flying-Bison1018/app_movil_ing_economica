// ignore_for_file: non_constant_identifier_names

double formulaTiempo(double M4, double M5, double M6, double M7, double M8,
    double M9, String btnSelected) {
  double tiempo = 0;

  final Map<String, dynamic> years = {
    "B4": 1.00,
    "C4": 1 / 12,
    "D4": 1 / 360,
    "E4": 1 / 6,
    "F4": 1 / 4,
    "G4": 1 / 2
  };

  final Map<String, dynamic> months = {
    "B5": 12.00,
    "C5": 1.00,
    "D5": 1 / 30,
    "E5": 2.00,
    "F5": 3.00,
    "G5": 6.00
  };

  final Map<String, dynamic> semester = {
    "B6": 2,
    "C6": 1 / 6,
    "D6": 1 / 180,
    "E6": 1 / 3,
    "F6": 1 / 2,
    "G6": 1
  };

  final Map<String, dynamic> quater = {
    "B7": 4.00,
    "C7": 1 / 3,
    "D7": 1 / 80,
    "E7": 2 / 3,
    "F7": 1,
    "G7": 2
  };

  final Map<String, dynamic> bimester = {
    "B8": 6,
    "C8": 1 / 2,
    "D8": 1 / 60,
    "E8": 1,
    "F8": 3 / 2,
    "G8": 3.00
  };

  if (btnSelected == "ANUAL") {
    tiempo = ((years["B4"] * M4) +
        (years["C4"] * M5) +
        (years["D4"] * M6) +
        (years["E4"] * M7) +
        (years["F4"] * M8) +
        (years["G4"] * M9));
  }

  if (btnSelected == "MENSUAL") {
    tiempo = ((months["B5"] * M4) +
        (months["C5"] * M5) +
        (months["D5"] * M6) +
        (months["E5"] * M7) +
        (months["F5"] * M8) +
        (months["G5"] * M9));
  }

  if (btnSelected == "SEMESTRAL") {
    tiempo = ((semester["B6"] * M4) +
        (semester["C6"] * M5) +
        (semester["D6"] * M6) +
        (semester["E6"] * M7) +
        (semester["F6"] * M8) +
        (semester["G6"] * M9));
  }

  if (btnSelected == "TRIMESTRAL") {
    tiempo = ((quater["B7"] * M4) +
        (quater["C7"] * M5) +
        (quater["D7"] * M6) +
        (quater["E7"] * M7) +
        (quater["F7"] * M8) +
        (quater["G7"] * M9));
  }

  if (btnSelected == "BIMESTRAL") {
    tiempo = ((bimester["B8"] * M4) +
        (bimester["C8"] * M5) +
        (bimester["D8"] * M6) +
        (bimester["E8"] * M7) +
        (bimester["F8"] * M8) +
        (bimester["G8"] * M9));
  }

  return tiempo;
}

double formulaTiempo2(double M4, double M5, double M6, double M7, double M8,
    double M9, String btnSelected2) {
  double tiempo = 0;

  final Map<String, dynamic> years = {
    "B4": 1.00,
    "C4": 1 / 12,
    "D4": 1 / 360,
    "E4": 1 / 6,
    "F4": 1 / 4,
    "G4": 1 / 2
  };

  final Map<String, dynamic> months = {
    "B5": 12.00,
    "C5": 1.00,
    "D5": 1 / 30,
    "E5": 2.00,
    "F5": 3.00,
    "G5": 6.00
  };

  final Map<String, dynamic> semester = {
    "B6": 2,
    "C6": 1 / 6,
    "D6": 1 / 180,
    "E6": 1 / 3,
    "F6": 1 / 2,
    "G6": 1
  };

  final Map<String, dynamic> quater = {
    "B7": 4.00,
    "C7": 1 / 3,
    "D7": 1 / 80,
    "E7": 2 / 3,
    "F7": 1,
    "G7": 2
  };

  final Map<String, dynamic> bimester = {
    "B8": 6,
    "C8": 1 / 2,
    "D8": 1 / 60,
    "E8": 1,
    "F8": 3 / 2,
    "G8": 3.00
  };

  if (btnSelected2 == "ANUAL") {
    tiempo = ((years["B4"] * M4) +
        (years["C4"] * M5) +
        (years["D4"] * M6) +
        (years["E4"] * M7) +
        (years["F4"] * M8) +
        (years["G4"] * M9));
  }

  if (btnSelected2 == "MENSUAL") {
    tiempo = ((months["B5"] * M4) +
        (months["C5"] * M5) +
        (months["D5"] * M6) +
        (months["E5"] * M7) +
        (months["F5"] * M8) +
        (months["G5"] * M9));
  }

  if (btnSelected2 == "SEMESTRAL") {
    tiempo = ((semester["B6"] * M4) +
        (semester["C6"] * M5) +
        (semester["D6"] * M6) +
        (semester["E6"] * M7) +
        (semester["F6"] * M8) +
        (semester["G6"] * M9));
  }

  if (btnSelected2 == "TRIMESTRAL") {
    tiempo = ((quater["B7"] * M4) +
        (quater["C7"] * M5) +
        (quater["D7"] * M6) +
        (quater["E7"] * M7) +
        (quater["F7"] * M8) +
        (quater["G7"] * M9));
  }

  if (btnSelected2 == "BIMESTRAL") {
    tiempo = ((bimester["B8"] * M4) +
        (bimester["C8"] * M5) +
        (bimester["D8"] * M6) +
        (bimester["E8"] * M7) +
        (bimester["F8"] * M8) +
        (bimester["G8"] * M9));
  }

  return tiempo;
}
