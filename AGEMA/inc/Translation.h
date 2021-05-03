/*
 * -----------------------------------------------------------------
 * COMPANY : Ruhr University Bochum
 * AUTHOR  : Amir Moradi (amir.moradi@rub.de)
 * DOCUMENT: https://eprint.iacr.org/2021/569/
 * -----------------------------------------------------------------
 *
 * Copyright (c) 2021, David Knichel, Amir Moradi, Nicolai Müller, Pascal Sasdrich
 *
 * All rights reserved.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTERS BE LIABLE FOR ANY
 * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 * Please see LICENSE and README for license and further instructions.
 */

//#include <cstdio>
#include "stdio.h"
#include "stdlib.h"
#include "string.h"
#include "ctype.h"
#include "math.h"

#define ToolName  "AGEMA"

#define Max_Clock_Fanout 10

#define Max_Name_Length 500000

#define CellType_Gate     0
#define CellType_Reg      1

#define GateType_Normal   1
#define GateType_Mux2     2
#define GateType_Buffer   4
#define GateType_XOR      8
#define GateType_SCA     16

#define SignalType_input     0
#define SignalType_output    1
#define SignalType_wire      2
#define SignalType_constant  3

#define Task_find_module_type			 0
#define Task_find_module_name			 1
#define Task_find_open_bracket			 2
#define Task_find_point					 3
#define Task_find_IO_port				 4
#define Task_find_signal_name			 5
#define Task_find_close_bracket			 6
#define Task_find_comma					 7
#define Task_find_assign_signal_name1	 8
#define Task_find_equal					 9
#define Task_find_assign_signal_name2	10

struct CellTypeStruct {
	char	GateOrReg;
	char	Type;
	char	NumberOfCases;
	char**	Cases;
	int 	NumberOfInputs;
	char**	Inputs;
	int 	NumberOfOutputs;
	char**	Outputs;
	short	NumberOfStages;
	int		SCAType;
	int		SCAType2;   // for example for MUX2, where the select signal is not secure
	char*   CustomName; // for the .nl file to generate BDD
};


struct CellStruct {
	int		Type;
	char*	Name;
	short	Depth;
	int 	NumberOfInputs;
	int*	Inputs;
	int 	NumberOfOutputs;
	int*	Outputs;
	char	ToBeSecured;
	int		OrigType;
	short	NumberOfStages;
	char	Deleted;
};

struct SignalStruct {
	char*	Name;
	char	FreshMask;
	char	Type;
	short	Depth;
	int		Output;
	int		NumberOfInputs;
	int*	Inputs;
	char*   Attribute;
	char	ToBeSecured;
	char	ToBeBalanced;
	int		NextShare;
	char	Printed;
	char	Deleted;
};

struct LibraryStruct {
	CellTypeStruct**	CellTypes = NULL;
	int					NumberOfCellTypes   = 0;
	int					BufferCellType      = -1;
	int					RegBufferCellType   = -1;
	int					ClockGatingCellType = -1;
};

struct CircuitStruct {
	SignalStruct **Signals = NULL;
	int          NumberOfSignals;
	int          *Constants = NULL;
	int          NumberOfConstants = 0;
	int          *Inputs = NULL;
	int          *Outputs = NULL;
	int          NumberOfInputs;
	int          NumberOfOutputs;

	CellStruct   **Cells = NULL;
	int          NumberOfCells;
	int          *Gates = NULL;
	int          *Regs = NULL;
	int          NumberOfGates;
	int          NumberOfRegs;
	int          ClockSignalIndex = -1;
	int          ResetSignalIndex = -1;

	short        MaxDepth = 0;
	int          **CellsInDepth = NULL;
	int          *NumberOfCellsInDepth = NULL;
	int			 *FreshMasks = NULL;
	int			 NumberOfFreshMasks = 0;
};

//***************************************************************************************

int StrReplaceChar(char *Str, char ch_source, char ch_destination)
{
	unsigned int i,j;

	j = 0;
	for (i = 0;i < strlen(Str);i++)
	{
		if (Str[i] == ch_source)
		{
			Str[i] = ch_destination;
			j++;
		}
	}

	return (j);
}

//***************************************************************************************

void StrReplaceStr(char *Str, char *Source, char *Destination)
{
	char *StrTemp = (char *)malloc(Max_Name_Length * sizeof(char));
	char *ptr;
	int   L_Source;
	int   L_Destination;

	L_Source = strlen(Source);
	L_Destination = strlen(Destination);

	ptr = strstr(Str, Source);

	while (ptr)
	{
		strcpy(StrTemp, ptr + L_Source);
		strcpy(ptr, Destination);
		strcpy(ptr + L_Destination, StrTemp);

		ptr = strstr(ptr + L_Destination, Source);
	}

	free(StrTemp);
}

//***************************************************************************************

void StrLowerCase(char *Str)
{
	unsigned int i;

	for (i = 0;i < strlen(Str);i++)
		Str[i] = tolower(Str[i]);
}

//***************************************************************************************

void ReadNonCommentFromFile(FILE* FileHeader, char* Str, const char* CommentSyntax)
{
	int  l;
	char ch;

	l = (int)strlen(CommentSyntax);
	do {
		int res = fscanf(FileHeader, "%s", Str);
		if (!memcmp(CommentSyntax, Str, l))
		{
			do ch = fgetc(FileHeader);
			while ((ch != '\n') && (ch != '\r') && (!feof(FileHeader)));
		}
	} while ((!memcmp(CommentSyntax, Str, l)) && (!feof(FileHeader)));

	if (feof(FileHeader))
		Str[0] = 0;
}

//***************************************************************************************

void fReadaWord(FILE* F, char* Buffer, char* Attribute)
{
	static char Lastch = 0;
	char		ch;
	int			i = 0;
	int			j = 0;

	if (Attribute)
		Attribute[0] = 0;

	while ((!feof(F)) || Lastch)
	{
		if (Lastch)
			ch = Lastch;
		else
			ch = fgetc(F);

		if ((!feof(F)) || Lastch)
		{
			Lastch = 0;
			if ((ch == 32) || (ch == 13) || (ch == 10) || (ch == 9))
			{
				if (i)
					break;
			}
			else if ((ch == '(') || (ch == ')'))
			{
				if (i)
				{
					Lastch = ch;
					break;
				}
				else
				{
					Buffer[i++] = ch;

					if (ch == '(')
					{
						ch = fgetc(F);
						if (ch == '*')
						{
							while (!feof(F))
							{
								ch = fgetc(F);
								if ((Buffer[i] == '*') && (ch == ')'))
									break;
								else
								{
									Buffer[i] = ch;
									if (Attribute)
										Attribute[j++] = ch;
								}
							}

							if (!feof(F))
							{
								i--;
								j--;
							}
						}
						else
						{
							Lastch = ch;
							break;
						}
					}
					else
						break;
				}
			}
			else if ((ch == '/') && i)
			{
				if (Buffer[i - 1] == '/') // start of the comment "//"
				{
					i--;

					while (!feof(F))
					{
						ch = fgetc(F);
						if ((ch == '\n') || (ch == '\r'))
							break;
					}
				}
			}
			else if ((ch == '*') && i)
			{
				if (Buffer[i - 1] == '/') // start of the comment "/*"
				{
					i--;

					while (!feof(F))
					{
						ch = fgetc(F);
						if ((Buffer[i] == '*') && (ch == '/'))
							break;
						else
							Buffer[i] = ch;
					}
				}
				else if (Buffer[i - 1] == '(') // start of the attribute "(*"
				{
					i--;

					while (!feof(F))
					{
						ch = fgetc(F);
						if ((Buffer[i] == '*') && (ch == ')'))
							break;
						else
						{
							Buffer[i] = ch;
							if (Attribute)
								Attribute[j++] = ch;
						}
					}

					if (!feof(F))
						j--;
				}
			}
			else
				Buffer[i++] = ch;
		}
	}

	Buffer[i] = 0;
	if (Attribute)
		Attribute[j] = 0;
	return;
}

//***************************************************************************************

int EvaluateExpression(char* Str, int SecurityOrder, int LowLatency)
{
	char   Value_Str[100];
	double res;

	sprintf(Value_Str, "%d", SecurityOrder);
	StrReplaceStr(Str, (char*)"d", Value_Str);

	sprintf(Value_Str, "%d", LowLatency);
	StrReplaceStr(Str, (char*)"l", Value_Str);

	res = eval(Str);

	return (int(res));
}

//***************************************************************************************

int ReadLibraryFile(char* LibraryFileName, char* LibraryName, char General, LibraryStruct* Library, char SecurityOrder)
{
	FILE	*LibraryFile;
	char	*LocalLibraryName = (char *)malloc(Max_Name_Length * sizeof(char));
	char	*Str1 = (char *)malloc(Max_Name_Length * sizeof(char));
	char	*Str2 = (char *)malloc(Max_Name_Length * sizeof(char));
	int		i, j;
	int		TempIndex;
	int		Number;
	int		Count;
	char	**Buffer_char;
	char	LibraryRead = 0;
	int		LowLatency = 0;
	CellTypeStruct** TempCellTypes;

	strcpy(LocalLibraryName, LibraryName);
	if (!strcmp(LocalLibraryName, "GHPCLL"))
	{
		strcpy(LocalLibraryName, "GHPC");
		LowLatency = 1;
	}

	if (General)
		printf("reading the library file (General) ");
	else
		printf("reading the library file (%s) ", LibraryName);

	LibraryFile = fopen(LibraryFileName, "rt");

	if (LibraryFile == NULL)
	{
		printf("\nlibrary file \"%s\" not found\n", LibraryFileName);
		free(LocalLibraryName);
		free(Str1);
		free(Str2);
		return 1;
	}

	while ((!LibraryRead) && (!feof(LibraryFile)))
	{
		Str1[0] = 0;
		while (strcmp(Str1, "Library") && (!feof(LibraryFile)))
			ReadNonCommentFromFile(LibraryFile, Str1, "%");

		if (!feof(LibraryFile))
		{
			ReadNonCommentFromFile(LibraryFile, Str1, "%");
			if (((General == 0) && (!strcmp(Str1, LocalLibraryName))) ||
				((General == 1) && (!strcmp(Str1, "General"))))
			{
				ReadNonCommentFromFile(LibraryFile, Str1, "%");

				while (strcmp(Str1, "Library") && (!feof(LibraryFile)))
				{
					TempCellTypes= (CellTypeStruct **)malloc((Library->NumberOfCellTypes+1) * sizeof(CellTypeStruct *));
					memcpy(TempCellTypes, Library->CellTypes, Library->NumberOfCellTypes * sizeof(CellTypeStruct *));
					free(Library->CellTypes);
					Library->CellTypes = TempCellTypes;

					Library->CellTypes[Library->NumberOfCellTypes] = (CellTypeStruct *)malloc(sizeof(CellTypeStruct));
					Library->CellTypes[Library->NumberOfCellTypes]->SCAType = -1;
					Library->CellTypes[Library->NumberOfCellTypes]->SCAType2 = -1;
					Library->CellTypes[Library->NumberOfCellTypes]->Type = 0;
					Library->CellTypes[Library->NumberOfCellTypes]->CustomName = (char*)calloc(1, sizeof(char));

					if (!strcmp(Str1, "Gate"))
					{
						Library->CellTypes[Library->NumberOfCellTypes]->GateOrReg = CellType_Gate;
						Library->CellTypes[Library->NumberOfCellTypes]->Type |= GateType_Normal;
					}
					else if (!strcmp(Str1, "SCAGate"))
					{
						Library->CellTypes[Library->NumberOfCellTypes]->GateOrReg = CellType_Gate;
						Library->CellTypes[Library->NumberOfCellTypes]->Type |= GateType_SCA;
					}
					else if (!strcmp(Str1, "RegBuffer"))
					{
						Library->RegBufferCellType = Library->NumberOfCellTypes;
						Library->CellTypes[Library->NumberOfCellTypes]->GateOrReg = CellType_Gate;
						Library->CellTypes[Library->NumberOfCellTypes]->Type |= GateType_SCA;
					}
					else if (!strcmp(Str1, "SCAReg"))
					{
						Library->CellTypes[Library->NumberOfCellTypes]->GateOrReg = CellType_Reg;
						Library->CellTypes[Library->NumberOfCellTypes]->Type |= GateType_SCA;
					}
					else if (!strcmp(Str1, "Buffer"))
					{
						Library->BufferCellType = Library->NumberOfCellTypes;
						Library->CellTypes[Library->NumberOfCellTypes]->GateOrReg = CellType_Gate;
						Library->CellTypes[Library->NumberOfCellTypes]->Type |= GateType_Normal;
						Library->CellTypes[Library->NumberOfCellTypes]->Type |= GateType_Buffer;
					}
					else if (!strcmp(Str1, "XORGate"))
					{
						Library->CellTypes[Library->NumberOfCellTypes]->GateOrReg = CellType_Gate;
						Library->CellTypes[Library->NumberOfCellTypes]->Type |= GateType_Normal;
						Library->CellTypes[Library->NumberOfCellTypes]->Type |= GateType_XOR;
					}
					else if (!strcmp(Str1, "MUX2Gate"))
					{
						Library->CellTypes[Library->NumberOfCellTypes]->GateOrReg = CellType_Gate;
						Library->CellTypes[Library->NumberOfCellTypes]->Type |= GateType_Normal;
						Library->CellTypes[Library->NumberOfCellTypes]->Type |= GateType_Mux2;
					}
					else if (!strcmp(Str1, "Reg"))
					{
						Library->CellTypes[Library->NumberOfCellTypes]->GateOrReg = CellType_Reg;
						Library->CellTypes[Library->NumberOfCellTypes]->Type |= GateType_Normal;
					}
					else if (!strcmp(Str1, "ClockGating"))
					{
						Library->ClockGatingCellType = Library->NumberOfCellTypes;
						Library->CellTypes[Library->NumberOfCellTypes]->GateOrReg = CellType_Gate;
					}
					else
					{
						printf("\nCellType \"%s\" in library not known\n", Str1);
						fclose(LibraryFile);
						free(LocalLibraryName);
						free(Str1);
						free(Str2);
						return 1;
					}

					ReadNonCommentFromFile(LibraryFile, Str1, "%");
					Library->CellTypes[Library->NumberOfCellTypes]->NumberOfStages = EvaluateExpression(Str1, SecurityOrder, LowLatency);

					ReadNonCommentFromFile(LibraryFile, Str1, "%");
					Library->CellTypes[Library->NumberOfCellTypes]->NumberOfCases = atoi(Str1);
					Library->CellTypes[Library->NumberOfCellTypes]->Cases = (char **)malloc(Library->CellTypes[Library->NumberOfCellTypes]->NumberOfCases * sizeof(char *));

					for (i = 0;i < Library->CellTypes[Library->NumberOfCellTypes]->NumberOfCases;i++)
					{
						ReadNonCommentFromFile(LibraryFile, Str1, "%");

						for (TempIndex=0;TempIndex< Library->NumberOfCellTypes;TempIndex++)
							for (j=0;j< Library->CellTypes[TempIndex]->NumberOfCases;j++)
								if (!strcmp(Library->CellTypes[TempIndex]->Cases[j], Str1))
								{
									printf("\ncase \"%s\" repeated in library\n", Str1);
									fclose(LibraryFile);
									free(LocalLibraryName);
									free(Str1);
									free(Str2);
									return 1;
								}

						Library->CellTypes[Library->NumberOfCellTypes]->Cases[i] = (char *)malloc(strlen(Str1) + 1);
						strcpy(Library->CellTypes[Library->NumberOfCellTypes]->Cases[i], Str1);
					}

					if ((Library->CellTypes[Library->NumberOfCellTypes]->GateOrReg == CellType_Gate) &&
						(Library->CellTypes[Library->NumberOfCellTypes]->Type & GateType_Normal))
					{
						ReadNonCommentFromFile(LibraryFile, Str1, "%");
						Library->CellTypes[Library->NumberOfCellTypes]->CustomName = (char *)malloc(strlen(Str1) + 1);
						strcpy(Library->CellTypes[Library->NumberOfCellTypes]->CustomName, Str1);
					}

					ReadNonCommentFromFile(LibraryFile, Str1, "%");
					Number = atoi(Str1);
					Library->CellTypes[Library->NumberOfCellTypes]->NumberOfInputs = 0;
					Library->CellTypes[Library->NumberOfCellTypes]->Inputs = NULL;

					for (i = 0;i < Number;i++)
					{
						ReadNonCommentFromFile(LibraryFile, Str1, "%");
						if (Library->CellTypes[Library->NumberOfCellTypes]->Type & GateType_SCA)
						{
							ReadNonCommentFromFile(LibraryFile, Str2, "%");
							Count = EvaluateExpression(Str2, SecurityOrder, LowLatency);
						}
						else
							Count = 1;

						for (j = 0;j < Count;j++)
						{
							if (Count > 1)
								sprintf(Str2, "%s[%d]", Str1, j);
							else
								strcpy(Str2, Str1);

							Buffer_char = (char **)malloc((Library->CellTypes[Library->NumberOfCellTypes]->NumberOfInputs + 1) * sizeof(char *));
							memcpy(Buffer_char, Library->CellTypes[Library->NumberOfCellTypes]->Inputs, Library->CellTypes[Library->NumberOfCellTypes]->NumberOfInputs * sizeof(char *));
							free(Library->CellTypes[Library->NumberOfCellTypes]->Inputs);
							Library->CellTypes[Library->NumberOfCellTypes]->Inputs = Buffer_char;

							Library->CellTypes[Library->NumberOfCellTypes]->Inputs[Library->CellTypes[Library->NumberOfCellTypes]->NumberOfInputs] = (char *)malloc(strlen(Str2) + 1);
							strcpy(Library->CellTypes[Library->NumberOfCellTypes]->Inputs[Library->CellTypes[Library->NumberOfCellTypes]->NumberOfInputs], Str2);
							Library->CellTypes[Library->NumberOfCellTypes]->NumberOfInputs++;
						}
					}

					ReadNonCommentFromFile(LibraryFile, Str1, "%");
					Number = atoi(Str1);
					Library->CellTypes[Library->NumberOfCellTypes]->NumberOfOutputs = 0;
					Library->CellTypes[Library->NumberOfCellTypes]->Outputs = NULL;

					for (i = 0;i < Number;i++)
					{
						ReadNonCommentFromFile(LibraryFile, Str1, "%");
						if (Library->CellTypes[Library->NumberOfCellTypes]->Type & GateType_SCA)
						{
							ReadNonCommentFromFile(LibraryFile, Str2, "%");
							Count = EvaluateExpression(Str2, SecurityOrder, LowLatency);
						}
						else
							Count = 1;

						for (j = 0;j < Count;j++)
						{
							if (Count > 1)
								sprintf(Str2, "%s[%d]", Str1, j);
							else
								strcpy(Str2, Str1);

							Buffer_char = (char **)malloc((Library->CellTypes[Library->NumberOfCellTypes]->NumberOfOutputs + 1) * sizeof(char *));
							memcpy(Buffer_char, Library->CellTypes[Library->NumberOfCellTypes]->Outputs, Library->CellTypes[Library->NumberOfCellTypes]->NumberOfOutputs * sizeof(char *));
							free(Library->CellTypes[Library->NumberOfCellTypes]->Outputs);
							Library->CellTypes[Library->NumberOfCellTypes]->Outputs = Buffer_char;

							Library->CellTypes[Library->NumberOfCellTypes]->Outputs[Library->CellTypes[Library->NumberOfCellTypes]->NumberOfOutputs] = (char *)malloc(strlen(Str2) + 1);
							strcpy(Library->CellTypes[Library->NumberOfCellTypes]->Outputs[Library->CellTypes[Library->NumberOfCellTypes]->NumberOfOutputs], Str2);
							Library->CellTypes[Library->NumberOfCellTypes]->NumberOfOutputs++;
						}
					}

					if (Library->CellTypes[Library->NumberOfCellTypes]->Type & GateType_Normal)
					{
						ReadNonCommentFromFile(LibraryFile, Str1, "%");

						if (General && (Str1[strlen(Str1) - 1] == '_'))
							strcat(Str1, LocalLibraryName);

						for (i = 0;i < Library->NumberOfCellTypes;i++)
						{
							for (j = 0;j < Library->CellTypes[i]->NumberOfCases;j++)
								if (!strcmp(Str1, Library->CellTypes[i]->Cases[j]))
									break;
							if (j < Library->CellTypes[i]->NumberOfCases)
								break;
						}

						if (i < Library->NumberOfCellTypes)
							Library->CellTypes[Library->NumberOfCellTypes]->SCAType = i;
						else
						{
							printf("\nSCAType \"%s\" for cell \"%s\" in library not known\n", Str1, Library->CellTypes[Library->NumberOfCellTypes]->Cases[0]);
							fclose(LibraryFile);
							free(LocalLibraryName);
							free(Str1);
							free(Str2);
							return 1;
						}

						if (Library->CellTypes[Library->NumberOfCellTypes]->Type & GateType_Mux2)
						{
							ReadNonCommentFromFile(LibraryFile, Str1, "%");
							for (i = 0;i < Library->NumberOfCellTypes;i++)
							{
								for (j = 0;j < Library->CellTypes[i]->NumberOfCases;j++)
									if (!strcmp(Str1, Library->CellTypes[i]->Cases[j]))
										break;
								if (j < Library->CellTypes[i]->NumberOfCases)
									break;
							}

							if (i < Library->NumberOfCellTypes)
								Library->CellTypes[Library->NumberOfCellTypes]->SCAType2 = i;
							else
							{
								printf("\nSCAType2 \"%s\" for cell \"%s\" in library not known\n", Str1, Library->CellTypes[Library->NumberOfCellTypes]->Cases[0]);
								fclose(LibraryFile);
								free(LocalLibraryName);
								free(Str1);
								free(Str2);
								return 1;
							}
						}
					}

					Library->NumberOfCellTypes++;
					ReadNonCommentFromFile(LibraryFile, Str1, "%");
				}

				LibraryRead = 1;
			}
		}
	}

	fclose(LibraryFile);
	free(LocalLibraryName);
	free(Str1);
	free(Str2);

	if (!LibraryRead)
	{
		printf("\nLibrary \"%s\" could not be found\n", LibraryName);
		return 1;
	}

	printf("done\n");

	return 0;
}

//***************************************************************************************

int ProcessAttribute(char* AttributeKeyword, char* AttributeText, char** &NewAttributes, int &NumberOfNewAttributes)
{
	int		i;
	char*	ptr;
	char	ch;
	int		j;
	int		k;
	char*	Str1;
	char*	Str2;
	char*	Str3;
	char*	Str4;
	int		VariableIndex1;
	int		VariableIndex2;
	int		VariableIndex;
	int		ShareIndex1;
	int		ShareIndex2;
	int		ShareIndex;
	int		VariableIndexUpwards;
	int		ShareIndexUpwards;
	char**	Buffer_char;

	for (i = 0;i < NumberOfNewAttributes;i++)
		free(NewAttributes[i]);
	free(NewAttributes);
	NumberOfNewAttributes = 0;
	NewAttributes = NULL;

	Str1 = (char*)malloc(Max_Name_Length * sizeof(char));
	Str2 = (char*)malloc(Max_Name_Length * sizeof(char));
	Str3 = (char*)malloc(Max_Name_Length * sizeof(char));
	Str4 = (char*)malloc(Max_Name_Length * sizeof(char));

	ptr = strstr(AttributeText, AttributeKeyword);
	if (ptr)
	{
		ptr += strlen(AttributeKeyword);

		while ((*ptr == ' ') && (*ptr)) // skipping space ' '
			ptr++;

		if (*ptr == '=')  // the next one must be '='
		{
			ptr++;
			while ((*ptr == ' ') && (*ptr)) // skipping space ' '
				ptr++;

			if (*ptr == '\"')  // the next one must be '"'
			{
				do {
					i = 0;
					VariableIndex1 = -1;
					VariableIndex2 = -1;
					ShareIndex1 = -1;
					ShareIndex2 = -1;
					Str1[0] = 0;
					Str2[0] = 0;

					do {
						ptr++;
						ch = *ptr;

						if ((ch == '[') && (!i))
						{
							// do nothing
						}
						else if (ch == ':')
						{
							if (Str2[0] || (VariableIndex1 != -1))
								ShareIndex1 = atoi(Str1);
							else
								VariableIndex1 = atoi(Str1);
							i = 0;
						}
						else if (ch == ']')
						{
							if (Str2[0] || (VariableIndex2 != -1))
								ShareIndex2 = atoi(Str1);
							else
								VariableIndex2 = atoi(Str1);
							i = 0;
						}
						else if (ch == '_')
						{
							Str1[i] = 0;
							strcpy(Str2, Str1);
							i = 0;
						}
						else if ((ch == ',') || (ch == '\"'))
						{
							if ((VariableIndex1 != -1) && (ShareIndex1 != -1))
							{
								printf("given attribute is not valid: %s\n", AttributeText);
								free(Str1);
								free(Str2);
								free(Str3);
								free(Str4);
								return(1);
							}

							VariableIndex = atoi(Str2);
							ShareIndex = atoi(Str1);
							VariableIndexUpwards = (VariableIndex1 < VariableIndex2) ? 1 : -1;
							ShareIndexUpwards = (ShareIndex1 < ShareIndex2) ? 1 : -1;

							for (j = VariableIndex1;((VariableIndexUpwards == 1) && (j <= VariableIndex2)) || ((VariableIndexUpwards == -1) && (j >= VariableIndex2)); j += VariableIndexUpwards)
							{
								if (VariableIndex1 != -1)
									sprintf(Str3, "%d_", j);
								else
								{
									if (strstr(Str1, "secure"))
										strcpy(Str3, "secure");
									else if (strstr(Str1, "constant"))
										strcpy(Str3, "constant");
									else if (strstr(Str1, "reset"))
										strcpy(Str3, "reset");
									else if (strstr(Str1, "clock"))
										strcpy(Str3, "clock");
									else
										if ((VariableIndex1 == -1) && (ShareIndex1 == -1))
											strcpy(Str3, Str1);
										else
											sprintf(Str3, "%d_", VariableIndex);
								}

								for (k = ShareIndex1;((ShareIndexUpwards == 1) && (k <= ShareIndex2)) || ((ShareIndexUpwards == -1) && (k >= ShareIndex2)); k += ShareIndexUpwards)
								{
									if (ShareIndex1 != -1)
										sprintf(Str4, "%s%d", Str3, k);
									else
									{
										if (strstr(Str1, "secure") || strstr(Str1, "constant") || strstr(Str1, "reset") || strstr(Str1, "clock") || ((VariableIndex1 == -1) && (ShareIndex1 == -1)))
											strcpy(Str4, Str3);
										else
											sprintf(Str4, "%s%d", Str3, ShareIndex);
									}

									Buffer_char = (char**)malloc((NumberOfNewAttributes + 1) * sizeof(char*));
									memcpy(Buffer_char, NewAttributes, NumberOfNewAttributes * sizeof(char*));
									free(NewAttributes);
									NewAttributes = Buffer_char;

									NewAttributes[NumberOfNewAttributes] = (char*)malloc((strlen(Str4) + 1) * sizeof(char));
									strcpy(NewAttributes[NumberOfNewAttributes], Str4);
									NumberOfNewAttributes++;
								}
							}
						}
						else if ((ch != ' ') && (ch != '\n') && (ch != '\t') && (ch != '\r'))
						{
							Str1[i++] = ch;
							Str1[i] = 0;
						}
					} while ((ch != '\"') && (ch != ',') && ch);
				} while (ch != '\"');


			}
		}
	}

	free(Str1);
	free(Str2);
	free(Str3);
	free(Str4);
	return(0);
}

//***************************************************************************************

int AddSignalToConstants(CircuitStruct* Circuit, int SignalIndex)
{
	int*	TempInt;

	Circuit->Signals[SignalIndex]->Type = SignalType_constant;

	TempInt = (int *)malloc((Circuit->NumberOfConstants + 1) * sizeof(int));
	memcpy(TempInt, Circuit->Constants, Circuit->NumberOfConstants * sizeof(int));
	free(Circuit->Constants);
	Circuit->Constants = TempInt;
	Circuit->Constants[Circuit->NumberOfConstants] = SignalIndex;
	Circuit->NumberOfConstants++;

	return(Circuit->NumberOfConstants);
}

//***************************************************************************************

int ReadDesignFile(char* InputVerilogFileName, char* MainModuleName,
	LibraryStruct* Library, CircuitStruct* Circuit, char* AttributeKeyword, char print = 1)
{
	FILE*			DesignFile;
	char			finished;
	char			ReadSignalsFinished;
	int				CellTypeIndex;
	int				CaseIndex;
	char*			Str1 = (char *)malloc(Max_Name_Length * sizeof(char));
	char*			Str2 = (char *)malloc(Max_Name_Length * sizeof(char));
	char			ch;
	int				i, j;
	int				MyNumberofIO;
	int				CurrentIO;
	int				InputIndex;
	int				OutputIndex;
	int				SignalIndex;
	int*			Buffer_int;
	int				Index1, Index2, IndexUpwards;
	SignalStruct**	TempSignals;
	int*			TempInputs;
	int*			TempOutputs;
	CellStruct**	TempCells;
	int*			TempGates;
	int*			TempRegs;
	char**			NewAttributes = NULL;
	int				NumberOfNewAttributes = 0;
	int				NewAttributeIndex;
	int				TempAttributeIndex;
	char**			InputAttributes = NULL;
	int				NumberOfInputAttributes = 0;
	char**			Buffer_char;
	unsigned char	WithAttributes;

	if (print)
		printf("reading the design file...");

	WithAttributes = (AttributeKeyword != NULL);

	Circuit->NumberOfSignals = 0;
	Circuit->NumberOfOutputs = 0;
	Circuit->NumberOfInputs = 0;

	char *Phrase = (char *)malloc(Max_Name_Length * sizeof(char));
	char *AttributeText = (char *)malloc(100000 * sizeof(char)); // can be very long
	char Task;
	char IO_port_found;

	Circuit->NumberOfCells = 0;
	Circuit->NumberOfGates = 0;
	Circuit->NumberOfRegs = 0;

	Circuit->ClockSignalIndex = -1;
	Circuit->ResetSignalIndex = -1;

	// --------- adding 0 and 1 Circuit->Signals --------------

	Circuit->NumberOfSignals = 6;
	Circuit->Signals = (SignalStruct **)malloc(Circuit->NumberOfSignals * sizeof(SignalStruct *));

	Circuit->Signals[0] = (SignalStruct *)malloc(sizeof(SignalStruct));
	Circuit->Signals[0]->Name = (char *)malloc(strlen("1'b0") + 1);
	strcpy(Circuit->Signals[0]->Name, "1'b0");
	Circuit->Signals[0]->Type = SignalType_constant;
	Circuit->Signals[0]->NumberOfInputs = 0;
	Circuit->Signals[0]->Inputs = NULL;
	Circuit->Signals[0]->Output = -1;
	Circuit->Signals[0]->ToBeBalanced = 0;
	Circuit->Signals[0]->Deleted = 0;
	Circuit->Signals[0]->Attribute = (char*)calloc(1, sizeof(char));
	AddSignalToConstants(Circuit, 0);

	Circuit->Signals[1] = (SignalStruct *)malloc(sizeof(SignalStruct));
	Circuit->Signals[1]->Name = (char *)malloc(strlen("1'b1") + 1);
	strcpy(Circuit->Signals[1]->Name, "1'b1");
	Circuit->Signals[1]->Type = SignalType_constant;
	Circuit->Signals[1]->NumberOfInputs = 0;
	Circuit->Signals[1]->Inputs = NULL;
	Circuit->Signals[1]->Output = -1;
	Circuit->Signals[1]->ToBeBalanced = 0;
	Circuit->Signals[1]->Deleted = 0;
	Circuit->Signals[1]->Attribute = (char*)calloc(1, sizeof(char));
	AddSignalToConstants(Circuit, 1);

	Circuit->Signals[2] = (SignalStruct *)malloc(sizeof(SignalStruct));
	Circuit->Signals[2]->Name = (char *)malloc(strlen("1'h0") + 1);
	strcpy(Circuit->Signals[2]->Name, "1'h0");
	Circuit->Signals[2]->Type = SignalType_constant;
	Circuit->Signals[2]->NumberOfInputs = 0;
	Circuit->Signals[2]->Inputs = NULL;
	Circuit->Signals[2]->Output = -1;
	Circuit->Signals[2]->ToBeBalanced = 0;
	Circuit->Signals[2]->Deleted = 0;
	Circuit->Signals[2]->Attribute = (char*)calloc(1, sizeof(char));
	AddSignalToConstants(Circuit, 2);

	Circuit->Signals[3] = (SignalStruct *)malloc(sizeof(SignalStruct));
	Circuit->Signals[3]->Name = (char *)malloc(strlen("1'h1") + 1);
	strcpy(Circuit->Signals[3]->Name, "1'h1");
	Circuit->Signals[3]->Type = SignalType_constant;
	Circuit->Signals[3]->NumberOfInputs = 0;
	Circuit->Signals[3]->Inputs = NULL;
	Circuit->Signals[3]->Output = -1;
	Circuit->Signals[3]->ToBeBalanced = 0;
	Circuit->Signals[3]->Deleted = 0;
	Circuit->Signals[3]->Attribute = (char*)calloc(1, sizeof(char));
	AddSignalToConstants(Circuit, 3);

	Circuit->Signals[4] = (SignalStruct *)malloc(sizeof(SignalStruct));
	Circuit->Signals[4]->Name = (char *)malloc(strlen("1'bx") + 1);
	strcpy(Circuit->Signals[4]->Name, "1'bx");
	Circuit->Signals[4]->Type = SignalType_constant;
	Circuit->Signals[4]->NumberOfInputs = 0;
	Circuit->Signals[4]->Inputs = NULL;
	Circuit->Signals[4]->Output = -1;
	Circuit->Signals[4]->ToBeBalanced = 0;
	Circuit->Signals[4]->Deleted = 0;
	Circuit->Signals[4]->Attribute = (char*)calloc(1, sizeof(char));
	AddSignalToConstants(Circuit, 4);

	Circuit->Signals[5] = (SignalStruct *)malloc(sizeof(SignalStruct));
	Circuit->Signals[5]->Name = (char *)malloc(strlen("1'hx") + 1);
	strcpy(Circuit->Signals[5]->Name, "1'hx");
	Circuit->Signals[5]->Type = SignalType_constant;
	Circuit->Signals[5]->NumberOfInputs = 0;
	Circuit->Signals[5]->Inputs = NULL;
	Circuit->Signals[5]->Output = -1;
	Circuit->Signals[5]->ToBeBalanced = 0;
	Circuit->Signals[5]->Deleted = 0;
	Circuit->Signals[5]->Attribute = (char*)calloc(1, sizeof(char));
	AddSignalToConstants(Circuit, 5);


	//---------------------------------------------------------------------------------------------//
	//------------------- reading the Circuit->Signals from the design file --------------------------------//

	DesignFile = fopen(InputVerilogFileName, "rt");

	if (DesignFile == NULL)
	{
		printf("\ndesign file \"%s\" not found\n", InputVerilogFileName);
		free(Str1);
		free(Str2);
		free(Phrase);
		free(AttributeText);
		return 1;
	}

	finished = 0;
	ReadSignalsFinished = 0;

	do {
		do {
			fReadaWord(DesignFile, Str1, NULL);
		} while ((!feof(DesignFile)) && strcmp(Str1, "module"));

		if (!feof(DesignFile))
		{
			fReadaWord(DesignFile, Str1, NULL);
			if (strcmp(Str1, MainModuleName))
			{
				do {
					fReadaWord(DesignFile, Str1, NULL);
				} while ((!feof(DesignFile)) && strcmp(Str1, "endmodule"));
			}
			else
			{
				do {
					fReadaWord(DesignFile, Str1, NULL);
					ch = Str1[strlen(Str1) - 1];
				} while ((ch != ';') && (!feof(DesignFile)));  // ignoring the entire list of input/output ports

				while ((!ReadSignalsFinished) && (!feof(DesignFile)))
				{
					fReadaWord(DesignFile, Str1, AttributeText);

					if ((!strcmp(Str1, "input")) || (!strcmp(Str1, "output")) || (!strcmp(Str1, "wire")))
					{
						if (WithAttributes &&
							ProcessAttribute(AttributeKeyword, AttributeText, NewAttributes, NumberOfNewAttributes))
						{
							printf("\nprocessing the attribute %s failed\n", AttributeText);
							fclose(DesignFile);
							free(Str1);
							free(Str2);
							free(Phrase);
							free(AttributeText);
							return 1;
						}

						strcpy(Phrase, Str1);
						i = 0;
						Index1 = -1;
						Index2 = -1;

						do {
							ch = fgetc(DesignFile);

							if ((ch == '[') && (!i))
							{
								// do nothing
							}
							else if (ch == ':')
							{
								Index1 = atoi(Str1);
								i = 0;
							}
							else if ((ch == ']') && (Str1[0] != '\\'))
							{
								Index2 = atoi(Str1);
								i = 0;
							}
							else if ((ch == ',') || (ch == ';'))
							{
								NewAttributeIndex = 0;
								IndexUpwards = (Index1 < Index2) ? 1 : -1;

								for (j = Index1;((IndexUpwards == 1) && (j <= Index2)) || ((IndexUpwards == -1) && (j >= Index2)); j += IndexUpwards)
								{
									if (Index1 != -1)
										sprintf(Str2, "%s[%d]", Str1, j);
									else
										sprintf(Str2, "%s", Str1);

									TempSignals = (SignalStruct **)malloc((Circuit->NumberOfSignals + 1) * sizeof(SignalStruct *));
									memcpy(TempSignals, Circuit->Signals, Circuit->NumberOfSignals * sizeof(SignalStruct *));
									free(Circuit->Signals);
									Circuit->Signals = TempSignals;

									Circuit->Signals[Circuit->NumberOfSignals] = (SignalStruct *)malloc(sizeof(SignalStruct));
									Circuit->Signals[Circuit->NumberOfSignals]->Name = (char *)malloc(strlen(Str2) + 1);
									strcpy(Circuit->Signals[Circuit->NumberOfSignals]->Name, Str2);
									Circuit->Signals[Circuit->NumberOfSignals]->FreshMask = 0;
									Circuit->Signals[Circuit->NumberOfSignals]->NumberOfInputs = 0;
									Circuit->Signals[Circuit->NumberOfSignals]->Inputs = NULL;
									Circuit->Signals[Circuit->NumberOfSignals]->Output = -1;
									Circuit->Signals[Circuit->NumberOfSignals]->Deleted = 0;

									if (!strcmp(Phrase, "input"))
									{
										Circuit->Signals[Circuit->NumberOfSignals]->Type = SignalType_input;

										TempInputs = (int *)malloc((Circuit->NumberOfInputs + 1) * sizeof(int));
										memcpy(TempInputs, Circuit->Inputs, Circuit->NumberOfInputs * sizeof(int));
										free(Circuit->Inputs);
										Circuit->Inputs = TempInputs;

										Circuit->Inputs[Circuit->NumberOfInputs] = Circuit->NumberOfSignals;
										Circuit->NumberOfInputs++;

										if (NewAttributeIndex < NumberOfNewAttributes)
										{
											for (TempAttributeIndex = 0;TempAttributeIndex < NumberOfInputAttributes;TempAttributeIndex++)
												if (!strcmp(InputAttributes[TempAttributeIndex], NewAttributes[NewAttributeIndex]))
													break;

											if (TempAttributeIndex < NumberOfInputAttributes)
											{
												printf("\ndouplicat attribute %s found for input %s\n", NewAttributes[NewAttributeIndex], Str2);
												fclose(DesignFile);
												free(Str1);
												free(Str2);
												free(Phrase);
												free(AttributeText);
												return 1;
											}

											if (!strcmp(NewAttributes[NewAttributeIndex], "clock"))
												Circuit->ClockSignalIndex = Circuit->NumberOfSignals;
											else if (!strcmp(NewAttributes[NewAttributeIndex], "reset"))
												Circuit->ResetSignalIndex = Circuit->NumberOfSignals;
											else if (strcmp(NewAttributes[NewAttributeIndex], "secure") &&
												strcmp(NewAttributes[NewAttributeIndex], "constant"))
											{
												printf("\nattribute %s is not known for input %s\n", NewAttributes[NewAttributeIndex], Str2);
												fclose(DesignFile);
												free(Str1);
												free(Str2);
												free(Phrase);
												free(AttributeText);
												return 1;
											}

											Circuit->Signals[Circuit->NumberOfSignals]->Attribute = (char*)malloc((strlen(NewAttributes[NewAttributeIndex]) + 1) * sizeof(char));
											strcpy(Circuit->Signals[Circuit->NumberOfSignals]->Attribute, NewAttributes[NewAttributeIndex]);

											if (strcmp(NewAttributes[NewAttributeIndex], "secure") && // add it to the list if it is not secure nor constant
												strcmp(NewAttributes[NewAttributeIndex], "constant"))
											{
												Buffer_char = (char**)malloc((NumberOfInputAttributes + 1) * sizeof(char*));
												memcpy(Buffer_char, InputAttributes, NumberOfInputAttributes * sizeof(char*));
												free(InputAttributes);
												InputAttributes = Buffer_char;

												InputAttributes[NumberOfInputAttributes] = (char*)malloc((strlen(NewAttributes[NewAttributeIndex]) + 1) * sizeof(char));
												strcpy(InputAttributes[NumberOfInputAttributes], NewAttributes[NewAttributeIndex]);
												NumberOfInputAttributes++;
												NewAttributeIndex++;
											}
										}
										else if (!WithAttributes)
											Circuit->Signals[Circuit->NumberOfSignals]->Attribute = (char*)calloc(1, sizeof(char));
										else
										{
											printf("\nattribute of input %s not given\n", Str2);
											fclose(DesignFile);
											free(Str1);
											free(Str2);
											free(Phrase);
											free(AttributeText);
											return 1;
										}

										if (!strcmp(Circuit->Signals[Circuit->NumberOfSignals]->Attribute, "clock")) // ||	(!strcmp(Circuit->Signals[Circuit->NumberOfSignals]->Attribute, "reset")))
											Circuit->Signals[Circuit->NumberOfSignals]->ToBeBalanced = 0;
										else
											Circuit->Signals[Circuit->NumberOfSignals]->ToBeBalanced = 1;
									}
									else if (!strcmp(Phrase, "output"))
									{
										Circuit->Signals[Circuit->NumberOfSignals]->Type = SignalType_output;

										TempOutputs = (int *)malloc((Circuit->NumberOfOutputs + 1) * sizeof(int));
										memcpy(TempOutputs, Circuit->Outputs, Circuit->NumberOfOutputs * sizeof(int));
										free(Circuit->Outputs);
										Circuit->Outputs = TempOutputs;

										Circuit->Outputs[Circuit->NumberOfOutputs] = Circuit->NumberOfSignals;
										Circuit->NumberOfOutputs++;

										Circuit->Signals[Circuit->NumberOfSignals]->Attribute = (char*)calloc(1, sizeof(char));
										Circuit->Signals[Circuit->NumberOfSignals]->ToBeBalanced = 1;
									}
									else  // if (!strcmp(Phrase, "wire"))
									{
										Circuit->Signals[Circuit->NumberOfSignals]->Type = SignalType_wire;
										Circuit->Signals[Circuit->NumberOfSignals]->Attribute = (char*)calloc(1, sizeof(char));
										Circuit->Signals[Circuit->NumberOfSignals]->ToBeBalanced = 1;
									}

									Circuit->NumberOfSignals++;
								}

								i = 0;
							}
							else if ((ch != ' ') && (ch != '\n') && (ch != '\t') && (ch != '\r'))
							{
								Str1[i++] = ch;
								Str1[i] = 0;
							}
						} while ((ch != ';') && (!feof(DesignFile)));
					}
					else
											ReadSignalsFinished = 1;
				}

				//---------------------------------------------------------------------------------------------//
				//------------------- reading the Circuit->Cells from the design file ----------------------------------//

				if (!feof(DesignFile))
				{
					strcpy(Str2, Str1);

					do {
						fReadaWord(DesignFile, Str1, NULL);
						if (Str1[0] != '[')
							strcat(Str2, " ");
						strcat(Str2, Str1);

						if (Str1[strlen(Str1) - 1] == ';')
						{
							i = 0;
							j = 0;
							Str1[0] = 0;
							Task = Task_find_module_type;

							do {
								ch = Str2[i++];

								if ((ch == ' ') || (ch == ';') || (ch == '='))
								{
									if (j)
									{
										if (Task == Task_find_module_type)
										{
											if (!strcmp(Str1, "assign"))
												if (Library->BufferCellType > -1)
													CellTypeIndex = Library->BufferCellType;
												else
												{
													printf("\nbuffer cell is not defined in the library for \"assign\" statements\n");
													fclose(DesignFile);
													free(Str1);
													free(Str2);
													free(Phrase);
													free(AttributeText);
													return 1;
												}
											else
												for (CellTypeIndex = 0;CellTypeIndex < Library->NumberOfCellTypes;CellTypeIndex++)
												{
													for (CaseIndex = 0;CaseIndex < Library->CellTypes[CellTypeIndex]->NumberOfCases;CaseIndex++)
														if (!strcmp(Str1, Library->CellTypes[CellTypeIndex]->Cases[CaseIndex]))
															break;

													if (CaseIndex < Library->CellTypes[CellTypeIndex]->NumberOfCases)
														break;
												}

											if (CellTypeIndex < Library->NumberOfCellTypes)
											{
												TempCells = (CellStruct **)malloc((Circuit->NumberOfCells + 1) * sizeof(CellStruct *));
												memcpy(TempCells, Circuit->Cells, Circuit->NumberOfCells * sizeof(CellStruct *));
												free(Circuit->Cells);
												Circuit->Cells = TempCells;

												Circuit->Cells[Circuit->NumberOfCells] = (CellStruct *)malloc(sizeof(CellStruct));
												Circuit->Cells[Circuit->NumberOfCells]->Type = CellTypeIndex;
												Circuit->Cells[Circuit->NumberOfCells]->NumberOfInputs = Library->CellTypes[CellTypeIndex]->NumberOfInputs;
												Circuit->Cells[Circuit->NumberOfCells]->Inputs = (int *)malloc(Library->CellTypes[CellTypeIndex]->NumberOfInputs * sizeof(int));
												Circuit->Cells[Circuit->NumberOfCells]->NumberOfOutputs = Library->CellTypes[CellTypeIndex]->NumberOfOutputs;
												Circuit->Cells[Circuit->NumberOfCells]->Outputs = (int *)malloc(Library->CellTypes[CellTypeIndex]->NumberOfOutputs * sizeof(int));
												Circuit->Cells[Circuit->NumberOfCells]->OrigType = -1;
												Circuit->Cells[Circuit->NumberOfCells]->NumberOfStages = Library->CellTypes[CellTypeIndex]->NumberOfStages;
												Circuit->Cells[Circuit->NumberOfCells]->Deleted = 0;

												if (Library->CellTypes[CellTypeIndex]->GateOrReg == CellType_Gate)
												{
													TempGates = (int *)malloc((Circuit->NumberOfGates + 1) * sizeof(int));
													memcpy(TempGates, Circuit->Gates, Circuit->NumberOfGates * sizeof(int));
													free(Circuit->Gates);
													Circuit->Gates = TempGates;

													Circuit->Gates[Circuit->NumberOfGates] = Circuit->NumberOfCells;
													Circuit->NumberOfGates++;
												}
												else // CellType_Reg
												{
													TempRegs = (int *)malloc((Circuit->NumberOfRegs + 1) * sizeof(int));
													memcpy(TempRegs, Circuit->Regs, Circuit->NumberOfRegs * sizeof(int));
													free(Circuit->Regs);
													Circuit->Regs = TempRegs;

													Circuit->Regs[Circuit->NumberOfRegs] = Circuit->NumberOfCells;
													Circuit->NumberOfRegs++;
												}

												if (!strcmp(Str1, "assign"))
												{
													sprintf(Str1, "assign_%d", Circuit->NumberOfCells);
													Circuit->Cells[Circuit->NumberOfCells]->Name = (char *)malloc(strlen(Str1) + 1);
													strcpy(Circuit->Cells[Circuit->NumberOfCells]->Name, Str1); // Str1 = "assign_%d"

													Task = Task_find_assign_signal_name1;
													InputIndex = -1;
													OutputIndex = 0;
												}
												else
													Task = Task_find_module_name;

												MyNumberofIO = Library->CellTypes[CellTypeIndex]->NumberOfInputs + Library->CellTypes[CellTypeIndex]->NumberOfOutputs;
												CurrentIO = 0;
											}
											else
											{
												printf("\ncell type \"%s\" not found\n", Str1);
												fclose(DesignFile);
												free(Str1);
												free(Str2);
												free(Phrase);
												free(AttributeText);
												return 1;
											}
										}
										else if (Task == Task_find_module_name)
										{
											Circuit->Cells[Circuit->NumberOfCells]->Name = (char *)malloc(strlen(Str1) + 1);
											strcpy(Circuit->Cells[Circuit->NumberOfCells]->Name, Str1);

											Task = Task_find_open_bracket;
											IO_port_found = 0;
										}
										else if (Task == Task_find_IO_port)
										{
											if (Str1[0] == '.')
											{
												for (InputIndex = 0;InputIndex < Library->CellTypes[CellTypeIndex]->NumberOfInputs;InputIndex++)
												{
													if (!strcmp(Str1 + 1, Library->CellTypes[CellTypeIndex]->Inputs[InputIndex]))
														break;
												}

												if (InputIndex >= Library->CellTypes[CellTypeIndex]->NumberOfInputs) // the IO port NOT found in the Circuit->Inputs
												{
													for (OutputIndex = 0;OutputIndex < Library->CellTypes[CellTypeIndex]->NumberOfOutputs;OutputIndex++)
													{
														if (!strcmp(Str1 + 1, Library->CellTypes[CellTypeIndex]->Outputs[OutputIndex]))
															break;
													}

													if (OutputIndex >= Library->CellTypes[CellTypeIndex]->NumberOfOutputs) // the IO port NOT found in the Circuit->Outputs
													{
														printf("\nIO port \"%s\" not found in cell type \"%s\"\n", Str1 + 1, Library->CellTypes[CellTypeIndex]->Cases[CaseIndex]);
														fclose(DesignFile);
														free(Str1);
														free(Str2);
														free(Phrase);
														free(AttributeText);
														return 1;
													}

													InputIndex = -1;
												}

												IO_port_found = 1;
												Task = Task_find_open_bracket;
											}
											else
											{
												printf("\nerror in reading the netlist, '.' is expected in %s\n", Str1);
												fclose(DesignFile);
												free(Str1);
												free(Str2);
												free(Phrase);
												free(AttributeText);
												return 1;
											}
										}
										else if ((Task == Task_find_signal_name) ||
											(Task == Task_find_assign_signal_name1) ||
											(Task == Task_find_assign_signal_name2))
										{
											if (strlen(Str1))
											{
												for (SignalIndex = 0;SignalIndex < Circuit->NumberOfSignals;SignalIndex++)
												{
													if (!strcmp(Str1, Circuit->Signals[SignalIndex]->Name))
														break;
												}
											}
											else
												SignalIndex = -1;

											if (SignalIndex < Circuit->NumberOfSignals)
											{
												if (InputIndex != -1)
												{
													Circuit->Cells[Circuit->NumberOfCells]->Inputs[InputIndex] = SignalIndex;

													Buffer_int = (int *)malloc((Circuit->Signals[SignalIndex]->NumberOfInputs + 1) * sizeof(int));
													memcpy(Buffer_int, Circuit->Signals[SignalIndex]->Inputs, Circuit->Signals[SignalIndex]->NumberOfInputs * sizeof(int));
													free(Circuit->Signals[SignalIndex]->Inputs);
													Circuit->Signals[SignalIndex]->Inputs = Buffer_int;

													Circuit->Signals[SignalIndex]->Inputs[Circuit->Signals[SignalIndex]->NumberOfInputs] = Circuit->NumberOfCells;
													Circuit->Signals[SignalIndex]->NumberOfInputs++;
												}
												else
												{
													Circuit->Cells[Circuit->NumberOfCells]->Outputs[OutputIndex] = SignalIndex;
													if (SignalIndex != -1)
														Circuit->Signals[SignalIndex]->Output = Circuit->NumberOfCells;
												}
											}
											else
											{
												printf("\nsignal \"%s\" not found\n", Str1);
												fclose(DesignFile);
												free(Str1);
												free(Str2);
												free(Phrase);
												free(AttributeText);
												return 1;
											}

											CurrentIO++;

											if (Task == Task_find_assign_signal_name1)
												if (ch == '=')
												{
													Task = Task_find_assign_signal_name2;
													InputIndex = 0;
													OutputIndex = -1;
												}
												else
													Task = Task_find_equal;
											else if (Task == Task_find_assign_signal_name2)
												Task = -1; // irelevant
											else
												Task = Task_find_close_bracket;
										}

										j = 0;
										Str1[0] = 0;
									}
									else if (ch == '=')
									{
										if (Task == Task_find_equal)
										{
											Task = Task_find_assign_signal_name2;
											InputIndex = 0;
											OutputIndex = -1;
										}
										else
										{
											printf("\nError!\n");
											fclose(DesignFile);
											free(Str1);
											free(Str2);
											free(Phrase);
											free(AttributeText);
											return 1;
										}
									}
								}
								else if (ch == '(')
								{
									if (Task == Task_find_open_bracket)
									{
										if (IO_port_found)
											Task = Task_find_signal_name;
										else
											Task = Task_find_IO_port;
									}
									else if (Task == Task_find_IO_port)
									{
										if (Str1[0] == '.')
										{
											for (InputIndex = 0;InputIndex < Library->CellTypes[CellTypeIndex]->NumberOfInputs;InputIndex++)
											{
												if (!strcmp(Str1 + 1, Library->CellTypes[CellTypeIndex]->Inputs[InputIndex]))
													break;
											}

											if (InputIndex >= Library->CellTypes[CellTypeIndex]->NumberOfInputs) // the IO port NOT found in the Circuit->Inputs
											{
												for (OutputIndex = 0;OutputIndex < Library->CellTypes[CellTypeIndex]->NumberOfOutputs;OutputIndex++)
												{
													if (!strcmp(Str1 + 1, Library->CellTypes[CellTypeIndex]->Outputs[OutputIndex]))
														break;
												}

												if (OutputIndex >= Library->CellTypes[CellTypeIndex]->NumberOfOutputs) // the IO port NOT found in the Circuit->Outputs
												{
													printf("\nIO port \"%s\" did not found in cell type \"%s\"\n", Str1 + 1, Library->CellTypes[CellTypeIndex]->Cases[0]);
													fclose(DesignFile);
													free(Str1);
													free(Str2);
													free(Phrase);
													free(AttributeText);
													return 1;
												}

												InputIndex = -1;
											}

											Task = Task_find_signal_name;
										}
										else
										{
											printf("\nerror in reading the netlist, '.' is expected in %s\n", Str1);
											fclose(DesignFile);
											free(Str1);
											free(Str2);
											free(Phrase);
											free(AttributeText);
											return 1;
										}
									}
									else
									{
										printf("\nError!\n");
										fclose(DesignFile);
										free(Str1);
										free(Str2);
										free(Phrase);
										free(AttributeText);
										return 1;
									}

									j = 0;
									Str1[0] = 0;
								}
								else if (ch == ')')
								{
									if (Task == Task_find_close_bracket)
									{
										if (CurrentIO < MyNumberofIO)
											Task = Task_find_comma;
									}
									else if (Task == Task_find_signal_name)
									{
										if (strlen(Str1))
										{
											for (SignalIndex = 0;SignalIndex < Circuit->NumberOfSignals;SignalIndex++)
											{
												if (!strcmp(Str1, Circuit->Signals[SignalIndex]->Name))
													break;
											}
										}
										else
											SignalIndex = -1;

										if (SignalIndex < Circuit->NumberOfSignals)
										{
											if (InputIndex != -1)
											{
												Circuit->Cells[Circuit->NumberOfCells]->Inputs[InputIndex] = SignalIndex;

												Buffer_int = (int *)malloc((Circuit->Signals[SignalIndex]->NumberOfInputs + 1) * sizeof(int));
												memcpy(Buffer_int, Circuit->Signals[SignalIndex]->Inputs, Circuit->Signals[SignalIndex]->NumberOfInputs * sizeof(int));
												free(Circuit->Signals[SignalIndex]->Inputs);
												Circuit->Signals[SignalIndex]->Inputs = Buffer_int;

												Circuit->Signals[SignalIndex]->Inputs[Circuit->Signals[SignalIndex]->NumberOfInputs] = Circuit->NumberOfCells;
												Circuit->Signals[SignalIndex]->NumberOfInputs++;
											}
											else
											{
												Circuit->Cells[Circuit->NumberOfCells]->Outputs[OutputIndex] = SignalIndex;
												if (SignalIndex != -1)
													Circuit->Signals[SignalIndex]->Output = Circuit->NumberOfCells;
											}
										}
										else
										{
											printf("\nsignal \"%s\" not found\n", Str1);
											fclose(DesignFile);
											free(Str1);
											free(Str2);
											free(Phrase);
											free(AttributeText);
											return 1;
										}

										CurrentIO++;
										if (CurrentIO < MyNumberofIO)
											Task = Task_find_comma;
										else
											Task = Task_find_close_bracket;
									}
									else
									{
										printf("\nError!\n");
										fclose(DesignFile);
										free(Str1);
										free(Str2);
										free(Phrase);
										free(AttributeText);
										return 1;
									}

									j = 0;
									Str1[0] = 0;
								}
								else if (ch == ',')
								{
									IO_port_found = 0;
									Task = Task_find_IO_port;

									j = 0;
									Str1[0] = 0;
								}
								else
								{
									Str1[j++] = ch;
									Str1[j] = 0;
								}

							} while (ch != ';');

							Circuit->NumberOfCells++;

							Str1[0] = 0;
							Str2[0] = 0;
						}

					} while (strcmp(Str1, "endmodule") && (!feof(DesignFile)));

					finished = 1;
				}
			}
		}
	} while ((!feof(DesignFile)) && (!finished));

	fclose(DesignFile);
	free(Str1);
	free(Str2);
	free(Phrase);
	free(AttributeText);

	if (!finished)
	{
		printf("\nThe target module %s not found\n", MainModuleName);
		return 1;
	}

	// turn '1bx' and '1hx' to constant 0
	strcpy(Circuit->Signals[4]->Name, "1'b0");
	strcpy(Circuit->Signals[5]->Name, "1'h0");

	if (print)
		printf("done\n");

	return 0;
}

//***************************************************************************************

int MakeCircuitDepth(LibraryStruct* Library, CircuitStruct* Circuit)
{
	int   i;
	int   OutputIndex;
	int   SignalIndex;
	int   GateIndex;
	int   RegIndex;
	int   CellIndex;
	short DepthIndex;
	char  all_have_depth;
	char  one_got_depth;

	for (DepthIndex = 1;DepthIndex <= Circuit->MaxDepth;DepthIndex++)
		free(Circuit->CellsInDepth[DepthIndex]);
	free(Circuit->CellsInDepth);
	free(Circuit->NumberOfCellsInDepth);

	for (GateIndex = 0;GateIndex < Circuit->NumberOfGates;GateIndex++)
	{
		CellIndex = Circuit->Gates[GateIndex];

		if (!Circuit->Cells[CellIndex]->Deleted)
			Circuit->Cells[CellIndex]->Depth = -1;
	}

	for (RegIndex = 0;RegIndex < Circuit->NumberOfRegs;RegIndex++)
	{
		CellIndex = Circuit->Regs[RegIndex];

		if (!Circuit->Cells[CellIndex]->Deleted)
			Circuit->Cells[CellIndex]->Depth = 0;
	}

	for (SignalIndex = 0;SignalIndex < Circuit->NumberOfSignals;SignalIndex++)
		if (!Circuit->Signals[SignalIndex]->Deleted)
			if (Circuit->Signals[SignalIndex]->Output >= 0)
				Circuit->Signals[SignalIndex]->Depth = Circuit->Cells[Circuit->Signals[SignalIndex]->Output]->Depth;
			else
				Circuit->Signals[SignalIndex]->Depth = 0;

	Circuit->MaxDepth = 0;

	do
	{
		all_have_depth = 1;
		one_got_depth = 0;

		for (CellIndex = 0;CellIndex < Circuit->NumberOfCells;CellIndex++)
			if (!Circuit->Cells[CellIndex]->Deleted)
				if (Library->CellTypes[Circuit->Cells[CellIndex]->Type]->GateOrReg == CellType_Gate)
					if (Circuit->Cells[CellIndex]->Depth == -1)
					{
						all_have_depth = 0;
						DepthIndex = 0;
						for (i = 0;i < Circuit->Cells[CellIndex]->NumberOfInputs;i++)
							if (Circuit->Signals[Circuit->Cells[CellIndex]->Inputs[i]]->Depth == -1)
								break;
							else
								if (DepthIndex < Circuit->Signals[Circuit->Cells[CellIndex]->Inputs[i]]->Depth)
									DepthIndex = Circuit->Signals[Circuit->Cells[CellIndex]->Inputs[i]]->Depth;

						if (i == Circuit->Cells[CellIndex]->NumberOfInputs) // all have depth
						{
							Circuit->Cells[CellIndex]->Depth = DepthIndex + Circuit->Cells[CellIndex]->NumberOfStages;

							for (OutputIndex = 0;OutputIndex < Circuit->Cells[CellIndex]->NumberOfOutputs;OutputIndex++)
								//if (Circuit->Cells[CellIndex]->Outputs[OutputIndex] != -1)
								Circuit->Signals[Circuit->Cells[CellIndex]->Outputs[OutputIndex]]->Depth = Circuit->Cells[CellIndex]->Depth;

							if (Circuit->MaxDepth < Circuit->Cells[CellIndex]->Depth)
								Circuit->MaxDepth = Circuit->Cells[CellIndex]->Depth;

							one_got_depth = 1;
						}
					}

		/*
		if ((all_have_depth == 0) && (one_got_depth == 0))
		{
			for (CellIndex = 0;CellIndex < Circuit->NumberOfCells;CellIndex++)
				if (!Circuit->Cells[CellIndex]->Deleted)
					if (Library->CellTypes[Circuit->Cells[CellIndex]->Type]->GateOrReg == CellType_Gate)
						if (Circuit->Cells[CellIndex]->Depth == -1)
							if (strstr(Circuit->Cells[CellIndex]->Name, "_step2_ANF_inst") != NULL)
							{
								DepthIndex = 0;
								for (i = 0;i < Circuit->Cells[CellIndex]->NumberOfInputs;i++)
									if (DepthIndex < Circuit->Signals[Circuit->Cells[CellIndex]->Inputs[i]]->Depth)
										DepthIndex = Circuit->Signals[Circuit->Cells[CellIndex]->Inputs[i]]->Depth;

								Circuit->Cells[CellIndex]->Depth = DepthIndex + Circuit->Cells[CellIndex]->NumberOfStages;

								for (OutputIndex = 0;OutputIndex < Circuit->Cells[CellIndex]->NumberOfOutputs;OutputIndex++)
									Circuit->Signals[Circuit->Cells[CellIndex]->Outputs[OutputIndex]]->Depth = Circuit->Cells[CellIndex]->Depth;

								if (Circuit->MaxDepth < Circuit->Cells[CellIndex]->Depth)
									Circuit->MaxDepth = Circuit->Cells[CellIndex]->Depth;
							}
		}
		*/

	} while (!all_have_depth);

	Circuit->CellsInDepth = (int **)malloc((Circuit->MaxDepth + 1) * sizeof(int *));
	Circuit->NumberOfCellsInDepth = (int *)calloc(Circuit->MaxDepth + 1, sizeof(int));

	for (GateIndex = 0;GateIndex < Circuit->NumberOfGates;GateIndex++)
		if (!Circuit->Cells[Circuit->Gates[GateIndex]]->Deleted)
			Circuit->NumberOfCellsInDepth[Circuit->Cells[Circuit->Gates[GateIndex]]->Depth]++;

	for (DepthIndex = 0;DepthIndex <= Circuit->MaxDepth;DepthIndex++)
	{
		Circuit->CellsInDepth[DepthIndex] = (int *)malloc(Circuit->NumberOfCellsInDepth[DepthIndex] * sizeof(int));
		Circuit->NumberOfCellsInDepth[DepthIndex] = 0; // temporary to be used as index in the next loop
	}

	for (GateIndex = 0;GateIndex < Circuit->NumberOfGates;GateIndex++)
		if (!Circuit->Cells[Circuit->Gates[GateIndex]]->Deleted)
		{
			DepthIndex = Circuit->Cells[Circuit->Gates[GateIndex]]->Depth;
			Circuit->CellsInDepth[DepthIndex][Circuit->NumberOfCellsInDepth[DepthIndex]] = Circuit->Gates[GateIndex];
			Circuit->NumberOfCellsInDepth[DepthIndex]++;
		}

	for (SignalIndex = 0;SignalIndex < Circuit->NumberOfSignals;SignalIndex++)
		if (!Circuit->Signals[SignalIndex]->Deleted)
			if ((Circuit->Signals[SignalIndex]->Output != -1) && (Circuit->Signals[SignalIndex]->Depth == -1))
				break;

	if (SignalIndex < Circuit->NumberOfSignals)
	{
		printf("the depth of signal \"%s\" could not be identified\n", Circuit->Signals[SignalIndex]->Name);
		return 1;
	}

	//printf("the circuit has a depth of %d \n", Circuit->MaxDepth);

	return 0;
}

int AddSignal(CircuitStruct* Circuit, char* Name)
{
	int            SignalIndex;
	int            NewSignalIndex;
	SignalStruct** TempSignals;
	char*          Str = (char *)malloc(Max_Name_Length * sizeof(char));

	TempSignals = (SignalStruct **)malloc((Circuit->NumberOfSignals + 1) * sizeof(SignalStruct *));
	memcpy(TempSignals, Circuit->Signals, Circuit->NumberOfSignals * sizeof(SignalStruct *));
	free(Circuit->Signals);
	Circuit->Signals = TempSignals;
	NewSignalIndex = Circuit->NumberOfSignals;

	Circuit->Signals[NewSignalIndex] = (SignalStruct *)malloc(sizeof(SignalStruct));
	Circuit->Signals[NewSignalIndex]->Type = SignalType_wire;

	if (Name[0])
	{
		strcpy(Str, Name);

		do
		{
			for (SignalIndex = 0;SignalIndex < Circuit->NumberOfSignals;SignalIndex++)
				if (!strcmp(Circuit->Signals[SignalIndex]->Name, Str))
				{
					strcat(Str, "_");
					break;
				}
		} while (SignalIndex < Circuit->NumberOfSignals);
	}
	else
		sprintf(Str, "new_%s_signal_%d", ToolName, NewSignalIndex);

	Circuit->Signals[NewSignalIndex]->Name = (char *)malloc(strlen(Str) + 1);
	strcpy(Circuit->Signals[NewSignalIndex]->Name, Str);
	Circuit->Signals[NewSignalIndex]->Output = -1;
	Circuit->Signals[NewSignalIndex]->NumberOfInputs = 0;
	Circuit->Signals[NewSignalIndex]->Inputs = NULL;
	Circuit->Signals[NewSignalIndex]->FreshMask = 0;
	Circuit->Signals[NewSignalIndex]->Depth = -1;
	Circuit->Signals[NewSignalIndex]->ToBeBalanced = 1;
	Circuit->Signals[NewSignalIndex]->Attribute = (char*)calloc(1, sizeof(char));
	Circuit->Signals[NewSignalIndex]->Deleted = 0;
	Circuit->NumberOfSignals++;

	free(Str);
	return(NewSignalIndex);
}

int AddCell(LibraryStruct* Library, CircuitStruct* Circuit, char* Name, int CellType)
{
	int            CellIndex;
	int            NewCellIndex;
	CellStruct**   TempCells;
	int*		   TempGates;
	int*		   TempRegs;
	int            InputIndex;
	int            OutputIndex;
	char*          Str = (char *)malloc(Max_Name_Length * sizeof(char));

	TempCells = (CellStruct **)malloc((Circuit->NumberOfCells + 1) * sizeof(CellStruct *));
	memcpy(TempCells, Circuit->Cells, Circuit->NumberOfCells * sizeof(CellStruct *));
	free(Circuit->Cells);
	Circuit->Cells = TempCells;
	NewCellIndex = Circuit->NumberOfCells;

	Circuit->Cells[NewCellIndex] = (CellStruct *)malloc(sizeof(CellStruct));
	Circuit->Cells[NewCellIndex]->Type = CellType;
	Circuit->Cells[NewCellIndex]->NumberOfInputs = Library->CellTypes[CellType]->NumberOfInputs;
	Circuit->Cells[NewCellIndex]->Inputs = (int *)malloc(Circuit->Cells[NewCellIndex]->NumberOfInputs * sizeof(int));
	for (InputIndex = 0;InputIndex < Circuit->Cells[NewCellIndex]->NumberOfInputs;InputIndex++)
		Circuit->Cells[NewCellIndex]->Inputs[InputIndex] = -1;
	Circuit->Cells[NewCellIndex]->NumberOfOutputs = Library->CellTypes[CellType]->NumberOfOutputs;
	Circuit->Cells[NewCellIndex]->Outputs = (int *)malloc(Circuit->Cells[NewCellIndex]->NumberOfOutputs * sizeof(int));
	for (OutputIndex = 0;OutputIndex < Circuit->Cells[NewCellIndex]->NumberOfOutputs;OutputIndex++)
		Circuit->Cells[NewCellIndex]->Outputs[OutputIndex] = -1;
	Circuit->Cells[NewCellIndex]->Deleted = 0;
	Circuit->Cells[NewCellIndex]->OrigType = -1;
	Circuit->Cells[NewCellIndex]->Depth = -1;
	Circuit->Cells[NewCellIndex]->NumberOfStages = Library->CellTypes[CellType]->NumberOfStages;

	if (Name[0])
	{
		strcpy(Str, Name);

		do
		{
			for (CellIndex = 0;CellIndex < Circuit->NumberOfCells;CellIndex++)
				if (!strcmp(Circuit->Cells[CellIndex]->Name, Str))
				{
					strcat(Str, "_");
					break;
				}
		} while (CellIndex < Circuit->NumberOfCells);
	}
	else
		if (Library->CellTypes[CellType]->GateOrReg == CellType_Gate)
		{
			if (CellType == Library->RegBufferCellType)
				sprintf(Str, "new_%s_reg_buffer_%d", ToolName, NewCellIndex);
			else if (CellType == Library->BufferCellType)
				sprintf(Str, "new_%s_buffer_%d", ToolName, NewCellIndex);
			else
				sprintf(Str, "new_%s_gate_%d", ToolName, NewCellIndex);
		}
		else // CellType_Reg
			sprintf(Str, "new_%s_reg_%d", ToolName, NewCellIndex);

	Circuit->Cells[NewCellIndex]->Name = (char *)malloc(strlen(Str) + 1);
	strcpy(Circuit->Cells[NewCellIndex]->Name, Str);
	Circuit->NumberOfCells++;

	//-------

	if (Library->CellTypes[CellType]->GateOrReg == CellType_Gate)
	{
		TempGates = (int *)malloc((Circuit->NumberOfGates + 1) * sizeof(int));
		memcpy(TempGates, Circuit->Gates, Circuit->NumberOfGates * sizeof(int));
		free(Circuit->Gates);
		Circuit->Gates = TempGates;
		Circuit->Gates[Circuit->NumberOfGates] = NewCellIndex;
		Circuit->NumberOfGates++;
	}
	else // CellType_Reg
	{
		TempRegs = (int *)malloc((Circuit->NumberOfRegs + 1) * sizeof(int));
		memcpy(TempRegs, Circuit->Regs, Circuit->NumberOfRegs * sizeof(int));
		free(Circuit->Regs);
		Circuit->Regs = TempRegs;
		Circuit->Regs[Circuit->NumberOfRegs] = NewCellIndex;
		Circuit->NumberOfRegs++;
	}

	free(Str);
	return(NewCellIndex);
}

int AddCellToSignalInputList(CircuitStruct* Circuit, int SignalIndex, int CellIndex)
{
	int*	TempInt;

	TempInt = (int *)malloc((Circuit->Signals[SignalIndex]->NumberOfInputs + 1) * sizeof(int));
	memcpy(TempInt, Circuit->Signals[SignalIndex]->Inputs, Circuit->Signals[SignalIndex]->NumberOfInputs * sizeof(int));
	free(Circuit->Signals[SignalIndex]->Inputs);
	Circuit->Signals[SignalIndex]->Inputs = TempInt;
	Circuit->Signals[SignalIndex]->Inputs[Circuit->Signals[SignalIndex]->NumberOfInputs] = CellIndex;
	Circuit->Signals[SignalIndex]->NumberOfInputs++;

	return(Circuit->Signals[SignalIndex]->NumberOfInputs);
}

int AddSignalToCellInputList(CircuitStruct* Circuit, int SignalIndex, int CellIndex, int InputIndex)
{
	int*	TempInt;

	if (InputIndex < 0)
	{
		TempInt = (int *)malloc((Circuit->Cells[CellIndex]->NumberOfInputs + 1) * sizeof(int));
		memcpy(TempInt, Circuit->Cells[CellIndex]->Inputs, Circuit->Cells[CellIndex]->NumberOfInputs * sizeof(int));
		free(Circuit->Cells[CellIndex]->Inputs);
		Circuit->Cells[CellIndex]->Inputs = TempInt;
		Circuit->Cells[CellIndex]->Inputs[Circuit->Cells[CellIndex]->NumberOfInputs] = SignalIndex;
		Circuit->Cells[CellIndex]->NumberOfInputs++;
	}
	else
		Circuit->Cells[CellIndex]->Inputs[InputIndex] = SignalIndex;

	return(Circuit->Cells[CellIndex]->NumberOfInputs);
}

int AddSignalToCellOutputList(CircuitStruct* Circuit, int SignalIndex, int CellIndex, int OutputIndex = -1)
{
	int*	TempInt;

	if (OutputIndex < 0)
	{
		TempInt = (int *)malloc((Circuit->Cells[CellIndex]->NumberOfOutputs + 1) * sizeof(int));
		memcpy(TempInt, Circuit->Cells[CellIndex]->Outputs, Circuit->Cells[CellIndex]->NumberOfOutputs * sizeof(int));
		free(Circuit->Cells[CellIndex]->Outputs);
		Circuit->Cells[CellIndex]->Outputs = TempInt;
		Circuit->Cells[CellIndex]->Outputs[Circuit->Cells[CellIndex]->NumberOfOutputs] = SignalIndex;
		Circuit->Cells[CellIndex]->NumberOfOutputs++;
	}
	else
		Circuit->Cells[CellIndex]->Outputs[OutputIndex] = SignalIndex;

	return(Circuit->Cells[CellIndex]->NumberOfOutputs);
}

int AddSignalToInputs(CircuitStruct* Circuit, int SignalIndex)
{
	int*	TempInt;

	Circuit->Signals[SignalIndex]->Type = SignalType_input;

	TempInt = (int *)malloc((Circuit->NumberOfInputs + 1) * sizeof(int));
	memcpy(TempInt, Circuit->Inputs, Circuit->NumberOfInputs * sizeof(int));
	free(Circuit->Inputs);
	Circuit->Inputs = TempInt;
	Circuit->Inputs[Circuit->NumberOfInputs] = SignalIndex;
	Circuit->NumberOfInputs++;

	return(Circuit->NumberOfInputs);
}

int AddSignalToOutputs(CircuitStruct* Circuit, int SignalIndex)
{
	int*	TempInt;

	Circuit->Signals[SignalIndex]->Type = SignalType_output;

	TempInt = (int *)malloc((Circuit->NumberOfOutputs + 1) * sizeof(int));
	memcpy(TempInt, Circuit->Outputs, Circuit->NumberOfOutputs * sizeof(int));
	free(Circuit->Outputs);
	Circuit->Outputs = TempInt;
	Circuit->Outputs[Circuit->NumberOfOutputs] = SignalIndex;
	Circuit->NumberOfOutputs++;

	return(Circuit->NumberOfOutputs);
}

int RemoveCellFromSignalInputList(CircuitStruct* Circuit, int SignalIndex, int InputIndex, int CellIndex)
{
	if (InputIndex < 0)
	{
		for (InputIndex = 0;InputIndex < Circuit->Signals[SignalIndex]->NumberOfInputs;InputIndex++)
			if (Circuit->Signals[SignalIndex]->Inputs[InputIndex] == CellIndex)
				break;
	}

	if (InputIndex < Circuit->Signals[SignalIndex]->NumberOfInputs)
	{
		memcpy(&Circuit->Signals[SignalIndex]->Inputs[InputIndex], &Circuit->Signals[SignalIndex]->Inputs[InputIndex + 1], (Circuit->Signals[SignalIndex]->NumberOfInputs - InputIndex - 1) * sizeof(int));
		Circuit->Signals[SignalIndex]->NumberOfInputs--;
	}

	return(Circuit->Signals[SignalIndex]->NumberOfInputs);
}

int RemoveSignalFromInputs(CircuitStruct* Circuit, int SignalIndex)
{
	int		InputIndex;

	Circuit->Signals[SignalIndex]->Type = SignalType_wire;

	for (InputIndex = 0;InputIndex < Circuit->NumberOfInputs;InputIndex++)
		if (Circuit->Inputs[InputIndex] == SignalIndex)
			break;

	if (InputIndex < Circuit->NumberOfInputs)
		memcpy(&Circuit->Inputs[InputIndex], &Circuit->Inputs[InputIndex + 1], (Circuit->NumberOfInputs - InputIndex - 1) * sizeof(int));
	Circuit->NumberOfInputs--;

	return(Circuit->NumberOfInputs);
}

int RemoveSignalFromOutputs(CircuitStruct* Circuit, int SignalIndex)
{
	int		OutputIndex;

	Circuit->Signals[SignalIndex]->Type = SignalType_wire;

	for (OutputIndex = 0;OutputIndex < Circuit->NumberOfOutputs;OutputIndex++)
		if (Circuit->Outputs[OutputIndex] == SignalIndex)
			break;

	if (OutputIndex < Circuit->NumberOfOutputs)
		memcpy(&Circuit->Outputs[OutputIndex], &Circuit->Outputs[OutputIndex + 1], (Circuit->NumberOfOutputs - OutputIndex - 1) * sizeof(int));
	Circuit->NumberOfOutputs--;

	return(Circuit->NumberOfOutputs);
}

int RemoveUnconnectedCells(LibraryStruct* Library, CircuitStruct* Circuit, char UnconnectedInputs, char UnconnectedOutputs, char print = 1)
{
	int   CellIndex;
	int	  InputIndex;
	int	  OutputIndex;
	int	  NumberOfRemoved;
	int   NewRemoved;

	NumberOfRemoved = 0;

	do
	{
		NewRemoved = 0;
		for (CellIndex = 0;CellIndex < Circuit->NumberOfCells;CellIndex++)
			if (!Circuit->Cells[CellIndex]->Deleted)
			{
				if (UnconnectedInputs)
				{
					for (InputIndex = 0;InputIndex < Circuit->Cells[CellIndex]->NumberOfInputs;InputIndex++)
						if ((!Circuit->Signals[Circuit->Cells[CellIndex]->Inputs[InputIndex]]->Deleted) &&
							((strcmp(Circuit->Signals[Circuit->Cells[CellIndex]->Inputs[InputIndex]]->Attribute, "clock") &&
								strcmp(Circuit->Signals[Circuit->Cells[CellIndex]->Inputs[InputIndex]]->Attribute, "control")) ||
								(Library->CellTypes[Circuit->Cells[CellIndex]->Type]->GateOrReg == CellType_Gate)) &&
								((Circuit->Signals[Circuit->Cells[CellIndex]->Inputs[InputIndex]]->Output != -1) ||
							     (Circuit->Signals[Circuit->Cells[CellIndex]->Inputs[InputIndex]]->Type == SignalType_input) ||
							 	 (Circuit->Signals[Circuit->Cells[CellIndex]->Inputs[InputIndex]]->Type == SignalType_constant)))
							break;
				}
				else
					InputIndex = 0;

				if (UnconnectedOutputs)
				{
					for (OutputIndex = 0;OutputIndex < Circuit->Cells[CellIndex]->NumberOfOutputs;OutputIndex++)
						if ((Circuit->Cells[CellIndex]->Outputs[OutputIndex] != -1) &&
							(!Circuit->Signals[Circuit->Cells[CellIndex]->Outputs[OutputIndex]]->Deleted) &&
							((Circuit->Signals[Circuit->Cells[CellIndex]->Outputs[OutputIndex]]->NumberOfInputs != 0) ||
							(Circuit->Signals[Circuit->Cells[CellIndex]->Outputs[OutputIndex]]->Type == SignalType_output)))
							break;
				}
				else
					OutputIndex = 0;

				if ((InputIndex == Circuit->Cells[CellIndex]->NumberOfInputs) || // all inputs of the cell (except clock) are unconnected
					(OutputIndex == Circuit->Cells[CellIndex]->NumberOfOutputs)) // all outputs of the cell are unconnected
				{
					for (InputIndex = 0;InputIndex < Circuit->Cells[CellIndex]->NumberOfInputs;InputIndex++)
					{
						RemoveCellFromSignalInputList(Circuit, Circuit->Cells[CellIndex]->Inputs[InputIndex], -1, CellIndex);
						if ((Circuit->Signals[Circuit->Cells[CellIndex]->Inputs[InputIndex]]->NumberOfInputs == 0) &&
							(Circuit->Signals[Circuit->Cells[CellIndex]->Inputs[InputIndex]]->Output == -1))
							Circuit->Signals[Circuit->Cells[CellIndex]->Inputs[InputIndex]]->Deleted = 1;
					}

					for (OutputIndex = 0;OutputIndex < Circuit->Cells[CellIndex]->NumberOfOutputs;OutputIndex++)
						if (Circuit->Cells[CellIndex]->Outputs[OutputIndex] != -1)
						{
							Circuit->Signals[Circuit->Cells[CellIndex]->Outputs[OutputIndex]]->Output = -1;
							if (Circuit->Signals[Circuit->Cells[CellIndex]->Outputs[OutputIndex]]->NumberOfInputs == 0)
								Circuit->Signals[Circuit->Cells[CellIndex]->Outputs[OutputIndex]]->Deleted = 1;
						}

					Circuit->Cells[CellIndex]->Deleted = 1;
					NumberOfRemoved++;
					NewRemoved = 1;
				}
			}
	} while (NewRemoved);

	if (print)
		printf("%d unconnected cell(s) removed\n", NumberOfRemoved);

	return 0;
}

int RemoveUnconnectedSignals(CircuitStruct* Circuit)
{
	int   SignalIndex;

	free(Circuit->Inputs);
	Circuit->Inputs = NULL;
	Circuit->NumberOfInputs = 0;

	free(Circuit->Outputs);
	Circuit->Outputs = NULL;
	Circuit->NumberOfOutputs = 0;

	for (SignalIndex = 0;SignalIndex < Circuit->NumberOfSignals;SignalIndex++)
		if (!Circuit->Signals[SignalIndex]->Deleted)
			if ((Circuit->Signals[SignalIndex]->Output == -1) &&
				(Circuit->Signals[SignalIndex]->NumberOfInputs == 0))
				Circuit->Signals[SignalIndex]->Deleted = 1;
			else
				if (Circuit->Signals[SignalIndex]->Type == SignalType_input)
					AddSignalToInputs(Circuit, SignalIndex);
				else if (Circuit->Signals[SignalIndex]->Type == SignalType_output)
					AddSignalToOutputs(Circuit, SignalIndex);

	return 0;
}

int RemoveBuffer(int CellIndex, CircuitStruct* Circuit)
{
	int   InputSignal;
	int   TempIndex;
	int   NumberOfRerouted;
	int   OutputSignal;
	int   InputIndex;
	int	  *TempInputs;
	int   OriginCellIndex;
	int   OutputIndex;

	InputSignal = Circuit->Cells[CellIndex]->Inputs[0];
	OutputSignal = Circuit->Cells[CellIndex]->Outputs[0];
	if (((Circuit->Signals[InputSignal]->Type == SignalType_input) ||
		(Circuit->Signals[InputSignal]->Type == SignalType_output) ||
		(Circuit->Signals[InputSignal]->Type == SignalType_constant)) &
		(Circuit->Signals[OutputSignal]->Type == SignalType_output))
		return (-1);   // cannot be removed

	OriginCellIndex = Circuit->Signals[InputSignal]->Output;
	if (OriginCellIndex >= 0)
		for (OutputIndex = 0;OutputIndex < Circuit->Cells[OriginCellIndex]->NumberOfOutputs;OutputIndex++)
			if (Circuit->Cells[OriginCellIndex]->Outputs[OutputIndex] == InputSignal)
				break;

	for (InputIndex = 0;InputIndex < Circuit->Signals[InputSignal]->NumberOfInputs;InputIndex++)
		if (Circuit->Signals[InputSignal]->Inputs[InputIndex] == CellIndex)
		{
			memcpy(&Circuit->Signals[InputSignal]->Inputs[InputIndex], &Circuit->Signals[InputSignal]->Inputs[InputIndex + 1], (Circuit->Signals[InputSignal]->NumberOfInputs - InputIndex - 1) * sizeof(int));
			Circuit->Signals[InputSignal]->NumberOfInputs--;
			break;
		}

	if (Circuit->Signals[OutputSignal]->Type == SignalType_output)
	{
		TempIndex = InputSignal;
		InputSignal = OutputSignal;
		OutputSignal = TempIndex;
	}

	TempInputs = (int *)malloc((Circuit->Signals[InputSignal]->NumberOfInputs + Circuit->Signals[OutputSignal]->NumberOfInputs) * sizeof(int));
	memcpy(TempInputs, Circuit->Signals[InputSignal]->Inputs, Circuit->Signals[InputSignal]->NumberOfInputs * sizeof(int));
	free(Circuit->Signals[InputSignal]->Inputs);
	Circuit->Signals[InputSignal]->Inputs = TempInputs;
	memcpy(&Circuit->Signals[InputSignal]->Inputs[Circuit->Signals[InputSignal]->NumberOfInputs], Circuit->Signals[OutputSignal]->Inputs, Circuit->Signals[OutputSignal]->NumberOfInputs * sizeof(int));
	Circuit->Signals[InputSignal]->NumberOfInputs += Circuit->Signals[OutputSignal]->NumberOfInputs;

	NumberOfRerouted = 0;
	for (InputIndex = 0;InputIndex < Circuit->Signals[OutputSignal]->NumberOfInputs;InputIndex++)
		for (TempIndex = 0;TempIndex < Circuit->Cells[Circuit->Signals[OutputSignal]->Inputs[InputIndex]]->NumberOfInputs;TempIndex++)
			if (Circuit->Cells[Circuit->Signals[OutputSignal]->Inputs[InputIndex]]->Inputs[TempIndex] == OutputSignal)
			{
				Circuit->Cells[Circuit->Signals[OutputSignal]->Inputs[InputIndex]]->Inputs[TempIndex] = InputSignal;
				NumberOfRerouted++;
			}

	Circuit->Signals[InputSignal]->Output = OriginCellIndex;
	if (OriginCellIndex >= 0)
		Circuit->Cells[OriginCellIndex]->Outputs[OutputIndex] = InputSignal;
	free(Circuit->Signals[OutputSignal]->Inputs);
	Circuit->Cells[CellIndex]->Deleted = 1; //
	Circuit->Signals[OutputSignal]->Deleted = 1;

	return(NumberOfRerouted);
}

int RemoveAllBuffers(LibraryStruct* Library, CircuitStruct* Circuit, char print = 1)
{
	int		GateIndex;
	int		res;
	int		NumberOfRemoved;
	int		NumberOfRerouted;

	NumberOfRemoved = 0;
	NumberOfRerouted = 0;
	for (GateIndex = 0;GateIndex < Circuit->NumberOfGates;GateIndex++)
		if (!Circuit->Cells[Circuit->Gates[GateIndex]]->Deleted)
			if (Library->CellTypes[Circuit->Cells[Circuit->Gates[GateIndex]]->Type]->Type & GateType_Buffer)
			{
				res = RemoveBuffer(Circuit->Gates[GateIndex], Circuit);
				if (res != -1)
				{
					NumberOfRerouted += res;
					NumberOfRemoved++;
				}
			}

	if (print)
		printf("%d Buffer(s) removed and %d signal(s) rerouted\n", NumberOfRemoved, NumberOfRerouted);

	return 0;
}


int AddBuffer(int TargetSignalIndex, int TargetDepthIndex, LibraryStruct* Library, CircuitStruct* Circuit, char Reged, char IsOutput)
{
	int     NewCellIndex;
	int*    TempInt;
	int     NewSignalIndex;
	int     InputIndex;
	int     OutputIndex;
	int		CellIndex;
	int		NumberOfAdded = 1;
	int     TempIndex;
	char*	StrPointer;

	if (Reged)
	{
		NewCellIndex = AddCell(Library, Circuit, (char*)"", Library->RegBufferCellType);
		Circuit->Cells[NewCellIndex]->Inputs[0] = Circuit->ClockSignalIndex;
		Circuit->Cells[NewCellIndex]->Inputs[1] = TargetSignalIndex;
		Circuit->Cells[NewCellIndex]->Outputs[0] = Circuit->NumberOfSignals;
		Circuit->Cells[NewCellIndex]->Depth = Circuit->Signals[TargetSignalIndex]->Depth + Library->CellTypes[Library->RegBufferCellType]->NumberOfStages;
	}
	else
	{
		NewCellIndex = AddCell(Library, Circuit, (char*)"", Library->BufferCellType);
		Circuit->Cells[NewCellIndex]->Inputs[0] = TargetSignalIndex;
		Circuit->Cells[NewCellIndex]->Outputs[0] = Circuit->NumberOfSignals;
		Circuit->Cells[NewCellIndex]->Depth = Circuit->Signals[TargetSignalIndex]->Depth + Library->CellTypes[Library->BufferCellType]->NumberOfStages;
	}

	//---------

	TempInt = (int *)malloc((Circuit->NumberOfCellsInDepth[Circuit->Cells[NewCellIndex]->Depth] + 1) * sizeof(int));
	memcpy(TempInt, Circuit->CellsInDepth[Circuit->Cells[NewCellIndex]->Depth], Circuit->NumberOfCellsInDepth[Circuit->Cells[NewCellIndex]->Depth] * sizeof(int));
	free(Circuit->CellsInDepth[Circuit->Cells[NewCellIndex]->Depth]);
	Circuit->CellsInDepth[Circuit->Cells[NewCellIndex]->Depth] = TempInt;
	Circuit->CellsInDepth[Circuit->Cells[NewCellIndex]->Depth][Circuit->NumberOfCellsInDepth[Circuit->Cells[NewCellIndex]->Depth]] = NewCellIndex;
	Circuit->NumberOfCellsInDepth[Circuit->Cells[NewCellIndex]->Depth]++;

	//---------

	NewSignalIndex = AddSignal(Circuit, (char*)"");
	Circuit->Signals[NewSignalIndex]->Output = NewCellIndex;
	Circuit->Signals[NewSignalIndex]->Depth = Circuit->Cells[NewCellIndex]->Depth;

	for (InputIndex = 0;InputIndex < Circuit->Signals[TargetSignalIndex]->NumberOfInputs;InputIndex++)
	{
		CellIndex = Circuit->Signals[TargetSignalIndex]->Inputs[InputIndex];

		if ((Circuit->Cells[CellIndex]->Depth - Circuit->Cells[CellIndex]->NumberOfStages >= Circuit->Cells[NewCellIndex]->Depth) ||
			(Library->CellTypes[Circuit->Cells[CellIndex]->Type]->GateOrReg == CellType_Reg))
		{
			for (TempIndex = 0;TempIndex < Circuit->Cells[CellIndex]->NumberOfInputs;TempIndex++)
				if (Circuit->Cells[CellIndex]->Inputs[TempIndex] == TargetSignalIndex)
					Circuit->Cells[CellIndex]->Inputs[TempIndex] = NewSignalIndex;

			AddCellToSignalInputList(Circuit, NewSignalIndex, CellIndex);
			RemoveCellFromSignalInputList(Circuit, TargetSignalIndex, InputIndex, -1);
			InputIndex--;
		}
	}

	if (Reged)
		AddCellToSignalInputList(Circuit, Circuit->ClockSignalIndex, NewCellIndex);
	AddCellToSignalInputList(Circuit, TargetSignalIndex, NewCellIndex);

	if (IsOutput && (Circuit->Signals[TargetSignalIndex]->Type == SignalType_output))
	{
		Circuit->Signals[TargetSignalIndex]->Type = SignalType_wire;
		Circuit->Signals[NewSignalIndex]->Type = SignalType_output;

		StrPointer = Circuit->Signals[TargetSignalIndex]->Name;
		Circuit->Signals[TargetSignalIndex]->Name = Circuit->Signals[NewSignalIndex]->Name;
		Circuit->Signals[NewSignalIndex]->Name = StrPointer;

		for (OutputIndex = 0;OutputIndex < Circuit->NumberOfOutputs;OutputIndex++)
			if (Circuit->Outputs[OutputIndex] == TargetSignalIndex)
				Circuit->Outputs[OutputIndex] = NewSignalIndex;
	}

	if (Circuit->Cells[NewCellIndex]->Depth < TargetDepthIndex)
		NumberOfAdded += AddBuffer(NewSignalIndex, TargetDepthIndex, Library, Circuit, Reged, IsOutput);

	return (NumberOfAdded);
}

int ChangeRegistersClock(CircuitStruct* Circuit)
{
	int            NewSignalIndex;
	int            RegIndex;
	int            InputIndex;

	NewSignalIndex = AddSignal(Circuit, (char*)"clk_gated");

	for (RegIndex = 0;RegIndex < Circuit->NumberOfRegs;RegIndex++)
	{
		for (InputIndex = 0;InputIndex < Circuit->Signals[Circuit->ClockSignalIndex]->NumberOfInputs;InputIndex++)
		{
			if (Circuit->Signals[Circuit->ClockSignalIndex]->Inputs[InputIndex] == Circuit->Regs[RegIndex])
			{
				AddCellToSignalInputList(Circuit, NewSignalIndex, Circuit->Regs[RegIndex]);
				Circuit->Cells[Circuit->Regs[RegIndex]]->Inputs[0] = NewSignalIndex;

				RemoveCellFromSignalInputList(Circuit, Circuit->ClockSignalIndex, InputIndex, -1);
				break;
			}
		}
	}

	return (NewSignalIndex);
}

void AddShareIndexToSignalName(CircuitStruct* Circuit, int SignalIndex, char* SignalName, char d)
{
	char*	 Str1 = (char *)malloc(Max_Name_Length * sizeof(char));
	char*	 Str2 = (char *)malloc(Max_Name_Length * sizeof(char));
	uint32_t j, k;

	strcpy(Str1, SignalName);
	k = 0;
	for (j = 0;j <= strlen(SignalName);j++)
	{
		if (SignalName[j] == '[')
		{
			sprintf(Str2, "_s%d", d);
			strcpy(&Str1[k], Str2);
			k += strlen(Str2);
		}

		Str1[k] = SignalName[j];
		k++;
	}

	if (j == k) // the signal name does not have "["
		sprintf(Str1, "%s_s%d", SignalName, d);

	free(Circuit->Signals[SignalIndex]->Name);
	Circuit->Signals[SignalIndex]->Name = (char*)malloc((strlen(Str1) + 1) * sizeof(char));
	strcpy(Circuit->Signals[SignalIndex]->Name, Str1);

	free(Str1);
	free(Str2);
}


int ReplaceCelltoSCA(CircuitStruct* Circuit, LibraryStruct* Library, int CellIndex, char SecurityOrder)
{
	int		OrignalType;
	int		i;
	int		SignalIndex;
	int		NewSignalIndex;
	char*	Str = (char *)malloc(Max_Name_Length * sizeof(char));
	int*    Buffer_Int;
	char	d;
	char*   SignalName = (char *)malloc(Max_Name_Length * sizeof(char));
	char	MUX2_UnsecureSelect;

	OrignalType = Circuit->Cells[CellIndex]->Type;
	Circuit->Cells[CellIndex]->OrigType = OrignalType;

	if ((Library->CellTypes[OrignalType]->Type & GateType_Mux2) &&
		(!Circuit->Signals[Circuit->Cells[CellIndex]->Inputs[0]]->ToBeSecured))
	{
		MUX2_UnsecureSelect = 1;
		Circuit->Cells[CellIndex]->Type = Library->CellTypes[OrignalType]->SCAType2;   // select MUX2 with unsecure select signal
	}
	else
	{
		MUX2_UnsecureSelect = 0;
		Circuit->Cells[CellIndex]->Type = Library->CellTypes[OrignalType]->SCAType;
	}

	Circuit->Cells[CellIndex]->NumberOfStages = Library->CellTypes[Circuit->Cells[CellIndex]->Type]->NumberOfStages;

	//--------------------------------------------------------------------
	// turning the inputs to (SecurityOrder + 1) * inputs

	Buffer_Int = Circuit->Cells[CellIndex]->Inputs;
	Circuit->Cells[CellIndex]->Inputs = NULL;
	Circuit->Cells[CellIndex]->NumberOfInputs = 0;

	for (i = 0;i < Library->CellTypes[OrignalType]->NumberOfInputs;i++)
	{
		SignalIndex = Buffer_Int[i];
		AddSignalToCellInputList(Circuit, SignalIndex, CellIndex, -1);

		if ((SignalIndex != Circuit->ClockSignalIndex) && // && (SignalIndex != Circuit->ResetSignalIndex))
			((!MUX2_UnsecureSelect) || i))
		{
			strcpy(SignalName, Circuit->Signals[SignalIndex]->Name);
			NewSignalIndex = Circuit->Signals[SignalIndex]->NextShare;

			if ((Circuit->Signals[SignalIndex]->ToBeSecured) && (NewSignalIndex == -1) &&
				(Circuit->Signals[SignalIndex]->Type == SignalType_input))
				AddShareIndexToSignalName(Circuit, SignalIndex, SignalName, 0);

			for (d = 1;d <= SecurityOrder;d++)
			{
				if (NewSignalIndex == -1)
					if (Circuit->Signals[SignalIndex]->ToBeSecured)
					{
						NewSignalIndex = AddSignal(Circuit, (char*)"");
						Circuit->Signals[SignalIndex]->NextShare = NewSignalIndex;
						Circuit->Signals[NewSignalIndex]->NextShare = -1;
						Circuit->Signals[NewSignalIndex]->ToBeSecured = 1;

						if (Circuit->Signals[SignalIndex]->Type == SignalType_input)
						{
							AddShareIndexToSignalName(Circuit, NewSignalIndex, SignalName, d);
							AddSignalToInputs(Circuit, NewSignalIndex);
						}
						if (Circuit->Signals[SignalIndex]->Type == SignalType_output)
						{
							AddShareIndexToSignalName(Circuit, NewSignalIndex, SignalName, d);
							AddSignalToOutputs(Circuit, NewSignalIndex);
						}
					}
					else
						NewSignalIndex = 0; // constant 0

				AddSignalToCellInputList(Circuit, NewSignalIndex, CellIndex, -1);
				AddCellToSignalInputList(Circuit, NewSignalIndex, CellIndex);

				SignalIndex = NewSignalIndex;
				NewSignalIndex = Circuit->Signals[NewSignalIndex]->NextShare;
			}
		}
	}

	free(Buffer_Int);

	//--------------------------------------------------------------------
	// adding the clock signal to the signals of the cell

	if ((Library->CellTypes[Circuit->Cells[CellIndex]->Type]->NumberOfInputs > Circuit->Cells[CellIndex]->NumberOfInputs) &&
		(!strcmp(Library->CellTypes[Circuit->Cells[CellIndex]->Type]->Inputs[Circuit->Cells[CellIndex]->NumberOfInputs], "clk")))
	{
		AddSignalToCellInputList(Circuit, Circuit->ClockSignalIndex, CellIndex, -1);
		AddCellToSignalInputList(Circuit, Circuit->ClockSignalIndex, CellIndex);
	}

	//--------------------------------------------------------------------
	// turning the outputs to (SecurityOrder + 1) * inputs

	Buffer_Int = Circuit->Cells[CellIndex]->Outputs;
	Circuit->Cells[CellIndex]->Outputs = NULL;
	Circuit->Cells[CellIndex]->NumberOfOutputs = 0;

	for (i = 0;i < Library->CellTypes[OrignalType]->NumberOfOutputs;i++)
	{
		SignalIndex = Buffer_Int[i];
		AddSignalToCellOutputList(Circuit, SignalIndex, CellIndex);

		if (SignalIndex != -1)
		{
			strcpy(SignalName, Circuit->Signals[SignalIndex]->Name);
			if (Circuit->Signals[SignalIndex]->Type == SignalType_output)
				AddShareIndexToSignalName(Circuit, SignalIndex, SignalName, 0);

			NewSignalIndex = Circuit->Signals[SignalIndex]->NextShare;

			for (d = 1;d <= SecurityOrder;d++)
			{
				if (NewSignalIndex == -1)
				{
					NewSignalIndex = AddSignal(Circuit, (char*)"");
					Circuit->Signals[SignalIndex]->NextShare = NewSignalIndex;
					Circuit->Signals[NewSignalIndex]->NextShare = -1;

					if (Circuit->Signals[SignalIndex]->Type == SignalType_output)
					{
						AddShareIndexToSignalName(Circuit, NewSignalIndex, SignalName, d);
						AddSignalToOutputs(Circuit, NewSignalIndex);
					}
				}

				AddSignalToCellOutputList(Circuit, NewSignalIndex, CellIndex);
				Circuit->Signals[NewSignalIndex]->Output = CellIndex;

				SignalIndex = NewSignalIndex;
				NewSignalIndex = Circuit->Signals[NewSignalIndex]->NextShare;
			}
		}
		else
			for (d = 1;d <= SecurityOrder;d++)
				AddSignalToCellOutputList(Circuit, -1, CellIndex);
	}

	free(Buffer_Int);

	free(Str);
	free(SignalName);
	return(1);
}

void AddFreshtoSCACell(CircuitStruct* Circuit, LibraryStruct* Library, int CellIndex, char SecurityOrder, char* Scheme)
{
	int		i;
	int		NewSignalIndex;
	char*	Str = (char *)malloc(Max_Name_Length * sizeof(char));
	int*    Buffer_Int;
	int     NumberOfSharedFreshMasks;

	NumberOfSharedFreshMasks = 0;

	if (Circuit->NumberOfFreshMasks < NumberOfSharedFreshMasks)
		for (i = 0;i < NumberOfSharedFreshMasks;i++)
		{
			sprintf(Str, "Fresh[%d]", Circuit->NumberOfFreshMasks);
			NewSignalIndex = AddSignal(Circuit, Str);
			AddSignalToInputs(Circuit, NewSignalIndex);
			Circuit->Signals[NewSignalIndex]->ToBeBalanced = 0;
			Circuit->Signals[NewSignalIndex]->FreshMask = 1;

			Buffer_Int = (int*)malloc((Circuit->NumberOfFreshMasks + 1) * sizeof(int));
			memcpy(Buffer_Int, Circuit->FreshMasks, Circuit->NumberOfFreshMasks * sizeof(int));
			free(Circuit->FreshMasks);
			Circuit->FreshMasks = Buffer_Int;
			Circuit->FreshMasks[Circuit->NumberOfFreshMasks] = NewSignalIndex;
			Circuit->NumberOfFreshMasks++;
		}

	//*******************

	i = 0;
	while (Library->CellTypes[Circuit->Cells[CellIndex]->Type]->NumberOfInputs > Circuit->Cells[CellIndex]->NumberOfInputs)
	{
		if (i >= NumberOfSharedFreshMasks)
		{
			sprintf(Str, "Fresh[%d]", Circuit->NumberOfFreshMasks);
			NewSignalIndex = AddSignal(Circuit, Str);
			AddSignalToInputs(Circuit, NewSignalIndex);
			Circuit->Signals[NewSignalIndex]->ToBeBalanced = 0;
			Circuit->Signals[NewSignalIndex]->FreshMask = 1;

			Buffer_Int = (int*)malloc((Circuit->NumberOfFreshMasks + 1) * sizeof(int));
			memcpy(Buffer_Int, Circuit->FreshMasks, Circuit->NumberOfFreshMasks * sizeof(int));
			free(Circuit->FreshMasks);
			Circuit->FreshMasks = Buffer_Int;
			Circuit->FreshMasks[Circuit->NumberOfFreshMasks] = NewSignalIndex;
			Circuit->NumberOfFreshMasks++;
		}
		else
			NewSignalIndex = Circuit->FreshMasks[i];

		AddSignalToCellInputList(Circuit, NewSignalIndex, CellIndex, -1);
		AddCellToSignalInputList(Circuit, NewSignalIndex, CellIndex);
		i++;
	}

	free(Str);
}

void PropagateSecureSignals(CircuitStruct* Circuit, char print = 1)
{
	int		CellIndex;
	int		RegIndex;
	int		SignalIndex;
	short	DepthIndex;
	int		TempIndex;
	int		InputIndex;
	int		OutputIndex;
	char	NewlySecured;
	int		NumberOfSecureSignals;
	int		NumberOfSecureCells;

	// mark all signals insecure except "secure" primary inputs
	for (SignalIndex = 0;SignalIndex < Circuit->NumberOfSignals;SignalIndex++)
		if (!Circuit->Signals[SignalIndex]->Deleted)
			if ((Circuit->Signals[SignalIndex]->Type == SignalType_input) &&
				(!strcmp(Circuit->Signals[SignalIndex]->Attribute, "secure")))
				Circuit->Signals[SignalIndex]->ToBeSecured = 1;
			else
				Circuit->Signals[SignalIndex]->ToBeSecured = 0;

	// mark all gates insecure
	for (CellIndex = 0;CellIndex < Circuit->NumberOfCells;CellIndex++)
		if (!Circuit->Cells[CellIndex]->Deleted)
			Circuit->Cells[CellIndex]->ToBeSecured = 0;

	NumberOfSecureSignals = 0;
	NumberOfSecureCells = 0;

	// propagate secure signals
	do
	{
		NewlySecured = 0;

		for (DepthIndex = 1;DepthIndex <= Circuit->MaxDepth;DepthIndex++)
			for (TempIndex = 0;TempIndex < Circuit->NumberOfCellsInDepth[DepthIndex];TempIndex++)
			{
				CellIndex = Circuit->CellsInDepth[DepthIndex][TempIndex];

				for (InputIndex = 0;InputIndex < Circuit->Cells[CellIndex]->NumberOfInputs;InputIndex++)
					if (Circuit->Signals[Circuit->Cells[CellIndex]->Inputs[InputIndex]]->ToBeSecured)
						break;

				if (InputIndex < Circuit->Cells[CellIndex]->NumberOfInputs)
				{
					if (!Circuit->Cells[CellIndex]->ToBeSecured)
					{
						Circuit->Cells[CellIndex]->ToBeSecured = 1;
						NewlySecured = 1;
						NumberOfSecureCells++;
					}


					for (OutputIndex = 0;OutputIndex < Circuit->Cells[CellIndex]->NumberOfOutputs;OutputIndex++)
						if (Circuit->Cells[CellIndex]->Outputs[OutputIndex] != -1)
						{
							if (!Circuit->Signals[Circuit->Cells[CellIndex]->Outputs[OutputIndex]]->ToBeSecured)
							{
								Circuit->Signals[Circuit->Cells[CellIndex]->Outputs[OutputIndex]]->ToBeSecured = 1;
								NewlySecured = 1;
								NumberOfSecureSignals++;
							}
						}
				}
			}

		for (RegIndex = 0;RegIndex < Circuit->NumberOfRegs;RegIndex++)
		{
			CellIndex = Circuit->Regs[RegIndex];

			for (InputIndex = 0;InputIndex < Circuit->Cells[CellIndex]->NumberOfInputs;InputIndex++)
				if (Circuit->Signals[Circuit->Cells[CellIndex]->Inputs[InputIndex]]->ToBeSecured)
					break;

			if (InputIndex < Circuit->Cells[CellIndex]->NumberOfInputs)
			{
				if (!Circuit->Cells[CellIndex]->ToBeSecured)
				{
					Circuit->Cells[CellIndex]->ToBeSecured = 1;
					NewlySecured = 1;
					NumberOfSecureCells++;
				}

				for (OutputIndex = 0;OutputIndex < Circuit->Cells[CellIndex]->NumberOfOutputs;OutputIndex++)
					if (Circuit->Cells[CellIndex]->Outputs[OutputIndex] != -1)
					{
						if (!Circuit->Signals[Circuit->Cells[CellIndex]->Outputs[OutputIndex]]->ToBeSecured)
						{
							Circuit->Signals[Circuit->Cells[CellIndex]->Outputs[OutputIndex]]->ToBeSecured = 1;
							NewlySecured = 1;
							NumberOfSecureSignals++;
						}
					}
			}
		}
	} while (NewlySecured);

	if (print)
		printf("%d signal(s) and %d cell(s) are identified to be secured\n", NumberOfSecureSignals, NumberOfSecureCells);
}

void NullifyNextShares(CircuitStruct* Circuit)
{
	int		SignalIndex;

	for (SignalIndex = 0;SignalIndex < Circuit->NumberOfSignals;SignalIndex++)
		if (!Circuit->Signals[SignalIndex]->Deleted)
			if (Circuit->Signals[SignalIndex]->Type == SignalType_constant)
				Circuit->Signals[SignalIndex]->NextShare = 0; // refering to signal constant 0
			else
				Circuit->Signals[SignalIndex]->NextShare = -1;
}

void AddClockGatingController(LibraryStruct* Library, CircuitStruct* Circuit, int NewClockSignalIndex)
{
	int   CellIndex;
	int   SynchSignalIndex;

	SynchSignalIndex = AddSignal(Circuit, (char*)"Synch");
	AddSignalToOutputs(Circuit, SynchSignalIndex);

	CellIndex = AddCell(Library, Circuit, (char*)"ClockGatingInst", Library->ClockGatingCellType);
	Circuit->Cells[CellIndex]->Inputs[0] = Circuit->ClockSignalIndex;
	Circuit->Cells[CellIndex]->Inputs[1] = Circuit->ResetSignalIndex;
	Circuit->Cells[CellIndex]->Outputs[0] = NewClockSignalIndex;
	Circuit->Cells[CellIndex]->Outputs[1] = SynchSignalIndex;

	Circuit->Signals[NewClockSignalIndex]->Output = CellIndex;
	Circuit->Signals[SynchSignalIndex]->Output = CellIndex;

	AddCellToSignalInputList(Circuit, Circuit->ClockSignalIndex, CellIndex);
	AddCellToSignalInputList(Circuit, Circuit->ResetSignalIndex, CellIndex);
}


int ApplyMasking(LibraryStruct* Library, CircuitStruct* Circuit, char SecurityOrder, char* Scheme, char MakePipeline)
{
	int		GateIndex;
	int		CellIndex;
	int		NumberOfReplacedCells;
	int		NumberOfAdded;
	int		res;
	short	DepthIndex;
	int		TempIndex;
	int		InputIndex;
	int		OutputIndex;
	int		RegIndex;
	int		NewClockSignal;

	res = RemoveUnconnectedCells(Library, Circuit, 1, 1);

	if (!res)
		res = MakeCircuitDepth(Library, Circuit);

	if (!res)
	{
		printf("the circuit has a logic depth of %d\n", Circuit->MaxDepth);

		if (Library->BufferCellType < 0)
		{
			printf("Buffer cell not defined\n");
			res = 1;
		}
	}

	if (!res)
	{
		res = RemoveAllBuffers(Library, Circuit);

		if (!res)
			res = MakeCircuitDepth(Library, Circuit);

		if (!res)
		{
			printf("the circuit has a logic depth of %d\n", Circuit->MaxDepth);

			if (Circuit->ClockSignalIndex < 0)
			{
				Circuit->ClockSignalIndex = AddSignal(Circuit, (char*)"clk");
				AddSignalToInputs(Circuit, Circuit->ClockSignalIndex);
				Circuit->Signals[Circuit->ClockSignalIndex]->ToBeBalanced = 0;
				free(Circuit->Signals[Circuit->ClockSignalIndex]->Attribute);
				Circuit->Signals[Circuit->ClockSignalIndex]->Attribute = (char*)malloc((strlen("clock") + 1) * sizeof(char));
				strcpy(Circuit->Signals[Circuit->ClockSignalIndex]->Attribute, "clock");

				printf("Clock signal not found. \"clk\" added to the design.\n");
			}
		}

		if (!res)
		{
			// propagape secure signals into the circuit
			PropagateSecureSignals(Circuit);

			// set NextShare of all signals to -1 except constants
			NullifyNextShares(Circuit);

			// replace the cells with their SCA-resistant variant
			NumberOfReplacedCells = 0;
			for (DepthIndex = 1;DepthIndex <= Circuit->MaxDepth;DepthIndex++)
				for (TempIndex = 0;TempIndex < Circuit->NumberOfCellsInDepth[DepthIndex];TempIndex++)
				{
					CellIndex = Circuit->CellsInDepth[DepthIndex][TempIndex];

					if (Circuit->Cells[CellIndex]->ToBeSecured)
						if (Library->CellTypes[Circuit->Cells[CellIndex]->Type]->SCAType >= 0)
							NumberOfReplacedCells += ReplaceCelltoSCA(Circuit, Library, CellIndex, SecurityOrder);
						else
						{
							printf("cell \"%s\" should be secured, but no SCA-resistant cell type is defined for \"%s\"\n", Circuit->Cells[CellIndex]->Name, Library->CellTypes[Circuit->Cells[CellIndex]->Type]->Cases[0]);
							return(1);
						}
				}

			printf("%d cell(s) are replaced with the SCA-resistant variant\n", NumberOfReplacedCells);


			// replace the regs with their SCA-resistant variant
			NumberOfReplacedCells = 0;
			for (RegIndex = 0;RegIndex < Circuit->NumberOfRegs;RegIndex++)
			{
				CellIndex = Circuit->Regs[RegIndex];

				if (Circuit->Cells[CellIndex]->ToBeSecured)
					if (Library->CellTypes[Circuit->Cells[CellIndex]->Type]->SCAType >= 0)
						NumberOfReplacedCells += ReplaceCelltoSCA(Circuit, Library, CellIndex, SecurityOrder);
					else
					{
						printf("cell \"%s\" should be secured, but no SCA-resistant cell type is defined for \"%s\"\n", Circuit->Cells[CellIndex]->Name, Library->CellTypes[Circuit->Cells[CellIndex]->Type]->Cases[0]);
						return(1);
					}
			}

			printf("%d register(s) are replaced with the SCA-resistant variant\n", NumberOfReplacedCells);

			// change the depth (number of stages) of every celltype in library
			for (CellIndex = 0;CellIndex < Circuit->NumberOfCells;CellIndex++)
				if (!Circuit->Cells[CellIndex]->Deleted)
					if (!(Library->CellTypes[Circuit->Cells[CellIndex]->Type]->Type & GateType_SCA))
						Circuit->Cells[CellIndex]->NumberOfStages = 0;

			res = MakeCircuitDepth(Library, Circuit);
		}

		if (!res)
		{
			printf("the circuit has %d register stages\n", Circuit->MaxDepth + (Circuit->NumberOfRegs ? 1 : 0));

			// add fresh masks to SCA-resistant cells
			for (DepthIndex = 0;DepthIndex <= Circuit->MaxDepth;DepthIndex++)
				for (TempIndex = 0;TempIndex < Circuit->NumberOfCellsInDepth[DepthIndex];TempIndex++)
				{
					CellIndex = Circuit->CellsInDepth[DepthIndex][TempIndex];

					if (Circuit->Cells[CellIndex]->ToBeSecured)
						AddFreshtoSCACell(Circuit, Library, CellIndex, SecurityOrder, Scheme);
				}

			printf("%d fresh mask(s) are added to the design\n", Circuit->NumberOfFreshMasks);


			if (MakePipeline)
			{
				if (Library->RegBufferCellType == -1)
				{
					printf("RegBuffer cell type not defined in the library\n");
					return(1);
				}

				// find out the maximum depth of the primary outputs
				DepthIndex = 0;
				for (OutputIndex = 0;OutputIndex < Circuit->NumberOfOutputs;OutputIndex++)
					if (!Circuit->Signals[Circuit->Outputs[OutputIndex]]->Deleted)
						if (DepthIndex < Circuit->Signals[Circuit->Outputs[OutputIndex]]->Depth)
							DepthIndex = Circuit->Signals[Circuit->Outputs[OutputIndex]]->Depth;

				// make the depth of all primary outputs the same by adding RegBuffers
				NumberOfAdded = 0;
				for (OutputIndex = 0;OutputIndex < Circuit->NumberOfOutputs;OutputIndex++)
					if (!Circuit->Signals[Circuit->Outputs[OutputIndex]]->Deleted)
						if (Circuit->Signals[Circuit->Outputs[OutputIndex]]->Depth < DepthIndex)
							NumberOfAdded += AddBuffer(Circuit->Outputs[OutputIndex], DepthIndex, Library, Circuit, 1, 1);

				printf("%d RegBuffer(s) are added to balance the depth of primary outputs\n", NumberOfAdded);
				res = MakeCircuitDepth(Library, Circuit);

				// make the depth of all inputs of each cell the same by adding RegBuffers
				NumberOfAdded = 0;
				for (DepthIndex = 1;DepthIndex <= Circuit->MaxDepth;DepthIndex++)
					for (TempIndex = 0;TempIndex < Circuit->NumberOfCellsInDepth[DepthIndex];TempIndex++)
					{
						CellIndex = Circuit->CellsInDepth[DepthIndex][TempIndex];
						for (InputIndex = 0;InputIndex < Circuit->Cells[CellIndex]->NumberOfInputs;InputIndex++)
							if ((Circuit->Signals[Circuit->Cells[CellIndex]->Inputs[InputIndex]]->Depth < (DepthIndex - Circuit->Cells[CellIndex]->NumberOfStages)) &&
								Circuit->Signals[Circuit->Cells[CellIndex]->Inputs[InputIndex]]->ToBeBalanced) // && (Circuit->Signals[Circuit->Cells[CellIndex]->Inputs[InputIndex]]->Type != SignalType_constant))
								NumberOfAdded += AddBuffer(Circuit->Cells[CellIndex]->Inputs[InputIndex], DepthIndex - Circuit->Cells[CellIndex]->NumberOfStages, Library, Circuit, 1, 0);
					}

				printf("%d RegBuffer(s) are added to balance the depth of inputs of all gates\n", NumberOfAdded);
				res = MakeCircuitDepth(Library, Circuit);

				if (!res)
				{
					printf("the circuit has %d register stages\n", Circuit->MaxDepth + (Circuit->NumberOfRegs ? 1 : 0));

					// make the depth of all inputs of each register the same by adding RegBuffers
					NumberOfAdded = 0;
					for (RegIndex = 0;RegIndex < Circuit->NumberOfRegs;RegIndex++)
						if (!Circuit->Cells[Circuit->Regs[RegIndex]]->Deleted)
							for (InputIndex = 0;InputIndex < Circuit->Cells[Circuit->Regs[RegIndex]]->NumberOfInputs;InputIndex++)
								if ((Circuit->Signals[Circuit->Cells[Circuit->Regs[RegIndex]]->Inputs[InputIndex]]->Depth < Circuit->MaxDepth) &&
									Circuit->Signals[Circuit->Cells[Circuit->Regs[RegIndex]]->Inputs[InputIndex]]->ToBeBalanced)
									NumberOfAdded += AddBuffer(Circuit->Cells[Circuit->Regs[RegIndex]]->Inputs[InputIndex], Circuit->MaxDepth, Library, Circuit, 1, 0);

					printf("%d RegBuffer(s) are added to balance the depth of inputs of all registers\n", NumberOfAdded);
					res = MakeCircuitDepth(Library, Circuit);
				}

				if (!res)
				{
					printf("the circuit has %d register stages\n", Circuit->MaxDepth + (Circuit->NumberOfRegs ? 1 : 0));

					// checking the balancedness of inputs of gates
					for (GateIndex = 0;GateIndex < Circuit->NumberOfGates;GateIndex++)
					{
						CellIndex = Circuit->Gates[GateIndex];
						if (!Circuit->Cells[CellIndex]->Deleted)
						{
							DepthIndex = -1;

							for (InputIndex = 0;InputIndex < Circuit->Cells[CellIndex]->NumberOfInputs;InputIndex++)
								if (Circuit->Signals[Circuit->Cells[CellIndex]->Inputs[InputIndex]]->ToBeBalanced)
								{
									if (DepthIndex != Circuit->Signals[Circuit->Cells[CellIndex]->Inputs[InputIndex]]->Depth)
										if (DepthIndex != -1)
										{
											printf("Error, the depth of signal %s does not match to that of other signal %s as the input of the cell %s\n",
												Circuit->Signals[Circuit->Cells[CellIndex]->Inputs[InputIndex]]->Name,
												Circuit->Signals[Circuit->Cells[CellIndex]->Inputs[0]]->Name,
												Circuit->Cells[CellIndex]->Name);
											res = 1;
										}
										else
											DepthIndex = Circuit->Signals[Circuit->Cells[CellIndex]->Inputs[InputIndex]]->Depth;

									if ((Circuit->Signals[Circuit->Cells[CellIndex]->Inputs[InputIndex]]->Output != -1) &&
										(DepthIndex != Circuit->Cells[Circuit->Signals[Circuit->Cells[CellIndex]->Inputs[InputIndex]]->Output]->Depth))
									{
										printf("Error, the depth of signal %s does not match to that of its driving cell %s\n",
											Circuit->Signals[Circuit->Cells[CellIndex]->Inputs[InputIndex]]->Name,
											Circuit->Cells[Circuit->Signals[Circuit->Cells[CellIndex]->Inputs[InputIndex]]->Output]->Name);
										res = 1;
									}
								}
						}
					}

					if (res)
						return(res);
					else
						printf("inputs of each gate are balanced\n");

					// checking the balancedness of inputs of regs
					for (RegIndex = 0;RegIndex < Circuit->NumberOfRegs;RegIndex++)
						for (InputIndex = 0;InputIndex < Circuit->Cells[Circuit->Regs[RegIndex]]->NumberOfInputs;InputIndex++)
							if (Circuit->Signals[Circuit->Cells[Circuit->Regs[RegIndex]]->Inputs[InputIndex]]->ToBeBalanced)
							{
								if (Circuit->Signals[Circuit->Cells[Circuit->Regs[RegIndex]]->Inputs[InputIndex]]->Depth != Circuit->MaxDepth)
								{
									printf("Error, the depth of signal %s as the input to the reg %s is not maximum\n",
										Circuit->Signals[Circuit->Cells[Circuit->Regs[RegIndex]]->Inputs[InputIndex]]->Name,
										Circuit->Cells[Circuit->Regs[RegIndex]]->Name);
									res = 1;
								}

								if ((Circuit->Signals[Circuit->Cells[Circuit->Regs[RegIndex]]->Inputs[InputIndex]]->Output >= 0) &&
									(Circuit->MaxDepth != Circuit->Cells[Circuit->Signals[Circuit->Cells[Circuit->Regs[RegIndex]]->Inputs[InputIndex]]->Output]->Depth))
								{
									printf("Error, the depth of signal %s does not match to that of its driving cell %s\n",
										Circuit->Signals[Circuit->Cells[Circuit->Regs[RegIndex]]->Inputs[InputIndex]]->Name,
										Circuit->Cells[Circuit->Signals[Circuit->Cells[Circuit->Regs[RegIndex]]->Inputs[InputIndex]]->Output]->Name);
									res = 1;
								}
							}

					if (res)
						return(res);
					else
						printf("inputs of each register are balanced\n");
				}
			}
			else //  MakePipeline == 0
			{
				if (Library->ClockGatingCellType == -1)
				{
					printf("ClockGating celltype not defined in the library\n");
					res = 1;
				}
				else if (Circuit->ResetSignalIndex == -1)
				{
					Circuit->ResetSignalIndex = AddSignal(Circuit, (char*)"rst");
					AddSignalToInputs(Circuit, Circuit->ResetSignalIndex);
					Circuit->Signals[Circuit->ResetSignalIndex]->ToBeBalanced = 0;
					free(Circuit->Signals[Circuit->ResetSignalIndex]->Attribute);
					Circuit->Signals[Circuit->ResetSignalIndex]->Attribute = (char*)malloc((strlen("reset") + 1) * sizeof(char));
					strcpy(Circuit->Signals[Circuit->ResetSignalIndex]->Attribute, "reset");

					printf("Reset signal not found. \"rst\" added to the design.");
				}

				if (!res)
				{
					NewClockSignal = ChangeRegistersClock(Circuit);
					AddClockGatingController(Library, Circuit, NewClockSignal);
					printf("clock signal of registers changed and a clock-gated circuity in %d steps is added\n", Circuit->MaxDepth + (Circuit->NumberOfRegs ? 1 : 0));

					res = MakeCircuitDepth(Library, Circuit);
				}
			}
		}
	}

	return res;
}

int ExtractSecureCombinatorial(LibraryStruct* Library, CircuitStruct* Circuit, CircuitStruct* SecureCombCircuit, char* Method)
{
	int		DepthIndex;
	int		TempIndex;
	int		CellIndex;
	int		CellIndex2;
	int		SignalIndex;
	int		res;
	int		InputIndex;
	int		InputIndex2;
	int		InputIndex3;
	int		OutputIndex;
	int		GateIndex;
	int		RegIndex;
	int		NumberOfGates;
	int		PrimaryInput;
	int		SignalIndex1;
	int		SignalIndex2;
	char	AtLeastOneFound;
	char    AtLeastOneSecure;

	res = RemoveUnconnectedCells(Library, Circuit, 1, 1);

	if (!res)
		res = RemoveUnconnectedCells(Library, SecureCombCircuit, 1, 1, 0);

	if (!res)
		res = MakeCircuitDepth(Library, Circuit);

	if (!res)
		res = MakeCircuitDepth(Library, SecureCombCircuit);

	if (!res)
	{
		printf("the circuit has a logic depth of %d\n", Circuit->MaxDepth);

		if (Library->BufferCellType < 0)
		{
			printf("Buffer cell not defined\n");
			res = 1;
		}
	}

	if (!res)
		res = RemoveAllBuffers(Library, Circuit);

	if (!res)
		res = RemoveAllBuffers(Library, SecureCombCircuit, 0);

	if (!res)
		res = MakeCircuitDepth(Library, Circuit);

	if (!res)
		res = MakeCircuitDepth(Library, SecureCombCircuit);

	if (!res)
	{
		printf("the circuit has a logic depth of %d\n", Circuit->MaxDepth);

		// propagape secure signals into the circuit
		PropagateSecureSignals(Circuit);
		PropagateSecureSignals(SecureCombCircuit, 0);

		for (RegIndex = SecureCombCircuit->NumberOfRegs - 1;RegIndex >= 0;RegIndex--)
		{
			CellIndex = SecureCombCircuit->Regs[RegIndex];
			if (!SecureCombCircuit->Cells[CellIndex]->Deleted)
			{
				for (OutputIndex = 0;OutputIndex < SecureCombCircuit->Cells[CellIndex]->NumberOfOutputs;OutputIndex++)
				{
					SignalIndex = SecureCombCircuit->Cells[CellIndex]->Outputs[OutputIndex];
					if ((SignalIndex != -1) &&
						(!SecureCombCircuit->Signals[SignalIndex]->Deleted))
					{
						SecureCombCircuit->Signals[SignalIndex]->Output = -1;
						SecureCombCircuit->Cells[CellIndex]->Outputs[OutputIndex] = -1;

						if (SecureCombCircuit->Signals[SignalIndex]->Type == SignalType_output)
							RemoveSignalFromOutputs(SecureCombCircuit, SignalIndex);

						if (SecureCombCircuit->Signals[SignalIndex]->NumberOfInputs)
						{
							if (SecureCombCircuit->Signals[SignalIndex]->Type != SignalType_input)
								AddSignalToInputs(SecureCombCircuit, SignalIndex);
						}
						else
							SecureCombCircuit->Signals[SignalIndex]->Deleted = 1;
					}
				}

				for (InputIndex = 0;InputIndex < SecureCombCircuit->Cells[CellIndex]->NumberOfInputs;InputIndex++)
				{
					SignalIndex = SecureCombCircuit->Cells[CellIndex]->Inputs[InputIndex];
					if ((SecureCombCircuit->Signals[SignalIndex]->Output != -1) &&
						(SignalIndex != SecureCombCircuit->ClockSignalIndex) &&
						(SignalIndex != SecureCombCircuit->ResetSignalIndex))
						if (SecureCombCircuit->Signals[SignalIndex]->Type != SignalType_output)
							AddSignalToOutputs(SecureCombCircuit, SignalIndex);

					RemoveCellFromSignalInputList(SecureCombCircuit, SignalIndex, -1, CellIndex);
				}

				SecureCombCircuit->Cells[CellIndex]->Deleted = 1;
				SecureCombCircuit->NumberOfRegs--;
			}
		}

		do
		{
			AtLeastOneFound = 0;

			// finding the MUXes and XORs at the start and end of the secure zone
			for (CellIndex = 0;CellIndex < SecureCombCircuit->NumberOfCells;CellIndex++)
			{
				//finding MUXes

				if ((!SecureCombCircuit->Cells[CellIndex]->Deleted) &&
					(Library->CellTypes[SecureCombCircuit->Cells[CellIndex]->Type]->Type & GateType_Mux2) &&
					(SecureCombCircuit->Cells[CellIndex]->ToBeSecured) &&
					(!SecureCombCircuit->Signals[Circuit->Cells[CellIndex]->Inputs[0]]->ToBeSecured))
				{
					SignalIndex1 = Circuit->Cells[CellIndex]->Inputs[1];
					SignalIndex2 = Circuit->Cells[CellIndex]->Inputs[2];

					if (((SecureCombCircuit->Signals[SignalIndex1]->Depth == 0) ||
						(!SecureCombCircuit->Cells[SecureCombCircuit->Signals[SignalIndex1]->Output]->ToBeSecured)) &&
						((SecureCombCircuit->Signals[SignalIndex2]->Depth == 0) ||
						(!SecureCombCircuit->Cells[SecureCombCircuit->Signals[SignalIndex2]->Output]->ToBeSecured)))
					{
						SecureCombCircuit->Cells[CellIndex]->ToBeSecured = 0;
						Circuit->Cells[CellIndex]->ToBeSecured = 0;
						AtLeastOneFound = 1;
					}
					else
					{
						for (OutputIndex = 0;OutputIndex < SecureCombCircuit->Cells[CellIndex]->NumberOfOutputs;OutputIndex++)
						{
							SignalIndex = SecureCombCircuit->Cells[CellIndex]->Outputs[OutputIndex];
							if (SignalIndex != -1)
							{
								for (InputIndex = 0;InputIndex < SecureCombCircuit->Signals[SignalIndex]->NumberOfInputs;InputIndex++)
									if ((Library->CellTypes[SecureCombCircuit->Cells[SecureCombCircuit->Signals[SignalIndex]->Inputs[InputIndex]]->Type]->GateOrReg != CellType_Reg) &&
										(SecureCombCircuit->Cells[SecureCombCircuit->Signals[SignalIndex]->Inputs[InputIndex]]->ToBeSecured))
										break;

								if (InputIndex < SecureCombCircuit->Signals[SignalIndex]->NumberOfInputs)
									break;
							}
						}

						if (OutputIndex == SecureCombCircuit->Cells[CellIndex]->NumberOfOutputs)
						{
							SecureCombCircuit->Cells[CellIndex]->ToBeSecured = 0;
							Circuit->Cells[CellIndex]->ToBeSecured = 0;
							AtLeastOneFound = 1;
						}
					}
				}

				//finding XORs

				if ((!SecureCombCircuit->Cells[CellIndex]->Deleted) &&
					(Library->CellTypes[SecureCombCircuit->Cells[CellIndex]->Type]->Type & GateType_XOR) &&
					(SecureCombCircuit->Cells[CellIndex]->ToBeSecured))
				{
					SignalIndex1 = Circuit->Cells[CellIndex]->Inputs[0];
					SignalIndex2 = Circuit->Cells[CellIndex]->Inputs[1];

					if (((SecureCombCircuit->Signals[SignalIndex1]->Depth == 0) ||
						(!SecureCombCircuit->Cells[SecureCombCircuit->Signals[SignalIndex1]->Output]->ToBeSecured)) &&
						((SecureCombCircuit->Signals[SignalIndex2]->Depth == 0) ||
						(!SecureCombCircuit->Cells[SecureCombCircuit->Signals[SignalIndex2]->Output]->ToBeSecured)))
					{
						SecureCombCircuit->Cells[CellIndex]->ToBeSecured = 0;
						Circuit->Cells[CellIndex]->ToBeSecured = 0;
						AtLeastOneFound = 1;
					}
					else
					{
						for (OutputIndex = 0;OutputIndex < SecureCombCircuit->Cells[CellIndex]->NumberOfOutputs;OutputIndex++)
						{
							SignalIndex = SecureCombCircuit->Cells[CellIndex]->Outputs[OutputIndex];
							if (SignalIndex != -1)
							{
								for (InputIndex = 0;InputIndex < SecureCombCircuit->Signals[SignalIndex]->NumberOfInputs;InputIndex++)
									if ((Library->CellTypes[SecureCombCircuit->Cells[SecureCombCircuit->Signals[SignalIndex]->Inputs[InputIndex]]->Type]->GateOrReg != CellType_Reg) &&
										(SecureCombCircuit->Cells[SecureCombCircuit->Signals[SignalIndex]->Inputs[InputIndex]]->ToBeSecured))
										break;

								if (InputIndex < SecureCombCircuit->Signals[SignalIndex]->NumberOfInputs)
									break;
							}
						}

						if (OutputIndex == SecureCombCircuit->Cells[CellIndex]->NumberOfOutputs)
						{
							SecureCombCircuit->Cells[CellIndex]->ToBeSecured = 0;
							Circuit->Cells[CellIndex]->ToBeSecured = 0;
							AtLeastOneFound = 1;
						}
					}
				}
			}
		} while (AtLeastOneFound);

		// turning back some XORs to secure zone

		do
		{
			AtLeastOneFound = 0;

			for (CellIndex = 0;CellIndex < SecureCombCircuit->NumberOfCells;CellIndex++)
			{
				if ((!SecureCombCircuit->Cells[CellIndex]->Deleted) &&
					(!SecureCombCircuit->Cells[CellIndex]->ToBeSecured) &&
					(Library->CellTypes[SecureCombCircuit->Cells[CellIndex]->Type]->Type & GateType_XOR))
				{
					for (InputIndex = 0;InputIndex < SecureCombCircuit->Cells[CellIndex]->NumberOfInputs;InputIndex++)
					{
						SignalIndex = SecureCombCircuit->Cells[CellIndex]->Inputs[InputIndex];

						for (InputIndex2 = 0;InputIndex2 < SecureCombCircuit->Signals[SignalIndex]->NumberOfInputs;InputIndex2++)
							if (SecureCombCircuit->Cells[SecureCombCircuit->Signals[SignalIndex]->Inputs[InputIndex2]]->ToBeSecured)
								break;

						if (InputIndex2 < SecureCombCircuit->Signals[SignalIndex]->NumberOfInputs)
							break;
					}

					if (InputIndex < SecureCombCircuit->Cells[CellIndex]->NumberOfInputs)
					{
						for (OutputIndex = 0;OutputIndex < SecureCombCircuit->Cells[CellIndex]->NumberOfOutputs;OutputIndex++)
						{
							SignalIndex = SecureCombCircuit->Cells[CellIndex]->Outputs[OutputIndex];
							for (InputIndex2 = 0;InputIndex2 < SecureCombCircuit->Signals[SignalIndex]->NumberOfInputs;InputIndex2++)
								if (SecureCombCircuit->Cells[SecureCombCircuit->Signals[SignalIndex]->Inputs[InputIndex2]]->ToBeSecured)
									break;

							if (InputIndex2 < SecureCombCircuit->Signals[SignalIndex]->NumberOfInputs)
								break;
						}

						if (OutputIndex < SecureCombCircuit->Cells[CellIndex]->NumberOfOutputs)
						{
							SecureCombCircuit->Cells[CellIndex]->ToBeSecured = 1;
							Circuit->Cells[CellIndex]->ToBeSecured = 1;
							AtLeastOneFound = 1;
						}
					}

					if (!SecureCombCircuit->Cells[CellIndex]->ToBeSecured)
					{
						AtLeastOneSecure = 0;
						for (InputIndex = 0;InputIndex < SecureCombCircuit->Cells[CellIndex]->NumberOfInputs;InputIndex++)
						{
							SignalIndex = SecureCombCircuit->Cells[CellIndex]->Inputs[InputIndex];
							if (SecureCombCircuit->Signals[SignalIndex]->Output != -1)
								if (SecureCombCircuit->Cells[SecureCombCircuit->Signals[SignalIndex]->Output]->ToBeSecured)
									AtLeastOneSecure = 1;
								else
									break;
						}

						if ((InputIndex == SecureCombCircuit->Cells[CellIndex]->NumberOfInputs) &&
							(AtLeastOneSecure))
						{
							SecureCombCircuit->Cells[CellIndex]->ToBeSecured = 1;
							Circuit->Cells[CellIndex]->ToBeSecured = 1;
							AtLeastOneFound = 1;
						}

					}

				}
			}
		} while (AtLeastOneFound);

		// turning again back some XORs to normal zone

		do
		{
			AtLeastOneFound = 0;

			for (CellIndex = 0;CellIndex < SecureCombCircuit->NumberOfCells;CellIndex++)
			{
				if ((!SecureCombCircuit->Cells[CellIndex]->Deleted) &&
					(SecureCombCircuit->Cells[CellIndex]->ToBeSecured) &&
					(Library->CellTypes[SecureCombCircuit->Cells[CellIndex]->Type]->Type & GateType_XOR))
				{
					for (InputIndex = 0;InputIndex < SecureCombCircuit->Cells[CellIndex]->NumberOfInputs;InputIndex++)
					{
						SignalIndex = SecureCombCircuit->Cells[CellIndex]->Inputs[InputIndex];
						if ((SecureCombCircuit->Signals[SignalIndex]->Output != -1) &&
							(SecureCombCircuit->Cells[SecureCombCircuit->Signals[SignalIndex]->Output]->ToBeSecured))
							break;
					}

					if (InputIndex == SecureCombCircuit->Cells[CellIndex]->NumberOfInputs)
					{
						for (InputIndex = 0;InputIndex < SecureCombCircuit->Cells[CellIndex]->NumberOfInputs;InputIndex++)
						{
							SignalIndex = SecureCombCircuit->Cells[CellIndex]->Inputs[InputIndex];
							if (SecureCombCircuit->Signals[SignalIndex]->NumberOfInputs == 1)
								break;
						}

						if (InputIndex < SecureCombCircuit->Cells[CellIndex]->NumberOfInputs)
						{
							SecureCombCircuit->Cells[CellIndex]->ToBeSecured = 0;
							Circuit->Cells[CellIndex]->ToBeSecured = 0;
							AtLeastOneFound = 1;
						}
					}

					if (SecureCombCircuit->Cells[CellIndex]->ToBeSecured)
					{
						for (OutputIndex = 0;OutputIndex < SecureCombCircuit->Cells[CellIndex]->NumberOfOutputs;OutputIndex++)
						{
							SignalIndex = SecureCombCircuit->Cells[CellIndex]->Outputs[OutputIndex];
							for (InputIndex2 = 0;InputIndex2 < SecureCombCircuit->Signals[SignalIndex]->NumberOfInputs;InputIndex2++)
								if (SecureCombCircuit->Cells[SecureCombCircuit->Signals[SignalIndex]->Inputs[InputIndex2]]->ToBeSecured)
									break;

							if (InputIndex2 < SecureCombCircuit->Signals[SignalIndex]->NumberOfInputs)
								break;
						}

						if (OutputIndex == SecureCombCircuit->Cells[CellIndex]->NumberOfOutputs)
						{
							for (InputIndex = 0;InputIndex < SecureCombCircuit->Cells[CellIndex]->NumberOfInputs;InputIndex++)
							{
								SignalIndex = SecureCombCircuit->Cells[CellIndex]->Inputs[InputIndex];
								for (InputIndex2 = 0;InputIndex2 < SecureCombCircuit->Signals[SignalIndex]->NumberOfInputs;InputIndex2++)
									if (!SecureCombCircuit->Cells[SecureCombCircuit->Signals[SignalIndex]->Inputs[InputIndex2]]->ToBeSecured)
										break;

								if (InputIndex2 < SecureCombCircuit->Signals[SignalIndex]->NumberOfInputs)
									break;
							}

							if (InputIndex < SecureCombCircuit->Cells[CellIndex]->NumberOfInputs)
							{
								SecureCombCircuit->Cells[CellIndex]->ToBeSecured = 0;
								Circuit->Cells[CellIndex]->ToBeSecured = 0;
								AtLeastOneFound = 1;
							}
						}
					}
				}

			}
		} while (AtLeastOneFound);


		for (DepthIndex = 0;DepthIndex <= SecureCombCircuit->MaxDepth;DepthIndex++)
			for (TempIndex = 0;TempIndex < SecureCombCircuit->NumberOfCellsInDepth[DepthIndex];TempIndex++)
			{
				CellIndex = SecureCombCircuit->CellsInDepth[DepthIndex][TempIndex];

				if ((!SecureCombCircuit->Cells[CellIndex]->Deleted) &&
					(!SecureCombCircuit->Cells[CellIndex]->ToBeSecured))
				{
					for (InputIndex = 0;InputIndex < SecureCombCircuit->Cells[CellIndex]->NumberOfInputs;InputIndex++)
					{
						SignalIndex = SecureCombCircuit->Cells[CellIndex]->Inputs[InputIndex];
						RemoveCellFromSignalInputList(SecureCombCircuit, SignalIndex, -1, CellIndex);

						if (SecureCombCircuit->Signals[SignalIndex]->Output == -1)
						{
							if (SecureCombCircuit->Signals[SignalIndex]->NumberOfInputs == 0)
							{
								if (SecureCombCircuit->Signals[SignalIndex]->Type == SignalType_input)
									RemoveSignalFromInputs(SecureCombCircuit, SignalIndex);

								if (SecureCombCircuit->Signals[SignalIndex]->Type == SignalType_output)
									RemoveSignalFromOutputs(SecureCombCircuit, SignalIndex);

								SecureCombCircuit->Signals[SignalIndex]->Deleted = 1;
							}
						}
						else
						{
							if ((SecureCombCircuit->Signals[SignalIndex]->ToBeSecured) &&
								(SecureCombCircuit->Signals[SignalIndex]->Type != SignalType_output))
								AddSignalToOutputs(SecureCombCircuit, SignalIndex);
						}
					}

					for (OutputIndex = 0;OutputIndex < SecureCombCircuit->Cells[CellIndex]->NumberOfOutputs;OutputIndex++)
					{
						SignalIndex = SecureCombCircuit->Cells[CellIndex]->Outputs[OutputIndex];
						if (SignalIndex != -1)
						{
							SecureCombCircuit->Cells[CellIndex]->Outputs[OutputIndex] = -1;
							SecureCombCircuit->Signals[SignalIndex]->Output = -1;

							if (SecureCombCircuit->Signals[SignalIndex]->NumberOfInputs == 0)
							{
								if (SecureCombCircuit->Signals[SignalIndex]->Type == SignalType_input)
									RemoveSignalFromInputs(SecureCombCircuit, SignalIndex);

								if (SecureCombCircuit->Signals[SignalIndex]->Type == SignalType_output)
									RemoveSignalFromOutputs(SecureCombCircuit, SignalIndex);

								SecureCombCircuit->Signals[SignalIndex]->Deleted = 1;
							}
							else
							{
								for (InputIndex2 = 0;InputIndex2 < SecureCombCircuit->Signals[SignalIndex]->NumberOfInputs;InputIndex2++)
									if (SecureCombCircuit->Cells[SecureCombCircuit->Signals[SignalIndex]->Inputs[InputIndex2]]->ToBeSecured)
										break;

								if (InputIndex2 < SecureCombCircuit->Signals[SignalIndex]->NumberOfInputs)
								{
									if (SecureCombCircuit->Signals[SignalIndex]->Type == SignalType_output)
										RemoveSignalFromOutputs(SecureCombCircuit, SignalIndex);

									if (SecureCombCircuit->Signals[SignalIndex]->Type != SignalType_input)
										AddSignalToInputs(SecureCombCircuit, SignalIndex);
								}
							}
						}
					}

					SecureCombCircuit->Cells[CellIndex]->Deleted = 1;
				}
			}


		NumberOfGates = 0;
		for (GateIndex = 0; GateIndex < SecureCombCircuit->NumberOfGates;GateIndex++)
			if (!SecureCombCircuit->Cells[SecureCombCircuit->Gates[GateIndex]]->Deleted)
				NumberOfGates++;

		printf("combinatorial circuit is extracted conatining %d cells\n", NumberOfGates);
	}

	if (!res)
		res = MakeCircuitDepth(Library, SecureCombCircuit);

	//------------------------------------------------

	if (!res)
		for (DepthIndex = 0;DepthIndex <= Circuit->MaxDepth;DepthIndex++)
			for (TempIndex = 0;TempIndex < Circuit->NumberOfCellsInDepth[DepthIndex];TempIndex++)
			{
				CellIndex = Circuit->CellsInDepth[DepthIndex][TempIndex];

				if (Circuit->Cells[CellIndex]->ToBeSecured)
				{
					for (InputIndex = 0;InputIndex < Circuit->Cells[CellIndex]->NumberOfInputs;InputIndex++)
					{
						SignalIndex = Circuit->Cells[CellIndex]->Inputs[InputIndex];
						RemoveCellFromSignalInputList(Circuit, SignalIndex, -1, CellIndex);

						if ((Circuit->Signals[SignalIndex]->NumberOfInputs == 0) &&
							(Circuit->Signals[SignalIndex]->Type == SignalType_wire) &&
							(Circuit->Signals[SignalIndex]->Output == -1))
							Circuit->Signals[SignalIndex]->Deleted = 1;
					}

					for (OutputIndex = 0;OutputIndex < Circuit->Cells[CellIndex]->NumberOfOutputs;OutputIndex++)
					{
						SignalIndex = Circuit->Cells[CellIndex]->Outputs[OutputIndex];
						if (SignalIndex != -1)
							Circuit->Cells[CellIndex]->Outputs[OutputIndex] = -1;
					}

					Circuit->Cells[CellIndex]->Deleted = 1;
				}
			}

	return res;
}

int TrimSignalName(char* SignalName)
{
	int   i, j, l;
	char* Str = (char *)malloc(Max_Name_Length * sizeof(char));

	j = -1;
	l = strlen(SignalName);

	if (SignalName[l - 1] == ']')
	{
		for (i = l - 2;i >= 0;i--)
			if (SignalName[i] == '[')
				break;

		if (i >= 0)
		{
			SignalName[i] = 0;
			strcpy(Str, &SignalName[i + 1]);
			Str[strlen(Str) - 1] = 0;
			j = atoi(Str);
		}
	}

	free(Str);
	return(j);
}


void CorrectSignalName(char* SignalName)
{
	int   i;

	if (SignalName[0] == '\\')
	{
		i = TrimSignalName(SignalName);
		strcat(SignalName, " ");
		if (i >= 0)
			sprintf(SignalName, "%s[%d]", SignalName, i);
	}
}

int ProcessStep2(char* InputVerilogFileName, char* MainModuleName,
	LibraryStruct* Library, CircuitStruct* Circuit,  char* AttributeKeyword, char* Method, char LowLatency)
{
	char*		  Step2FileName = (char *)malloc(Max_Name_Length * sizeof(char));
	char*		  Step2ModuleName = (char *)malloc(Max_Name_Length * sizeof(char));
	char*		  Str1 = (char *)malloc(Max_Name_Length * sizeof(char));
	char*		  Str2 = (char *)malloc(Max_Name_Length * sizeof(char));
	char*		  Str3 = (char *)malloc(Max_Name_Length * sizeof(char));
	int			  InputIndex;
	int			  OutputIndex;
	int			  SignalIndex;
	int			  ConstantIndex;
	int*		  TempSignalIndex = NULL;
	int			  RegIndex;
	int			  CellIndex;
	int			  NewCellIndex;
	int			  NewSignalIndex;
	int			  DepthIndex;
	int			  TempIndex;
	int			  i;
	int			  res;

	strcpy(Step2FileName, InputVerilogFileName);
	i = strlen(Step2FileName) - 1;
	while ((i >= 0) && (Step2FileName[i] != '.'))
		i--;

	if (i >= 0)
		Step2FileName[i] = 0;
	strcat(Step2FileName, "_step2_");
	strcat(Step2FileName, Method);
	strcpy(Step2ModuleName, Step2FileName);
	strcat(Step2FileName, ".v");

	i = strlen(Step2ModuleName) - 1;
	while ((i >= 0) && (Step2ModuleName[i] != '\\') && (Step2ModuleName[i] != '/'))
		i--;

	if (i >= 0)
		strcpy(Step2ModuleName, &Step2ModuleName[i+1]);

	if (strcmp(Method, "ANF"))
	{
		CircuitStruct CircuitNew;

		res = ReadDesignFile(Step2FileName, Step2ModuleName, Library, &CircuitNew, NULL);

		if (!res)
		{
			res = RemoveUnconnectedCells(Library, &CircuitNew, 1, 1);

			if (!res)
				res = MakeCircuitDepth(Library, &CircuitNew);

			if (!res)
				res = RemoveAllBuffers(Library, &CircuitNew);

			if (!res)
				res = MakeCircuitDepth(Library, &CircuitNew);

			if (!res)
				res = RemoveUnconnectedSignals(&CircuitNew);
		}

		if (!res)
		{
			TempSignalIndex = (int*)malloc(CircuitNew.NumberOfSignals * sizeof(int));
			for (SignalIndex = 0;SignalIndex < CircuitNew.NumberOfSignals;SignalIndex++)
				TempSignalIndex[SignalIndex] = -1;

			for (InputIndex = 0;InputIndex < CircuitNew.NumberOfInputs;InputIndex++)
			{
				SignalIndex = CircuitNew.Inputs[InputIndex];
				strcpy(Str1, CircuitNew.Signals[SignalIndex]->Name);
				i = TrimSignalName(Str1);
				if (i == -1)
				{
					printf("input signal \"%s\" in result of step2 file \"%s\" is not valid\n", CircuitNew.Signals[SignalIndex]->Name, Step2FileName);
					free(Step2FileName);
					free(Step2ModuleName);
					free(Str1);
					free(Str2);
					free(Str3);
					free(TempSignalIndex);
					return 1;
				}

				TempSignalIndex[SignalIndex] = i;
			}

			//*********************//

			for (OutputIndex = 0;OutputIndex < CircuitNew.NumberOfOutputs;OutputIndex++)
			{
				SignalIndex = CircuitNew.Outputs[OutputIndex];
				strcpy(Str1, CircuitNew.Signals[SignalIndex]->Name);
				i = TrimSignalName(Str1);
				if (i == -1)
				{
					printf("output signal \"%s\" in result of step2 file \"%s\" is not valid\n", CircuitNew.Signals[SignalIndex]->Name, Step2FileName);
					free(Step2FileName);
					free(Step2ModuleName);
					free(Str1);
					free(Str2);
					free(Str3);
					free(TempSignalIndex);
					return 1;
				}

				TempSignalIndex[SignalIndex] = i;
			}

			//*********************//

			for (TempIndex = 0;TempIndex < CircuitNew.NumberOfConstants;TempIndex++)
				TempSignalIndex[TempIndex] = TempIndex;

			//*********************//

			for (DepthIndex = 0;DepthIndex <= CircuitNew.MaxDepth;DepthIndex++)
				for (TempIndex = 0;TempIndex < CircuitNew.NumberOfCellsInDepth[DepthIndex];TempIndex++)
				{
					CellIndex = CircuitNew.CellsInDepth[DepthIndex][TempIndex];

					NewCellIndex = AddCell(Library, Circuit, (char*)"", CircuitNew.Cells[CellIndex]->Type);
					for (InputIndex = 0;InputIndex < CircuitNew.Cells[CellIndex]->NumberOfInputs;InputIndex++)
					{
						SignalIndex = CircuitNew.Cells[CellIndex]->Inputs[InputIndex];

						NewSignalIndex = TempSignalIndex[SignalIndex];
						if (NewSignalIndex == -1)
						{
							printf("error! signal %s as an input to cell %s cannot be found in the main circuit\n", CircuitNew.Signals[SignalIndex]->Name, CircuitNew.Cells[CellIndex]->Name);
							res = 1;
							//NewSignalIndex = AddSignal(Circuit, (char*)""); // should not happen!
						}

						AddSignalToCellInputList(Circuit, NewSignalIndex, NewCellIndex, InputIndex);
						AddCellToSignalInputList(Circuit, NewSignalIndex, NewCellIndex);
					}

					for (OutputIndex = 0;OutputIndex < CircuitNew.Cells[CellIndex]->NumberOfOutputs;OutputIndex++)
					{
						SignalIndex = CircuitNew.Cells[CellIndex]->Outputs[OutputIndex];
						if (SignalIndex != -1)
						{
							NewSignalIndex = TempSignalIndex[SignalIndex];
							if (NewSignalIndex == -1)
							{
								NewSignalIndex = AddSignal(Circuit, (char*)"");
								TempSignalIndex[SignalIndex] = NewSignalIndex;
							}

							Circuit->Cells[NewCellIndex]->Outputs[OutputIndex] = NewSignalIndex;
							Circuit->Signals[NewSignalIndex]->Output = NewCellIndex;
						}
					}
				}

			remove(Step2FileName);
		}
	}
	else
	{
		FILE	*F;
		int		fs;
		char	*Str_ptr;
		int		*InputSignalTable;
		int		NumberOfInputSignals;
		int		*OutputSignalTable;
		int		NumberOfOutputSignals;
		int		NumberOfFreshMasks;
		CellTypeStruct** TempCellTypes;

		InputSignalTable = (int*)malloc(Circuit->NumberOfSignals * sizeof(int));
		OutputSignalTable = (int*)malloc(Circuit->NumberOfSignals * sizeof(int));
		NumberOfInputSignals = 0;
		NumberOfOutputSignals = 0;

		F = fopen(Step2FileName, "rt");
		do
			fs = fscanf(F, "%s", Str1);
		while ((!feof(F)) && (Str1[0] != '{'));

		fs = fscanf(F, "%s", Str1);
		while ((!feof(F)) && (Str1[0] != '}'))
		{
			Str_ptr = strstr(Str1, "in_signal[");
			if (Str_ptr != Str1)
			{
				printf("error in reading the file %s\n", Step2FileName);
				fclose(F);
				free(Step2FileName);
				free(Step2ModuleName);
				free(Str1);
				free(Str2);
				free(Str3);
				free(TempSignalIndex);
				free(InputSignalTable);
				free(OutputSignalTable);
				return 1;
			}

			Str_ptr = strchr(Str1, ']');
			if (Str_ptr == NULL)
			{
				printf("error in reading the file %s\n", Step2FileName);
				fclose(F);
				free(Step2FileName);
				free(Step2ModuleName);
				free(Str1);
				free(Str2);
				free(Str3);
				free(TempSignalIndex);
				free(InputSignalTable);
				free(OutputSignalTable);
				return 1;
			}

			*Str_ptr = 0;
			Str_ptr = Str1 + 10;

			InputIndex = atoi(Str_ptr);
			InputSignalTable[NumberOfInputSignals++] = InputIndex;

			fs = fscanf(F, "%s", Str1);
		}

		if (!NumberOfInputSignals)
		{
			printf("error in reading the file %s\n", Step2FileName);
			fclose(F);
			free(Step2FileName);
			free(Step2ModuleName);
			free(Str1);
			free(Str2);
			free(Str3);
			free(TempSignalIndex);
			free(InputSignalTable);
			free(OutputSignalTable);
			return 1;
		}

		//-------------------

		do
			fs = fscanf(F, "%s", Str1);
		while ((!feof(F)) && (Str1[0] != '{'));

		fs = fscanf(F, "%s", Str1);
		while ((!feof(F)) && (Str1[0] != '}'))
		{
			Str_ptr = strstr(Str1, "out_signal[");
			if (Str_ptr != Str1)
			{
				printf("error in reading the file %s\n", Step2FileName);
				fclose(F);
				free(Step2FileName);
				free(Step2ModuleName);
				free(Str1);
				free(Str2);
				free(Str3);
				free(TempSignalIndex);
				free(InputSignalTable);
				free(OutputSignalTable);
				return 1;
			}

			Str_ptr = strchr(Str1, ']');
			if (Str_ptr == NULL)
			{
				printf("error in reading the file %s\n", Step2FileName);
				fclose(F);
				free(Step2FileName);
				free(Step2ModuleName);
				free(Str1);
				free(Str2);
				free(Str3);
				free(TempSignalIndex);
				free(InputSignalTable);
				free(OutputSignalTable);
				return 1;
			}

			*Str_ptr = 0;
			Str_ptr = Str1 + 11;

			OutputIndex = atoi(Str_ptr);
			OutputSignalTable[NumberOfOutputSignals++] = OutputIndex;

			fs = fscanf(F, "%s", Str1);
		}

		if (!NumberOfOutputSignals)
		{
			printf("error in reading the file %s\n", Step2FileName);
			fclose(F);
			free(Step2FileName);
			free(Step2ModuleName);
			free(Str1);
			free(Str2);
			free(Str3);
			free(TempSignalIndex);
			free(InputSignalTable);
			free(OutputSignalTable);
			return 1;
		}

		//-------------------

		Str2[0] = 0;
		Str3[0] = 0;

		while ((!feof(F)) && ((strcmp(Str3, "input") || strcmp(Str1, "r;"))))
		{
			strcpy(Str3, Str2);
			strcpy(Str2, Str1);
			fs = fscanf(F, "%s", Str1);
		}

		if (feof(F))
		{
			printf("error in reading the file %s\n", Step2FileName);
			fclose(F);
			free(Step2FileName);
			free(Step2ModuleName);
			free(Str1);
			free(Str2);
			free(Str3);
			free(TempSignalIndex);
			free(InputSignalTable);
			free(OutputSignalTable);
			return 1;
		}

		Str_ptr = strchr(Str2, ':');
		if ((Str2[0] != '[') || (Str2[strlen(Str2) - 1] != ']') || (Str_ptr == NULL))
		{
			printf("error in reading the file %s\n", Step2FileName);
			fclose(F);
			free(Step2FileName);
			free(Step2ModuleName);
			free(Str1);
			free(Str2);
			free(Str3);
			free(TempSignalIndex);
			free(InputSignalTable);
			free(OutputSignalTable);
			return 1;
		}

		*Str_ptr = 0;
		NumberOfFreshMasks = atoi(&Str2[1]) + 1;

		fclose(F);

		//-------------------

		TempCellTypes = (CellTypeStruct **)malloc((Library->NumberOfCellTypes + 2) * sizeof(CellTypeStruct *));
		memcpy(TempCellTypes, Library->CellTypes, Library->NumberOfCellTypes * sizeof(CellTypeStruct *));
		free(Library->CellTypes);
		Library->CellTypes = TempCellTypes;

		Library->CellTypes[Library->NumberOfCellTypes] = (CellTypeStruct *)malloc(sizeof(CellTypeStruct));
		Library->CellTypes[Library->NumberOfCellTypes]->SCAType = -1;
		Library->CellTypes[Library->NumberOfCellTypes]->SCAType2 = -1;
		Library->CellTypes[Library->NumberOfCellTypes]->Type = 0;
		Library->CellTypes[Library->NumberOfCellTypes]->CustomName = (char*)calloc(1, sizeof(char));

		Library->CellTypes[Library->NumberOfCellTypes]->GateOrReg = CellType_Gate;
		Library->CellTypes[Library->NumberOfCellTypes]->Type |= GateType_SCA;

		Library->CellTypes[Library->NumberOfCellTypes]->NumberOfStages = 2 - LowLatency;

		Library->CellTypes[Library->NumberOfCellTypes]->NumberOfCases = 1;
		Library->CellTypes[Library->NumberOfCellTypes]->Cases = (char **)malloc(1 * sizeof(char *));
		Library->CellTypes[Library->NumberOfCellTypes]->Cases[0] = (char *)malloc(strlen(Step2ModuleName) + 1);
		strcpy(Library->CellTypes[Library->NumberOfCellTypes]->Cases[0], Step2ModuleName);

		//-------------

		Library->CellTypes[Library->NumberOfCellTypes]->NumberOfInputs = NumberOfInputSignals * 2 + 1 + NumberOfFreshMasks;
		Library->CellTypes[Library->NumberOfCellTypes]->Inputs = (char **)malloc(Library->CellTypes[Library->NumberOfCellTypes]->NumberOfInputs * sizeof(char *));

		Library->CellTypes[Library->NumberOfCellTypes]->NumberOfInputs = 0;
		for (i = 0;i < NumberOfInputSignals;i++)
		{
			sprintf(Str1, "in0[%d]", i);
			Library->CellTypes[Library->NumberOfCellTypes]->Inputs[Library->CellTypes[Library->NumberOfCellTypes]->NumberOfInputs] = (char *)malloc(strlen(Str1) + 1);
			strcpy(Library->CellTypes[Library->NumberOfCellTypes]->Inputs[Library->CellTypes[Library->NumberOfCellTypes]->NumberOfInputs], Str1);
			Library->CellTypes[Library->NumberOfCellTypes]->NumberOfInputs++;

			sprintf(Str1, "in1[%d]", i);
			Library->CellTypes[Library->NumberOfCellTypes]->Inputs[Library->CellTypes[Library->NumberOfCellTypes]->NumberOfInputs] = (char *)malloc(strlen(Str1) + 1);
			strcpy(Library->CellTypes[Library->NumberOfCellTypes]->Inputs[Library->CellTypes[Library->NumberOfCellTypes]->NumberOfInputs], Str1);
			Library->CellTypes[Library->NumberOfCellTypes]->NumberOfInputs++;
		}

		strcpy(Str1, "clk");
		Library->CellTypes[Library->NumberOfCellTypes]->Inputs[Library->CellTypes[Library->NumberOfCellTypes]->NumberOfInputs] = (char *)malloc(strlen(Str1) + 1);
		strcpy(Library->CellTypes[Library->NumberOfCellTypes]->Inputs[Library->CellTypes[Library->NumberOfCellTypes]->NumberOfInputs], Str1);
		Library->CellTypes[Library->NumberOfCellTypes]->NumberOfInputs++;

		for (i = 0;i < NumberOfFreshMasks;i++)
		{
			sprintf(Str1, "r[%d]", i);
			Library->CellTypes[Library->NumberOfCellTypes]->Inputs[Library->CellTypes[Library->NumberOfCellTypes]->NumberOfInputs] = (char *)malloc(strlen(Str1) + 1);
			strcpy(Library->CellTypes[Library->NumberOfCellTypes]->Inputs[Library->CellTypes[Library->NumberOfCellTypes]->NumberOfInputs], Str1);
			Library->CellTypes[Library->NumberOfCellTypes]->NumberOfInputs++;
		}

		//-------------

		Library->CellTypes[Library->NumberOfCellTypes]->NumberOfOutputs = NumberOfOutputSignals * 2;
		Library->CellTypes[Library->NumberOfCellTypes]->Outputs = (char **)malloc(Library->CellTypes[Library->NumberOfCellTypes]->NumberOfOutputs * sizeof(char *));

		Library->CellTypes[Library->NumberOfCellTypes]->NumberOfOutputs = 0;
		for (i = 0;i < NumberOfOutputSignals;i++)
		{
			sprintf(Str1, "out0[%d]", i);
			Library->CellTypes[Library->NumberOfCellTypes]->Outputs[Library->CellTypes[Library->NumberOfCellTypes]->NumberOfOutputs] = (char *)malloc(strlen(Str1) + 1);
			strcpy(Library->CellTypes[Library->NumberOfCellTypes]->Outputs[Library->CellTypes[Library->NumberOfCellTypes]->NumberOfOutputs], Str1);
			Library->CellTypes[Library->NumberOfCellTypes]->NumberOfOutputs++;

			sprintf(Str1, "out1[%d]", i);
			Library->CellTypes[Library->NumberOfCellTypes]->Outputs[Library->CellTypes[Library->NumberOfCellTypes]->NumberOfOutputs] = (char *)malloc(strlen(Str1) + 1);
			strcpy(Library->CellTypes[Library->NumberOfCellTypes]->Outputs[Library->CellTypes[Library->NumberOfCellTypes]->NumberOfOutputs], Str1);
			Library->CellTypes[Library->NumberOfCellTypes]->NumberOfOutputs++;
		}

		Library->NumberOfCellTypes++;

		//================

		Library->CellTypes[Library->NumberOfCellTypes] = (CellTypeStruct *)malloc(sizeof(CellTypeStruct));
		Library->CellTypes[Library->NumberOfCellTypes]->SCAType = Library->NumberOfCellTypes - 1;
		Library->CellTypes[Library->NumberOfCellTypes]->SCAType2 = -1;
		Library->CellTypes[Library->NumberOfCellTypes]->Type = 0;
		Library->CellTypes[Library->NumberOfCellTypes]->CustomName = (char*)calloc(1, sizeof(char));

		Library->CellTypes[Library->NumberOfCellTypes]->GateOrReg = CellType_Gate;
		Library->CellTypes[Library->NumberOfCellTypes]->Type |= GateType_Normal;

		Library->CellTypes[Library->NumberOfCellTypes]->NumberOfStages = 2 - LowLatency;

		Library->CellTypes[Library->NumberOfCellTypes]->NumberOfCases = 1;
		Library->CellTypes[Library->NumberOfCellTypes]->Cases = (char **)malloc(1 * sizeof(char *));
		Library->CellTypes[Library->NumberOfCellTypes]->Cases[0] = (char *)malloc(strlen(Step2ModuleName) + 1);
		strcpy(Library->CellTypes[Library->NumberOfCellTypes]->Cases[0], Step2ModuleName);

		//-------------

		Library->CellTypes[Library->NumberOfCellTypes]->NumberOfInputs = NumberOfInputSignals;
		Library->CellTypes[Library->NumberOfCellTypes]->Inputs = (char **)malloc(Library->CellTypes[Library->NumberOfCellTypes]->NumberOfInputs * sizeof(char *));

		Library->CellTypes[Library->NumberOfCellTypes]->NumberOfInputs = 0;
		for (i = 0;i < NumberOfInputSignals;i++)
		{
			sprintf(Str1, "in[%d]", i);
			Library->CellTypes[Library->NumberOfCellTypes]->Inputs[Library->CellTypes[Library->NumberOfCellTypes]->NumberOfInputs] = (char *)malloc(strlen(Str1) + 1);
			strcpy(Library->CellTypes[Library->NumberOfCellTypes]->Inputs[Library->CellTypes[Library->NumberOfCellTypes]->NumberOfInputs], Str1);
			Library->CellTypes[Library->NumberOfCellTypes]->NumberOfInputs++;
		}

		//-------------

		Library->CellTypes[Library->NumberOfCellTypes]->NumberOfOutputs = NumberOfOutputSignals;
		Library->CellTypes[Library->NumberOfCellTypes]->Outputs = (char **)malloc(Library->CellTypes[Library->NumberOfCellTypes]->NumberOfOutputs * sizeof(char *));

		Library->CellTypes[Library->NumberOfCellTypes]->NumberOfOutputs = 0;
		for (i = 0;i < NumberOfOutputSignals;i++)
		{
			sprintf(Str1, "out[%d]", i);
			Library->CellTypes[Library->NumberOfCellTypes]->Outputs[Library->CellTypes[Library->NumberOfCellTypes]->NumberOfOutputs] = (char *)malloc(strlen(Str1) + 1);
			strcpy(Library->CellTypes[Library->NumberOfCellTypes]->Outputs[Library->CellTypes[Library->NumberOfCellTypes]->NumberOfOutputs], Str1);
			Library->CellTypes[Library->NumberOfCellTypes]->NumberOfOutputs++;
		}

		Library->NumberOfCellTypes++;

		//================

		strcpy(Str1, Step2ModuleName);
		strcat(Str1, "_inst");
		NewCellIndex = AddCell(Library, Circuit, Str1, Library->NumberOfCellTypes - 1);

		for (InputIndex = 0;InputIndex < NumberOfInputSignals;InputIndex++)
		{
			SignalIndex = InputSignalTable[NumberOfInputSignals - InputIndex - 1];

			AddSignalToCellInputList(Circuit, SignalIndex, NewCellIndex, InputIndex);
			AddCellToSignalInputList(Circuit, SignalIndex, NewCellIndex);
		}

		for (OutputIndex = 0;OutputIndex < NumberOfOutputSignals;OutputIndex++)
		{
			SignalIndex = OutputSignalTable[NumberOfOutputSignals - OutputIndex - 1];

			AddSignalToCellOutputList(Circuit, SignalIndex, NewCellIndex, OutputIndex);
			Circuit->Signals[SignalIndex]->Output = NewCellIndex;
		}

		res = 0;
		free(InputSignalTable);
		free(OutputSignalTable);
	}

	free(Step2FileName);
	free(Step2ModuleName);
	free(Str1);
	free(Str2);
	free(Str3);
	free(TempSignalIndex);
	return res;
}



int WriteCustomizedFile(char* InputVerilogFileName, LibraryStruct* Library, CircuitStruct* Circuit, char* OutputFileName)
{
	int   i;

	FILE*	OutFile;
	int		InputIndex;
	int		SignalIndex;
	int		OutputIndex;
	int		temp_index;
	int		DepthIndex;
	int		CellIndex;
	int*	TempSignalList;

	strcpy(OutputFileName, InputVerilogFileName);
	i = strlen(OutputFileName) - 1;
	while ((i >= 0) && (OutputFileName[i] != '.'))
		i--;

	if (i >= 0)
		OutputFileName[i] = 0;
	strcat(OutputFileName, "_step2.nl");

	TempSignalList = (int*)malloc(Circuit->NumberOfSignals * 2 * sizeof(int)); // * 2 for registers with two outputs
	OutFile = fopen(OutputFileName, "wt");

	SignalIndex = 0;

	for (InputIndex = 0;InputIndex < Circuit->NumberOfInputs;InputIndex++)
	{
		if (strcmp(Circuit->Signals[Circuit->Inputs[InputIndex]]->Attribute, "clock"))
		{
			fprintf(OutFile, "in %d # in_signal[%d]", SignalIndex, Circuit->Inputs[InputIndex]);
			TempSignalList[Circuit->Inputs[InputIndex]] = SignalIndex++;

			if (!strcmp(Circuit->Signals[Circuit->Inputs[InputIndex]]->Attribute, "reset"))
				fprintf(OutFile, "/*(reset)*/");
			else
				fprintf(OutFile, "/*(%s)*/", Circuit->Signals[Circuit->Inputs[InputIndex]]->Name);

			fprintf(OutFile, "\n");
		}
	}

	for (i = 0;i < Circuit->NumberOfConstants;i++)
		if (Circuit->Signals[Circuit->Constants[i]]->NumberOfInputs)
		{
			fprintf(OutFile, "in %d # in_signal[%d]/*(constant)*/\n", SignalIndex, Circuit->Constants[i]);
			TempSignalList[Circuit->Constants[i]] = SignalIndex++;
		}

	//----------------------

	for (DepthIndex = 1;DepthIndex < Circuit->MaxDepth + 1;DepthIndex++)
	{
		for (CellIndex = 0;CellIndex < Circuit->NumberOfCellsInDepth[DepthIndex];CellIndex++)
		{
			fprintf(OutFile, "%s", Library->CellTypes[Circuit->Cells[Circuit->CellsInDepth[DepthIndex][CellIndex]]->Type]->CustomName);

			for (InputIndex = 0;InputIndex < Circuit->Cells[Circuit->CellsInDepth[DepthIndex][CellIndex]]->NumberOfInputs;InputIndex++)
			{
				temp_index = Circuit->Cells[Circuit->CellsInDepth[DepthIndex][CellIndex]]->Inputs[InputIndex];

				if (strcmp(Circuit->Signals[temp_index]->Attribute, "clock"))
					fprintf(OutFile, " %d", TempSignalList[temp_index]);
			}

			fprintf(OutFile, " # %s\n", Circuit->Cells[Circuit->CellsInDepth[DepthIndex][CellIndex]]->Name);

			for (OutputIndex = 0;OutputIndex < Circuit->Cells[Circuit->CellsInDepth[DepthIndex][CellIndex]]->NumberOfOutputs; OutputIndex++)
				if (Circuit->Cells[Circuit->CellsInDepth[DepthIndex][CellIndex]]->Outputs[OutputIndex] != -1)
					TempSignalList[Circuit->Cells[Circuit->CellsInDepth[DepthIndex][CellIndex]]->Outputs[OutputIndex]] = SignalIndex++;
		}
	}

	for (OutputIndex = 0;OutputIndex < Circuit->NumberOfOutputs;OutputIndex++)
	{
		if (strcmp(Circuit->Signals[Circuit->Outputs[OutputIndex]]->Attribute, "clock") &&
		    (Circuit->Signals[Circuit->Outputs[OutputIndex]]->Output != -1))
		{
			temp_index = TempSignalList[Circuit->Outputs[OutputIndex]];
			fprintf(OutFile, "out %d # out_signal[%d]/*(%s)*/\n", temp_index, Circuit->Outputs[OutputIndex], Circuit->Signals[Circuit->Outputs[OutputIndex]]->Name);
		}
	}

	fclose(OutFile);

	return 0;
}


void WriteVerilgCell(FILE *OutputFile, int CellIndex, char* Scheme, char SecurityOrder, char KeepOriginalNames, char WriteDepths,
	char MakePipeline, LibraryStruct* Library, CircuitStruct* Circuit)
{
	char   CellUnconnected;
	int    OutputIndex;
	int    InputIndex;
	char*  ThisPortName = (char *)malloc(Max_Name_Length * sizeof(char));
	char*  PortName     = (char *)malloc(Max_Name_Length * sizeof(char));
	char*  TempPortName = (char *)malloc(Max_Name_Length * sizeof(char));
	char*  ThisSignalName = (char *)malloc(Max_Name_Length * 1000 * sizeof(char));
	char*  SignalName     = (char *)malloc(Max_Name_Length * 1000 * sizeof(char));
	char*  TempSignalName = (char *)malloc(Max_Name_Length * 1000 * sizeof(char));
	char   OnePortWritten;
	char*  ptr;
	char** PortNameList;
	int    NumberOfPortNameList;
	int	   MaxNumberOfPortNameList;
	int	   TempIndex;

	MaxNumberOfPortNameList = Library->CellTypes[Circuit->Cells[CellIndex]->Type]->NumberOfInputs;
	if (MaxNumberOfPortNameList < Library->CellTypes[Circuit->Cells[CellIndex]->Type]->NumberOfOutputs)
		MaxNumberOfPortNameList = Library->CellTypes[Circuit->Cells[CellIndex]->Type]->NumberOfOutputs;

	PortNameList = (char **)calloc(MaxNumberOfPortNameList, sizeof(char*));

	if (!Circuit->Cells[CellIndex]->Deleted)
	{
		CellUnconnected = 1;
		for (OutputIndex = 0;(OutputIndex < Library->CellTypes[Circuit->Cells[CellIndex]->Type]->NumberOfOutputs) && CellUnconnected;OutputIndex++)
			if (Circuit->Cells[CellIndex]->Outputs[OutputIndex] >= 0)
				CellUnconnected = !((Circuit->Signals[Circuit->Cells[CellIndex]->Outputs[OutputIndex]]->Type == SignalType_output) |
				(Circuit->Signals[Circuit->Cells[CellIndex]->Outputs[OutputIndex]]->NumberOfInputs > 0));

		if (!CellUnconnected)
		{
			fprintf(OutputFile, "    %s ", Library->CellTypes[Circuit->Cells[CellIndex]->Type]->Cases[0]);

			if ((Library->CellTypes[Circuit->Cells[CellIndex]->Type]->Type & GateType_SCA) &&
				(Circuit->Cells[CellIndex]->Type != Library->RegBufferCellType))
			{
				fprintf(OutputFile, "#(");
				if (!strcmp(Scheme, "GHPC"))
					fprintf(OutputFile, ".low_latency(0), ");
				else if (!strcmp(Scheme, "GHPCLL"))
					fprintf(OutputFile, ".low_latency(1), ");
				else
					fprintf(OutputFile, ".security_order(%d), ", SecurityOrder);

				fprintf(OutputFile, ".pipeline(%d)) ", MakePipeline);
			}

			if (Circuit->Cells[CellIndex]->Type == Library->ClockGatingCellType)
				fprintf(OutputFile, "#(%d) ", Circuit->MaxDepth + (Circuit->NumberOfRegs ? 1 : 0));

			if (KeepOriginalNames)
				fprintf(OutputFile, "%s ( ", Circuit->Cells[CellIndex]->Name);
			else
				fprintf(OutputFile, "cell_%d ( ", CellIndex);

			//----- inputs -----

			NumberOfPortNameList = 0;
			for (InputIndex = 0;InputIndex < Library->CellTypes[Circuit->Cells[CellIndex]->Type]->NumberOfInputs;InputIndex++)
			{
				strcpy(ThisPortName, Library->CellTypes[Circuit->Cells[CellIndex]->Type]->Inputs[InputIndex]);
				strcpy(TempPortName, ThisPortName);
				ptr = strchr(TempPortName, '[');
				if (ptr != NULL)
					*ptr = 0;

				for (TempIndex = 0;TempIndex < NumberOfPortNameList;TempIndex++)
					if (!strcmp(PortNameList[TempIndex], TempPortName))
						break;

				if (TempIndex == NumberOfPortNameList)
				{
					free(PortNameList[NumberOfPortNameList]);
					PortNameList[NumberOfPortNameList] = (char*)malloc((strlen(TempPortName) + 1) * sizeof(char));
					strcpy(PortNameList[NumberOfPortNameList], TempPortName);
					NumberOfPortNameList++;
				}
			}

			OnePortWritten = 0;
			for (TempIndex = 0;TempIndex < NumberOfPortNameList;TempIndex++)
			{
				SignalName[0] = 0;

				for (InputIndex = 0;InputIndex < Library->CellTypes[Circuit->Cells[CellIndex]->Type]->NumberOfInputs;InputIndex++)
				{
					strcpy(ThisPortName, Library->CellTypes[Circuit->Cells[CellIndex]->Type]->Inputs[InputIndex]);
					ptr = strchr(ThisPortName, '[');
					if (ptr != NULL)
						*ptr = 0;

					if (!strcmp(PortNameList[TempIndex], ThisPortName))
					{
						strcpy(ThisSignalName, Circuit->Signals[Circuit->Cells[CellIndex]->Inputs[InputIndex]]->Name);
						CorrectSignalName(ThisSignalName);

						if (SignalName[0] == 0)
							strcpy(SignalName, ThisSignalName);
						else
						{
							strcpy(TempSignalName, SignalName);
							sprintf(SignalName, "%s, %s", ThisSignalName, TempSignalName);
						}
					}
				}

				if (OnePortWritten)
					fprintf(OutputFile, ", ");
				OnePortWritten = 1;

				if (strchr(SignalName, ',') == NULL)
					fprintf(OutputFile, ".%s (%s)", PortNameList[TempIndex], SignalName);
				else
					fprintf(OutputFile, ".%s ({%s})", PortNameList[TempIndex], SignalName);
			}

			//----- outputs -----

			NumberOfPortNameList = 0;
			for (OutputIndex = 0;OutputIndex < Library->CellTypes[Circuit->Cells[CellIndex]->Type]->NumberOfOutputs;OutputIndex++)
			{
				strcpy(ThisPortName, Library->CellTypes[Circuit->Cells[CellIndex]->Type]->Outputs[OutputIndex]);
				strcpy(TempPortName, ThisPortName);
				ptr = strchr(TempPortName, '[');
				if (ptr != NULL)
					*ptr = 0;

				for (TempIndex = 0;TempIndex < NumberOfPortNameList;TempIndex++)
					if (!strcmp(PortNameList[TempIndex], TempPortName))
						break;

				if (TempIndex == NumberOfPortNameList)
				{
					free(PortNameList[NumberOfPortNameList]);
					PortNameList[NumberOfPortNameList] = (char*)malloc((strlen(TempPortName) + 1) * sizeof(char));
					strcpy(PortNameList[NumberOfPortNameList], TempPortName);
					NumberOfPortNameList++;
				}
			}

			for (TempIndex = 0;TempIndex < NumberOfPortNameList;TempIndex++)
			{
				SignalName[0] = 0;

				for (OutputIndex = 0;OutputIndex < Library->CellTypes[Circuit->Cells[CellIndex]->Type]->NumberOfOutputs;OutputIndex++)
				{
					strcpy(ThisPortName, Library->CellTypes[Circuit->Cells[CellIndex]->Type]->Outputs[OutputIndex]);
					ptr = strchr(ThisPortName, '[');
					if (ptr != NULL)
						*ptr = 0;

					if (!strcmp(PortNameList[TempIndex], ThisPortName))
					{
						if (Circuit->Cells[CellIndex]->Outputs[OutputIndex] != -1)
						{
							strcpy(ThisSignalName, Circuit->Signals[Circuit->Cells[CellIndex]->Outputs[OutputIndex]]->Name);
							CorrectSignalName(ThisSignalName);
						}
						else
							ThisSignalName[0] = 0;

						if (SignalName[0] == 0)
							strcpy(SignalName, ThisSignalName);
						else
						{
							strcpy(TempSignalName, SignalName);
							sprintf(SignalName, "%s, %s", ThisSignalName, TempSignalName);
						}
					}
				}

				if (OnePortWritten)
					fprintf(OutputFile, ", ");
				OnePortWritten = 1;

				if (strchr(SignalName, ',') == NULL)
					fprintf(OutputFile, ".%s (%s)", PortNameList[TempIndex], SignalName);
				else
					fprintf(OutputFile, ".%s ({%s})", PortNameList[TempIndex], SignalName);
			}

			for (TempIndex = 0;TempIndex < MaxNumberOfPortNameList;TempIndex++)
				free(PortNameList[TempIndex]);

			fprintf(OutputFile, " ) ;");
			if (WriteDepths)
				fprintf(OutputFile, " /* Depth: %d */\n", Circuit->Cells[CellIndex]->Depth);
			else
				fprintf(OutputFile, "\n");
		}
	}

	free(ThisPortName);
	free(PortName);
	free(TempPortName);
	free(ThisSignalName);
	free(SignalName);
	free(TempSignalName);
	free(PortNameList);
}

void WriteVerilogFile(char* InputVerilogFileName, char* MainModuleName, char* Method, char* Scheme, char* LibraryName,
	char SecurityOrder, char KeepOriginalNames, char WriteInOrder, char WriteDepths, char MakePipeline,
	LibraryStruct* Library, CircuitStruct* Circuit)
{
	FILE* OutputFile;
	char* OutputVerilogFileName = (char *)malloc(Max_Name_Length * sizeof(char));
	char* FileNamePostfix = (char *)malloc(Max_Name_Length * sizeof(char));
	char* Str1 = (char *)malloc(Max_Name_Length * sizeof(char));
	char* Str2 = (char *)malloc(Max_Name_Length * sizeof(char));
	int   i;
	int   InputIndex;
	int   OutputIndex;
	int	  IndexH;
	int	  IndexL;
	int   TempIndex;
	int	  SignalIndex;
	int	  CellIndex;
	int	  RegIndex;
	int	  DepthIndex;
	char  f;

	if (!strcmp(Method, "naive"))
		strcpy(FileNamePostfix, (char*)"");
	else
	{
		strcpy(FileNamePostfix, Method);

		while (FileNamePostfix[0] == '_')
			strcpy(FileNamePostfix, &FileNamePostfix[1]);

		while (FileNamePostfix[strlen(FileNamePostfix) - 1] == '_')
			FileNamePostfix[strlen(FileNamePostfix) - 1] = 0;

		strcat(FileNamePostfix, "_");
	}

	if (MakePipeline)
		strcat(FileNamePostfix, "Pipeline");
	else
		strcat(FileNamePostfix, "ClockGating");

	sprintf(FileNamePostfix, "%s_d%d", FileNamePostfix, SecurityOrder);

	strcpy(OutputVerilogFileName, InputVerilogFileName);
	Str1[0] = 0;
	i = strlen(OutputVerilogFileName) - 1;
	while ((i >= 0) && (OutputVerilogFileName[i] != '.'))
		strcpy(Str1, &OutputVerilogFileName[i--]);

	if (i >= 0)
	{
		OutputVerilogFileName[i] = 0;
		strcat(OutputVerilogFileName, "_");
		strcat(OutputVerilogFileName, LibraryName);
		strcat(OutputVerilogFileName, "_");
		strcat(OutputVerilogFileName, FileNamePostfix);
		strcat(OutputVerilogFileName, ".");
		strcat(OutputVerilogFileName, Str1);
	}
	else
	{
		strcat(OutputVerilogFileName, "_");
		strcat(OutputVerilogFileName, LibraryName);
		strcat(OutputVerilogFileName, "_");
		strcat(OutputVerilogFileName, FileNamePostfix);
	}
	OutputFile = fopen(OutputVerilogFileName, "wt");

	//---- writing the module name and ports ---//
	fprintf(OutputFile, "/* modified netlist. Source: module %s in file %s */\n", MainModuleName, InputVerilogFileName);
	if (MakePipeline)
	{
		fprintf(OutputFile, "/* %d register stage(s) are added to the circuit and formed a pipeline design */\n", Circuit->MaxDepth);
		fprintf(OutputFile, "/* the circuit has %d register stage(s) in total */\n\n", Circuit->MaxDepth + (Circuit->NumberOfRegs ? 1 : 0));
	}
	else
		fprintf(OutputFile, "/* clock gating is added to the circuit, the latency increased %d time(s)  */\n\n", Circuit->MaxDepth);
	fprintf(OutputFile, "module %s_%s_%s (", MainModuleName, LibraryName, FileNamePostfix);

	for (InputIndex = 0;InputIndex < Circuit->NumberOfInputs;InputIndex++)
		Circuit->Signals[Circuit->Inputs[InputIndex]]->Printed = 0;

	for (InputIndex = 0;InputIndex < Circuit->NumberOfInputs;InputIndex++)
		if (!Circuit->Signals[Circuit->Inputs[InputIndex]]->Printed)
		{
			strcpy(Str1, Circuit->Signals[Circuit->Inputs[InputIndex]]->Name);
			TrimSignalName(Str1);
			for (i = InputIndex + 1;i < Circuit->NumberOfInputs;i++)
				if (!Circuit->Signals[Circuit->Inputs[i]]->Printed)
				{
					strcpy(Str2, Circuit->Signals[Circuit->Inputs[i]]->Name);
					TrimSignalName(Str2);
					if (!strcmp(Str1, Str2))
						Circuit->Signals[Circuit->Inputs[i]]->Printed = 1;
				}

			if (InputIndex)
				fprintf(OutputFile, ", ");
			fprintf(OutputFile, "%s", Str1);
		}

	//------------------

	for (OutputIndex = 0;OutputIndex < Circuit->NumberOfOutputs;OutputIndex++)
		Circuit->Signals[Circuit->Outputs[OutputIndex]]->Printed = 0;

	for (OutputIndex = 0;OutputIndex < Circuit->NumberOfOutputs;OutputIndex++)
		if (!Circuit->Signals[Circuit->Outputs[OutputIndex]]->Printed)
		{
			strcpy(Str1, Circuit->Signals[Circuit->Outputs[OutputIndex]]->Name);
			TrimSignalName(Str1);
			for (i = OutputIndex + 1;i < Circuit->NumberOfOutputs;i++)
				if (!Circuit->Signals[Circuit->Outputs[i]]->Printed)
				{
					strcpy(Str2, Circuit->Signals[Circuit->Outputs[i]]->Name);
					TrimSignalName(Str2);
					if (!strcmp(Str1, Str2))
						Circuit->Signals[Circuit->Outputs[i]]->Printed = 1;
				}
			fprintf(OutputFile, ", %s", Str1);
		}

	fprintf(OutputFile, ");\n");

	//---- writing the input ports ---//
	for (InputIndex = 0;InputIndex < Circuit->NumberOfInputs;InputIndex++)
		Circuit->Signals[Circuit->Inputs[InputIndex]]->Printed = 0;

	for (f = 0;f < 2;f++)
		for (InputIndex = 0;InputIndex < Circuit->NumberOfInputs;InputIndex++)
			if ((!Circuit->Signals[Circuit->Inputs[InputIndex]]->Printed) &&
				(Circuit->Signals[Circuit->Inputs[InputIndex]]->FreshMask == f))
			{
				strcpy(Str1, Circuit->Signals[Circuit->Inputs[InputIndex]]->Name);
				IndexH = TrimSignalName(Str1);
				IndexL = IndexH;
				for (i = InputIndex + 1;i < Circuit->NumberOfInputs;i++)
					if (!Circuit->Signals[Circuit->Inputs[i]]->Printed)
					{
						strcpy(Str2, Circuit->Signals[Circuit->Inputs[i]]->Name);
						TempIndex = TrimSignalName(Str2);
						if (!strcmp(Str1, Str2))
						{
							if (IndexH < TempIndex)
								IndexH = TempIndex;
							if ((IndexL > TempIndex) || (IndexL == -1))
								IndexL = TempIndex;

							Circuit->Signals[Circuit->Inputs[i]]->Printed = 1;
						}
					}

				fprintf(OutputFile, "    input ");
				if (IndexH >= 0)
					fprintf(OutputFile, "[%d:%d] ", IndexH, IndexL);
				fprintf(OutputFile, "%s ;\n", Str1);
			}

	//---- writing the output ports ---//
	for (OutputIndex = 0;OutputIndex < Circuit->NumberOfOutputs;OutputIndex++)
		Circuit->Signals[Circuit->Outputs[OutputIndex]]->Printed = 0;

	for (OutputIndex = 0;OutputIndex < Circuit->NumberOfOutputs;OutputIndex++)
		if (!Circuit->Signals[Circuit->Outputs[OutputIndex]]->Printed)
		{
			strcpy(Str1, Circuit->Signals[Circuit->Outputs[OutputIndex]]->Name);
			IndexH = TrimSignalName(Str1);
			IndexL = IndexH;
			for (i = OutputIndex + 1;i < Circuit->NumberOfOutputs;i++)
				if (!Circuit->Signals[Circuit->Outputs[i]]->Printed)
				{
					strcpy(Str2, Circuit->Signals[Circuit->Outputs[i]]->Name);
					TempIndex = TrimSignalName(Str2);
					if (!strcmp(Str1, Str2))
					{
						if (IndexH < TempIndex)
							IndexH = TempIndex;
						if ((IndexL > TempIndex) || (IndexL == -1))
							IndexL = TempIndex;

						Circuit->Signals[Circuit->Outputs[i]]->Printed = 1;
					}
				}

			fprintf(OutputFile, "    output ");
			if (IndexH >= 0)
				fprintf(OutputFile, "[%d:%d] ", IndexH, IndexL);
			fprintf(OutputFile, "%s ;\n", Str1);
		}

	//---- writing the wires ---//
	Str1[0] = 0;
	IndexH = -1;
	IndexL = -1;
	for (SignalIndex = 0;SignalIndex <= Circuit->NumberOfSignals;SignalIndex++)
		if ((SignalIndex == Circuit->NumberOfSignals) ||
			((Circuit->Signals[SignalIndex]->Type == SignalType_wire) &
			 ((!Circuit->Signals[SignalIndex]->Deleted) &
			  (Circuit->Signals[SignalIndex]->Output >= 0) &
			  (Circuit->Signals[SignalIndex]->NumberOfInputs > 0)) ||
			 (strstr(Circuit->Signals[SignalIndex]->Name, "clk_gated") == Circuit->Signals[SignalIndex]->Name)))
		{
			if (KeepOriginalNames)
			{
				if (SignalIndex < Circuit->NumberOfSignals)
					strcpy(Str2, Circuit->Signals[SignalIndex]->Name);
				else
					Str2[0] = 0;

				TempIndex = TrimSignalName(Str2);
				if (strcmp(Str1, Str2))
				{
					if (Str1[0])
					{
						fprintf(OutputFile, "    wire ");
						if (IndexH >= 0)
							fprintf(OutputFile, "[%d:%d] ", IndexH, IndexL);
						fprintf(OutputFile, "%s ;\n", Str1);
					}
					strcpy(Str1, Str2);
					IndexH = -1;
					IndexL = -1;
				}

				if (IndexH < TempIndex)
					IndexH = TempIndex;
				if ((IndexL > TempIndex) || (IndexL == -1))
					IndexL = TempIndex;
			}
			else if (SignalIndex < Circuit->NumberOfSignals)
			{
				sprintf(Str2, "signal_%d", SignalIndex);
				do
				{
					for (InputIndex = 0;InputIndex < Circuit->NumberOfInputs;InputIndex++)
						if (!strcmp(Circuit->Signals[Circuit->Inputs[InputIndex]]->Name, Str2))
						{
							strcat(Str2, "_");
							break;
						}
				} while (InputIndex < Circuit->NumberOfInputs);

				do
				{
					for (OutputIndex = 0;OutputIndex < Circuit->NumberOfOutputs;OutputIndex++)
						if (!strcmp(Circuit->Signals[Circuit->Outputs[OutputIndex]]->Name, Str2))
						{
							strcat(Str2, "_");
							break;
						}
				} while (OutputIndex < Circuit->NumberOfOutputs);

				free(Circuit->Signals[SignalIndex]->Name);
				Circuit->Signals[SignalIndex]->Name = (char*)malloc((strlen(Str2) + 1) * sizeof(char));
				strcpy(Circuit->Signals[SignalIndex]->Name, Str2);
				fprintf(OutputFile, "    wire %s ;\n", Str2);
			}
		}

	//---- writing the Circuit->Cells ---//
	fprintf(OutputFile, "\n");

	if (WriteInOrder)
	{
		for (DepthIndex = 0;DepthIndex <= Circuit->MaxDepth;DepthIndex++)
		{
			fprintf(OutputFile, "    /* cells in depth %d */\n", DepthIndex);
			for (TempIndex = 0;TempIndex < Circuit->NumberOfCellsInDepth[DepthIndex];TempIndex++)
			{
				CellIndex = Circuit->CellsInDepth[DepthIndex][TempIndex];
				WriteVerilgCell(OutputFile, CellIndex, Scheme, SecurityOrder, KeepOriginalNames, WriteDepths, MakePipeline, Library, Circuit);
			}
			fprintf(OutputFile, "\n");
		}

		if (Circuit->NumberOfRegs > 0)
			fprintf(OutputFile, "    /* register cells */\n");

		for (RegIndex = 0;RegIndex < Circuit->NumberOfRegs;RegIndex++)
		{
			CellIndex = Circuit->Regs[RegIndex];
			WriteVerilgCell(OutputFile, CellIndex, Scheme, SecurityOrder, KeepOriginalNames, WriteDepths, MakePipeline, Library, Circuit);
		}
	}
	else
		for (CellIndex = 0;CellIndex < Circuit->NumberOfCells;CellIndex++)
			WriteVerilgCell(OutputFile, CellIndex, Scheme, SecurityOrder, KeepOriginalNames, WriteDepths, MakePipeline, Library, Circuit);

	fprintf(OutputFile, "endmodule\n");
	fclose(OutputFile);

	free(FileNamePostfix);
	free(OutputVerilogFileName);
	free(Str1);
	free(Str2);
}
