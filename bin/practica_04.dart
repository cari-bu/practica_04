import 'dart:io';

class Pelicula {
  String titulo;
  String director;
  int duracion;

    Pelicula(this.titulo, this.director, this.duracion);
  
void mostrarInformacion(){
  print('Título: $titulo');
  print('Director: $director');
  print('Duración: $duracion minutos');
}

void main(){
  Pelicula pelicula1 = Pelicula('Inception', 'Christopher Nolan', 148);
  pelicula1.mostrarInformacion();
}

}
class Producto {
  String nombre;
  double precio;

  Producto(this.nombre, this.precio);

double calcularTotal(int cantidad) {
    if(precio >= 100){
      return precio * cantidad - 0.10; // Aplica un descuento del 10% si el precio es mayor o igual a 100
    }
    return precio * cantidad;
  }
void mostarinformacion(){
  double descuento = 0.0 ;

  if (precio >=100){
    descuento = precio * 0.10;
  } 
}
void main() {
  Producto producto1 = Producto('Laptop', 1200.0);
  int cantidad = 2;
  double total = producto1.calcularTotal(cantidad);
  print('Producto: ${producto1.nombre}');
  print('Precio unitario: \$${producto1.precio}');
  print('Cantidad: $cantidad');
  print('Total a pagar: \$${total.toStringAsFixed(2)}');
}


class Clima {
  double _temperatura;

  Clima(this._temperatura);

  double get temperatura => _temperatura;
  set temperatura(double nuevaTemperatura) {
    if (nuevaTemperatura >= -20 && nuevaTemperatura <= 50) {
      _temperatura = nuevaTemperatura;
    } else {
      print('Temperatura no válida.');
    }
  }
void mostrarEstado() {
    if (_temperatura < 10) {
      print('Hace frío.');
    } else if (_temperatura <= 24) {
      print('Temperatura agradable.');
    } else {
      print('Hace calor.');
    }
  }

void main() {
    Clima clima = Clima(18);
    print('Temperatura: ${clima.temperatura} °C');
    clima.mostrarEstado();

  clima.temperatura = 28;
  print('Temperatura: ${clima.temperatura} °C');
  clima.mostrarEstado();
  clima.temperatura = 60;
  print('Temperatura actual: ${clima.temperatura} °C');
  clima.mostrarEstado();
}
}
class Curso {
  String nombreCurso;
  String nombreDocente;
  List<double> calificaciones = "";

  Curso(this.nombreCurso, this.nombreDocente);

  // Agregar una calificación
  void agregarCalificacion(double nota) {
    calificaciones.add(nota);
  }
  double calcularPromedio() {
    double suma = 0;

    for (double nota in calificaciones) {
      suma += nota;
    }

    return suma / calificaciones.length;
  }
  String determinarEstado() {
    double promedio = calcularPromedio();

    if (promedio <= 12.99) {
      return 'Desaprobado';
    } else if (promedio <= 15.99) {
      return 'Aprobado';
    } else if (promedio <= 18.99) {
      return 'Aprobado - Buen rendimiento';
    } else {
      return 'Aprobado - Excelente';
    }
  }
  double obtenerNotaMasAlta() {
    double mayor = calificaciones[0];

    for (double nota in calificaciones) {
      if (nota > mayor) {
        mayor = nota;
      }
    }

    return mayor;
  }

  void mostrarInformacion() {
    print('Curso: $nombreCurso');
    print('Docente: $nombreDocente');
    print('Calificaciones: $calificaciones');
    print('Promedio: ${calcularPromedio().toStringAsFixed(2)}');
    print('Nota más alta: ${obtenerNotaMasAlta()}');
    print('Estado final: ${determinarEstado()}');
  }
}
void main() {
  stdout.write('Ingrese el nombre del curso: ');
  String nombreCurso = stdin.readLineSync()!;

  stdout.write('Ingrese el nombre del docente: ');
  String nombreDocente = stdin.readLineSync()!;

  Curso curso = Curso(nombreCurso, nombreDocente);
  for (int i = 1; i <= 5; i++) {
    while (true) {
      stdout.write('Ingrese la calificación $i (0-20): ');
      double? nota = double.tryParse(stdin.readLineSync() ?? '');

      if (nota != null && nota >= 0 && nota <= 20) {
        curso.agregarCalificacion(nota);
        break;
      } else {
        print('Calificación no válida. Ingrese una nota entre 0 y 20.');
      }
    }
  }
  curso.mostrarInformacion();
}
}