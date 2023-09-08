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

#include "eval.h"
#include "Translation.h"

#include <vector>
#include <string>
#include <fstream>
#include <iostream>

#include "conversion.hpp"

int main(int argc, char *argv[])
{
	char* LibraryFileName = (char *)malloc(Max_Name_Length * sizeof(char));
	char* LibraryPath = (char *)malloc(Max_Name_Length * sizeof(char));
	char* LibraryName = (char *)malloc(Max_Name_Length * sizeof(char));
	char* InputVerilogFileName = (char *)malloc(Max_Name_Length * sizeof(char));
	char* MainModuleName = (char *)malloc(Max_Name_Length * sizeof(char));
	char* Method = (char *)malloc(Max_Name_Length * sizeof(char));
	char* Scheme = (char *)malloc(Max_Name_Length * sizeof(char));
	char* OrderText = (char *)malloc(Max_Name_Length * sizeof(char));

	LibraryFileName[0] = 0;
	InputVerilogFileName[0] = 0;
	Method[0] = 0;
	Scheme[0] = 0;
	OrderText[0] = 0;

	char  MakePipeline = 1;
	char  KeepOriginalNames = 1;
	char  WriteInOrder = 1;
	char  WriteDepths = 0;
	char  SecurityOrder; // d > 0 (1: first-order security with 2 shares)
	char  SeparateUnmaskedModule = 0;
	int   i;

	if (argc > 1)
	{
		if ((!strcmp(argv[1], "-h")) || (!strcmp(argv[1], "-?")) || (!strcmp(argv[1], "/?")) || (!strcmp(argv[1], "-help")))
		{
			printf("usage:\n");
			printf("AGEMA.exe [-lf/-libraryfile ?] [-df/-designfile     ?]\n");
			printf("          [-mn/-modulename  ?] [-mt/-method ?] [-sc/-scheme ?]\n");
			printf("          [-so/-order       ?] [options]\n");
			printf("\n");
			printf("-mt/-method <x>  : naive     -> using the given netlist\n");
			printf("                 : AIG       -> using the And-Inverter Graph to generate the netlist\n");
			printf("                 : BDDsylvan -> using BDD (Sylvan library) to generate mux-based netlist\n");
			printf("                 : BDDcudd   -> using BDD (CUDD library) library to generate mux-based netlist\n");
			printf("                 : ANF       -> using Algebraic Normal Form to generate the netlist (only for GHPC and GHPCLL)\n");
			printf("\n");
			printf("-sc/-scheme <x>  : HPC1      -> Hardware Private Circuit\n");
			printf("                 : HPC2      -> Hardware Private Circuit II\n");
			printf("                 : HPC3      -> Hardware Private Circuit III\n");
			printf("                 : GHPC      -> Generic Hardware Private Circuit\n");
			printf("                 : GHPCLL    -> Generic Hardware Private Circuit with Low Latency\n");
			printf("                 : COMAR     -> Composable Gadgets with Reused Fresh Masks\n");
			printf("\n");
			printf("\n");
			printf("options:\n");
			printf("-cg/-clockgating : the resulting circuit uses clock gating, default is to make a pipeline circuit\n");
			printf("-nn/-newnames    : signals and cells are renamed freshly, default is to keep original names for naive method\n");
			printf("-no/-noorder     : the cells are written not based on their logic depth, default is to wite them in order\n");
			printf("-wd/-writedepth  : the logic depth of each cell is written, default is to not write the depth\n");
			printf("-su/-sepunmasked : make a separate module for the unmasked part of the design, default is not to do so\n");
			return 0;
		}
	}

	i = 1;
	while (i < argc)
	{
		if ((!strcmp(argv[i], "-lf")) || (!strcmp(argv[i], "-libraryfile")))
		{
			i++;
			if (i < argc)
				strcpy(LibraryFileName, argv[i++]);
			else
			{
				printf("arguments for \"%s\" not complete\n", argv[i - 1]);
				return 1;
			}
		}
		else if ((!strcmp(argv[i], "-df")) || (!strcmp(argv[i], "-designfile")))
		{
			i++;
			if (i < argc)
				strcpy(InputVerilogFileName, argv[i++]);
			else
			{
				printf("arguments for \"%s\" not complete\n", argv[i - 1]);
				return 1;
			}
		}
		else if ((!strcmp(argv[i], "-mn")) || (!strcmp(argv[i], "-modulename")))
		{
			i++;
			if (i < argc)
				strcpy(MainModuleName, argv[i++]);
			else
			{
				printf("arguments for \"%s\" not complete\n", argv[i - 1]);
				return 1;
			}
		}
		else if ((!strcmp(argv[i], "-mt")) || (!strcmp(argv[i], "-method")))
		{
			i++;
			if (i < argc)
			{
				strcpy(Method, argv[i++]);

				if (strcmp(Method, "naive") &&
					strcmp(Method, "AIG") &&
					strcmp(Method, "BDDsylvan") &&
					strcmp(Method, "BDDcudd") &&
					strcmp(Method, "ANF"))
				{
					printf("method \"%s\" not known\n", Method);
					return 1;
				}
			}
			else
			{
				printf("arguments for \"%s\" not complete\n", argv[i - 1]);
				return 1;
			}
		}
		else if ((!strcmp(argv[i], "-sc")) || (!strcmp(argv[i], "-scheme")))
		{
			i++;
			if (i < argc)
			{
				strcpy(Scheme, argv[i++]);

				if (strcmp(Scheme, "HPC1") &&
					strcmp(Scheme, "HPC2") &&
					strcmp(Scheme, "HPC3") &&
					strcmp(Scheme, "GHPC") &&
					strcmp(Scheme, "GHPCLL") &&
					strcmp(Scheme, "COMAR"))
				{
					printf("scheme \"%s\" not known\n", Scheme);
					return 1;
				}
			}
			else
			{
				printf("arguments for \"%s\" not complete\n", argv[i - 1]);
				return 1;
			}
		}
		else if ((!strcmp(argv[i], "-so")) || (!strcmp(argv[i], "-order")))
		{
			i++;
			if (i < argc)
				strcpy(OrderText, argv[i++]);
			else
			{
				printf("arguments for \"%s\" not complete\n", argv[i - 1]);
				return 1;
			}
		}
		else if ((!strcmp(argv[i], "-cg")) || (!strcmp(argv[i], "-clockgating")))
		{
			MakePipeline = 0;
			i++;
		}
		else if ((!strcmp(argv[i], "-nn")) || (!strcmp(argv[i], "-newnames")))
		{
			KeepOriginalNames = 0;
			i++;
		}
		else if ((!strcmp(argv[i], "-no")) || (!strcmp(argv[i], "-noorder")))
		{
			WriteInOrder = 0;
			i++;
		}
		else if ((!strcmp(argv[i], "-wd")) || (!strcmp(argv[i], "-writedepth")))
		{
			WriteDepths = 1;
			i++;
		}
		else if ((!strcmp(argv[i], "-su")) || (!strcmp(argv[i], "-sepunmasked")))
		{
			SeparateUnmaskedModule = 1;
			i++;
		}
		else
		{
			printf("argument \"%s\" not known\n", argv[i]);
			return 1;
		}
	}

	if (!LibraryFileName[0])
	{
		strcpy(LibraryFileName, "Library.txt");
		printf("default libraryfile \t\"%s\" \tis taken\n", LibraryFileName);
	}

	if (!InputVerilogFileName[0])
	{
		strcpy(InputVerilogFileName, "design.v");
		printf("default designfile \t\"%s\" \tis taken\n", InputVerilogFileName);
	}

	if (!MainModuleName[0])
	{
		strcpy(MainModuleName, "Cipher");
		printf("default modulename \t\"%s\" \tis taken\n", MainModuleName);
	}

	if (!Method[0])
	{
		strcpy(Method, "naive");
		printf("default method         \t\"%s\"       \tis taken\n", Method);
	}

	if (!Scheme[0])
	{
		if (strcmp(Method, "ANF"))
			strcpy(Scheme, "HPC2");
		else
			strcpy(Scheme, "GHPC");

		printf("default scheme         \t\"%s\"       \tis taken\n", Scheme);
	}

	if (!OrderText[0])
	{
		strcpy(OrderText, "1");
		printf("default security order \t\"%s\"       \tis taken\n", OrderText);
	}

	SecurityOrder = atoi(OrderText);
	if (SecurityOrder < 1)
	{
		printf("given security order \"%s\" is not valid (should be larger than 0)\n", OrderText);
		return 1;
	}

	//--------------------------------------

	if (((!strcmp(Scheme, "GHPC")) || (!strcmp(Scheme, "GHPCLL")) ||
		 (!strcmp(Scheme, "COMAR"))) &&
		(SecurityOrder > 1))
	{
		printf("schemes GHPC, GHPCLL, and COMAR support only first-order security\n");
		return 1;
	}

	if ((!strcmp(Method, "ANF")) &&
		(strcmp(Scheme, "GHPC") && strcmp(Scheme, "GHPCLL")))
	{
		printf("method ANF can only be comabined with schemes GHPC and GHPCLL\n");
		return 1;
	}

	strcpy(LibraryName, Scheme);

	//---------------------------------------------------------------------------------------------//

	char*   CustomFileName = (char *)malloc(Max_Name_Length * sizeof(char));

	//---------------------------------------------------------------------------------------------//
	//------------------- reading the library file ------------------------------------------------//
	int res;
	LibraryStruct Library;

	res = ReadLibraryFile(LibraryFileName, LibraryName, 0, &Library, SecurityOrder);
	if (!res)
		res = ReadLibraryFile(LibraryFileName, LibraryName, 1, &Library, SecurityOrder);

	//---------------------------------------------------------------------------------------------//
	//------------------- reading the design file -------------------------------------------------//

	CircuitStruct  Circuit;
	CircuitStruct* CircuitPtr = NULL;
	char           LowLatency;

	if (!res)
		res = ReadDesignFile(InputVerilogFileName, MainModuleName, &Library, &Circuit, (char*)ToolName, Scheme);

	//---------------------------------------------------------------------------------------------//
	//------------------- Processing the circuit --------------------------------------------------//

	if (!res)
	{
		if (!strcmp(Method, "naive"))
			CircuitPtr = &Circuit;
		else if ((!strcmp(Method, "AIG")) ||
			(!strcmp(Method, "BDDsylvan")) ||
			(!strcmp(Method, "BDDcudd")) ||
			(!strcmp(Method, "ANF")))
		{
			CircuitStruct  SecureCombCircuit;

			KeepOriginalNames = 0;
			res = ReadDesignFile(InputVerilogFileName, MainModuleName, &Library, &SecureCombCircuit, (char*)ToolName, Scheme, 0);

			if (!res)
				res = ExtractSecureCombinatorial(&Library, &Circuit, &SecureCombCircuit, Method);

			if (!res)
				res = WriteCustomizedFile(InputVerilogFileName, &Library, &SecureCombCircuit, CustomFileName);

			if (!res)
			{
				printf("netlist file is written for step2\n");

				//********** run the middle program *****//

				LowLatency = !strcmp(Scheme, "GHPCLL");
				strcpy(LibraryPath, LibraryFileName);
				for (i = strlen(LibraryPath) - 1;i >= 0;i--)
					if ((LibraryPath[i] == '/') || (LibraryPath[i] == '\\'))
						break;

				LibraryPath[i + 1] = 0;

				convert(std::string(CustomFileName), std::string(Method), LowLatency, MakePipeline, LibraryPath);

				remove(CustomFileName);

				res = ProcessStep2(InputVerilogFileName, MainModuleName, &Library, &Circuit, (char*)ToolName, Method, LowLatency);
				CircuitPtr = &Circuit;
			}
		}
	}

	if (!res)
		res = ApplyMasking(&Library, CircuitPtr, SecurityOrder, Scheme, MakePipeline);

	if (!res)
		WriteVerilogFile(InputVerilogFileName, MainModuleName, Method, Scheme, LibraryName,
			SecurityOrder, KeepOriginalNames, WriteInOrder, WriteDepths,
			MakePipeline, SeparateUnmaskedModule, &Library, CircuitPtr);

	free(LibraryFileName);
	free(LibraryPath);
	free(LibraryName);
	free(InputVerilogFileName);
	free(MainModuleName);
	free(Method);
	free(Scheme);
	free(OrderText);

	if (res)
	{
		printf("error\n");
		return 1;
	}
	else
	{
		printf("done\n");
		return 0;
	}
}

