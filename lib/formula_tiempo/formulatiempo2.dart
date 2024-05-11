// ignore_for_file: non_constant_identifier_names

double tasaInteresCompuestoCapitalizable(
  double tasaInteres,
  String btnSelected,
  String btnSelected2,
) {
  double resultTasaInteres = 0;
  switch (btnSelected) {
    case "ANUAL":
      switch (btnSelected2) {
        case "MENSUAL":
          resultTasaInteres = tasaInteres / 12;
          break;
        case "BIMESTRAL":
          resultTasaInteres =  tasaInteres / 6;
          break;
        case "TRIMESTRAL":
         resultTasaInteres =  tasaInteres / 4;
          break;
        case "SEMESTRAL":
          resultTasaInteres =  tasaInteres / 2;
          break;
      }
    case "MENSUAL":
      switch (btnSelected2) {
        case "ANUAL":
          resultTasaInteres = tasaInteres * 12;
          break;
        case "BIMESTRAL":
          resultTasaInteres = tasaInteres * 2;
          break;
        case "TRIMESTRAL":
          resultTasaInteres = tasaInteres * 4;
          break;
        case "SEMESTRAL":
          resultTasaInteres = tasaInteres * 6;
          break;
      }
    case "BIMESTRAL":
      switch (btnSelected2) {
        case "ANUAL":
          resultTasaInteres = tasaInteres * 6;
          break;
        case "TRIMESTRAL":
          resultTasaInteres =  tasaInteres * (3 / 2);
          break;
        case "MENSUAL":
          resultTasaInteres = tasaInteres / 2;
          break;
        case "SEMESTRAL":
          resultTasaInteres = tasaInteres * 3;
          break;
      }
    case "TRIMESTRAL":
      switch (btnSelected2) {
        case "ANUAL":
          resultTasaInteres = tasaInteres * 4;
          break;
        case "BIMESTRAL":
          resultTasaInteres = tasaInteres * (2 / 3);
          break;
        case "MENSUAL":
          resultTasaInteres = tasaInteres / 3;
          break;
        case "SEMESTRAL":
          resultTasaInteres = tasaInteres * 2;
          break;
      }
    case "SEMESTRAL":
      switch (btnSelected2) {
        case "ANUAL":
          resultTasaInteres = tasaInteres * 2;
          break;
        case "TRIMESTRE":
          resultTasaInteres = tasaInteres / 2;
          break;
        case "MENSUAL":
          resultTasaInteres = tasaInteres / 6;
          break;
        case "BIMESTRAL":
          resultTasaInteres = tasaInteres / 3;
          break;
      }
      break;
  }

  return resultTasaInteres;
}
