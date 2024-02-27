#include <pic14/pic12f683.h>
typedef unsigned int word;
word __at 0x2007 __CONFIG = (_WDTE_OFF & _WDT_OFF & _MCLRE_OFF);  // WDT y MCLR OFF

unsigned int counter = 0; // Contador

void delay(unsigned int tiempo) {
	unsigned int m;
	unsigned int n;

    for(m=0;m<tiempo;m++)
        for(n=0;n<1275;n++);
}

// Funcion que toma el numero aleatorio y guarda su valor de unidades
int num_unidades(int num) {
    int unidades = num % 10;
    return unidades;
}

// Funcion que toma el numero aleatorio y guarda su valor de decenas
int num_decenas(int num) {
    int decenas = num / 10;
    return decenas;
}

// Funcion para crear numeros pseudo aleatorios entre 0 y 99
unsigned int generateRandomNumber() {
    counter += 0xDEADBEEF;
    unsigned int random = (counter % 100); // Limitacion del rango entre 0 y 99
    return random;
}

// Encargado de limpiar lo que hay en los pines para no cargar valores anteriores
void limpiar() {
	// Limpiar registros
	GP0 = 0x00;
	GP1 = 0x00;
	GP2 = 0x00;
	GP4 = 0x00;
}

// Encargado de cargar 9 en los displays, parpadear 3 veces y resetear el bingo
int final(int inicio) {
    int q;
    for (q = 0; q < 3; ++q) {
			limpiar();
		    // Mostrar 9 en unidades
			GP5 = 0x00; // Se prende en bajo
			GP0 = 1;
			GP1 = 0;
			GP2 = 0;
			GP4 = 1;
			delay(100);
			
			// Mostrar 9 en decenas
			GP5 = ~GP5; // Encender decenas
			delay(100);
			
			limpiar();
			// Mostrar 0 en unidades
			GP5 = ~GP5; // Encender decenas
			delay(100);
			
			// Mostrar 0 en decenas
			GP5 = ~GP5; // Encender decenas
			delay(100);
    }
	inicio = 0; // Volver a iniciar
	q = 0;
	return inicio;
}

void main(void)
{
	// Configuracion del MCU
    TRISIO = 0b00001000; //Poner todos los pines como salidas
	GPIO = 0x00; //Poner pines en bajo
    ANSEL = 0b00001000; // Set GP3 as digital input

	// Variable para saber si ha iniciado el bingo
    int inicio = 0;
	// Determina si hay que seguir con el siguiente numero
	int sig_num = 0;
	// Inicializacion de variables que guardan los bits de unidades y decenas
	int b0u, b1u, b2u, b3u, b0d, b1d, b2d, b3d = 0;

	int j = 0; // Contador
    unsigned int arreglo[10]; // Arreglo para guardar numeros aleatorios
	delay(5); // Delay para evitar cargar valores erroneos
	
    // Para el circuito implementado se tiene que:
    // b0 = GP0, b1 = GP1, b2 = GP2, b3 = GP4, GP3 es el boton.

	// Loop forever
	while ( 1 ) {
		if (inicio == 0 && GP3 == 1) {
			// Juego no ha iniciado, se mantienen apagados los displays
			GP0 = 0x00;
			GP1 = 0x00;
			GP2 = 0x00;
			GP4 = 0x00;
			GP5 = 0x01; // Encender unidades
			delay(100);
			GP5 = ~GP5; // Encender decenas
			delay(100);
			j = 0;
		}
		else {
		    if (j == 0) {
		        inicio = 1; // El juego ha iniciado
		    }
		    
			if (GP3 != 0) {
			    // El boton no se ha apretado 
			    sig_num = 0; // No se requiere el siguiente numero
		    }
		    else {
		        // El boton se ha apretado 
		        sig_num = 1; // Se requiere el siguiente numero
		    }
			
			if (sig_num == 1) {
			    while (j < 10) {
                    for (int i = 0; i < 10; ++i) {
                        arreglo[i] = -1; // Inicializar el arreglo con -1 (porque este numero no puede salir)
                    }
                    
                    int indice = 0;
                    while (indice < 1) {
                        unsigned int num_generado = generateRandomNumber();
                        int duplicado = 0;
                        
                        // Para que no salgan numeros repetidos
                        for (int i = 0; i < 10; ++i) {
                            if (arreglo[i] == num_generado) {
                                duplicado = 1;
                                break;
                            }
                        }
                        if (!duplicado) {
                            arreglo[indice] = num_generado;
                            indice++; // En este caso el numero no es duplicado, entonces se agrega
                        }
                    }
                    int unidad = num_unidades(arreglo[0]);
                    int decena = num_decenas(arreglo[0]);
                    
                    // Separar los valores de las decenas en binario aplicando una mascara
                    b3d = (decena >> 3) & 1; // Bit 3 (MSB)
                    b2d = (decena >> 2) & 1; // Bit 2
                    b1d = (decena >> 1) & 1; // Bit 1
                    b0d = decena & 1; // Bit 0 (LSB)
                    
                    // Separar los valores de las unidades en binario aplicando una mascara
                    b3u = (unidad >> 3) & 1; // Bit 3 (MSB)
                    b2u = (unidad >> 2) & 1; // Bit 2
                    b1u = (unidad >> 1) & 1; // Bit 1
                    b0u = unidad & 1; // Bit 0 (LSB)
                    break;
                }
			}
			if (sig_num == 1) {
				j++;
			}
			// Mostrar unidades
			GP5 = 1;
			GP0 = b0u;
			GP1 = b1u;
			GP2 = b2u;
			GP4 = b3u;
			delay(100);
			
			// Limpiar registros
			limpiar();
			
			// Mostrar decenas
			GP5 = ~GP5; // Encender decenas
			GP0 = b0d;
			GP1 = b1d;
			GP2 = b2d;
			GP4 = b3d;
			delay(100);
			
			// Limpiar registros
			limpiar();
			
		    if (j >= 10) {
                inicio = final(inicio);
				limpiar();
            }
		}
	}
}