/*
Esta primer función definada por el usuario mediante C 
recibe un argumento tipo text que contiene un nombre
y retorna un saludo al sujeto que lleve ese nombre.
*/

#include "postgres.h"
#include "fmgr.h"
#include <string.h>

#ifdef PG_MODULE_MAGIC
PG_MODULE_MAGIC;
#endif

Datum hello(PG_FUNCTION_ARGS);

PG_FUNCTION_INFO_V1(hello);

Datum hello(PG_FUNCTION_ARGS)
{
  //Variable declarations
  char greet[] = "Hello, ";
  text *towhom;
  int greetlen;
  int towhomlen;
  text *greeting;

  //Este código no verifica la no nulidad de los valores, por lo que es necesario declarar las funciones como STRICT

  //Obteniendo los argumentos
  
  towhom = PG_GETARG_TEXT_P(0);

  //Calcular el tamaño de la cadena de caracteres
  greetlen = strlen(greet);
  towhomlen = VARSIZE(towhom) - VARHDRSZ;

  //Permitir el acceso a la memoria para el almacenamiento de los datos
  greeting = (text*) palloc(greetlen + towhomlen);
  //  VARSIZE(greeting) = greetlen + towhomlen + VARHDRSZ;

  //Construir la cadena de saludo
  strncpy(VARDATA(greeting), greet, greetlen);
  strncpy(VARDATA(greeting)+greetlen, VARDATA(towhom), towhomlen);

  PG_RETURN_TEXT_P(greeting);
}
