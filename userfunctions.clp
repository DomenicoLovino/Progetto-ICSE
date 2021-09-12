   /*******************************************************/
   /*      "C" Language Integrated Production System      */
   /*                                                     */
   /*               CLIPS Version 6.30  08/16/14          */
   /*                                                     */
   /*                USER FUNCTIONS MODULE                */
   /*******************************************************/

/*************************************************************/
/* Purpose:                                                  */
/*                                                           */
/* Principal Programmer(s):                                  */
/*      Gary D. Riley                                        */
/*                                                           */
/* Contributing Programmer(s):                               */
/*                                                           */
/* Revision History:                                         */
/*                                                           */
/*      6.24: Created file to seperate UserFunctions and     */
/*            EnvUserFunctions from main.c.                  */
/*                                                           */
/*      6.30: Removed conditional code for unsupported       */
/*            compilers/operating systems (IBM_MCW,          */
/*            MAC_MCW, and IBM_TBC).                         */
/*                                                           */
/*************************************************************/

/***************************************************************************/
/*                                                                         */
/* Permission is hereby granted, free of charge, to any person obtaining   */
/* a copy of this software and associated documentation files (the         */
/* "Software"), to deal in the Software without restriction, including     */
/* without limitation the rights to use, copy, modify, merge, publish,     */
/* distribute, and/or sell copies of the Software, and to permit persons   */
/* to whom the Software is furnished to do so.                             */
/*                                                                         */
/* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS */
/* OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF              */
/* MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT   */
/* OF THIRD PARTY RIGHTS. IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY  */
/* CLAIM, OR ANY SPECIAL INDIRECT OR CONSEQUENTIAL DAMAGES, OR ANY DAMAGES */
/* WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN   */
/* ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF */
/* OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.          */
/*                                                                         */
/***************************************************************************/

/*************************************************
FILE MODIFICATO PER INSERIRE IN CLIPS FUNZIONI IN C 
UTILI AL SISTEMA
************************************************/

#include "clips.h"
#include <stdio.h>
#include <time.h>
#include <string.h>
#include <math.h>

void UserFunctions(void);
void EnvUserFunctions(void *);
void *environment;
const char *functionName, *actualFunctionName;
char functionType;
int (*functionPointer)(void *);
int EnvDefineFunction(environment, functionName, functionType, functionPointer, actualFunctionName);

/*********************************************************/
/* UserFunctions: Informs the expert system environment  */
/*   of any user defined functions. In the default case, */
/*   there are no user defined functions. To define      */
/*   functions, either this function must be replaced by */
/*   a function with the same name within this file, or  */
/*   this function can be deleted from this file and     */
/*   included in another file.                           */
/*********************************************************/
void UserFunctions()
  {
   // Use of UserFunctions is deprecated.
   // Use EnvUserFunctions instead.
	 
  }
  
/***********************************************************/
/* EnvUserFunctions: Informs the expert system environment */
/*   of any user defined functions. In the default case,   */
/*   there are no user defined functions. To define        */
/*   functions, either this function must be replaced by   */
/*   a function with the same name within this file, or    */
/*   this function can be deleted from this file and       */
/*   included in another file.                             */
/***********************************************************/
void EnvUserFunctions(
  void *environment)
  {
	extern int getMonth(void *);
	EnvDefineFunction(environment, "getMonth", 'i', PTIEF getMonth, "getMonth");
	
	extern int getDay(void *);
	EnvDefineFunction(environment, "getDay", 'i', PTIEF getDay, "getDay");
	  
	extern long long getYear(void *);
	EnvDefineFunction(environment, "getYear", 'g', PTIEF getYear, "getYear");
	
	extern int getDayOfWeek(void *);
	EnvDefineFunction(environment, "getDayOfWeek", 'i', PTIEF getDayOfWeek, "getDayOfWeek");
	
    extern int open_link (void *);
	EnvDefineFunction(environment, "open_link", 'i', PTIEF open_link, "open_link");
	

  }
//FUNZIONE PER LEGGERE IL MESE CORENTE DA OS
int getMonth(
	 void *environment)
 {
    time_t t = time(NULL);
    struct tm *tm = localtime(&t);
    int month=tm->tm_mon;   
    return month+1;
 }
 
 //FUNZIONE PER LEGGERE LA DATA CORENTE DA OS
int getDay(
	 void *environment)
 {
    time_t t = time(NULL);
    struct tm *tm = localtime(&t);
    int day=tm->tm_mday;
    return day;
 }
 //FUNZIONE PER LEGGERE L'ANNO CORENTE DA OS
long long getYear(
	 void *environment)
 {
    time_t t = time(NULL);
    struct tm *tm = localtime(&t);
    int year=tm->tm_year;
    return year+1900;
 }
 //FUNZIONE PER LEGGERE IL GIORNO DELLA SETTIMANA CORENTE DA OS
 int getDayOfWeek(
	 void *environment)
 {
    time_t t = time(NULL);
    struct tm *tm = localtime(&t);
    int d=tm->tm_wday;
    return d;
 }
 
 //FUNZIONE PER APRIRE UNA PAGINA (WEB) DA SISTEMA

 int open_link(void *environment){
	const char* link =NULL;
	link=EnvRtnLexeme(environment,0);
	char* explorer = NULL;
	const char firstString[] = "explorer ";
	explorer = &firstString;
	char newString[250]="";
	strcat(newString, explorer);
	strcat(newString, link);	
	system(newString);
	link=NULL;
	explorer=NULL;
	return 0;
	
}