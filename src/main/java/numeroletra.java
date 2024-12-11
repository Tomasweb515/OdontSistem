
public class numeroletra {
    private static final String[] unidades = {
        "", "uno", "dos", "tres", "cuatro", "cinco", "seis", "siete", "ocho", "nueve", "diez",
        "once", "doce", "trece", "catorce", "quince", "dieciséis", "diecisiete", "dieciocho", "diecinueve"
    };
    private static final String[] decenas = {
        "", "", "veinte", "treinta", "cuarenta", "cincuenta", "sesenta", "setenta", "ochenta", "noventa"
    };
    private static final String[] centenas = {
        "", "cien", "doscientos", "trescientos", "cuatrocientos", "quinientos", "seiscientos", "setecientos", "ochocientos", "novecientos"
    };
    public static String convertir(int numero) {
        if (numero == 0) {
            return "cero";
        }
        if (numero < 0) {
            return "menos " + convertir(-numero);
        }
        String resultado = "";
        if (numero >= 100) {
            resultado += centenas[numero / 100] + " ";
            numero %= 100;
        }
        if (numero >= 20) {
            resultado += decenas[numero / 10] + " ";
            numero %= 10;
        }
        if (numero > 0) {
            resultado += unidades[numero] + " ";
        }
        return resultado.trim();
    }
}


