#pragma once

struct CellTypeStruct {
	char	GateOrReg;
	int		Type;
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
	char*   PrintName;  // for the verilog file and cells with the same name but different generics
	char*   Generic;    // for the verilog file and cells with the same name but different generics
};


struct CellStruct {
	int		Type;
	char*	Name;
	char*   Generic;
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
	char    WireType;
	short	Depth;
	int		Output;
	int		NumberOfInputs;
	int*	Inputs;
	char*   Attribute;
	char	ToBeSecured;
	char	ToBeBalanced;
	int		NextShare;
	int     NextRail;
	int     NextPhase;
	char	Printed;
	char	Deleted;
};

struct LibraryStruct {
	CellTypeStruct**	CellTypes = NULL;
	int					NumberOfCellTypes          =  0;
	int					BufferCellType             = -1;
	int					RegBufferCellType          = -1;
	int					RegSCABufferCellType       = -1;
	int					ClockGatingCellType        = -1;
	int                 LMDPL_PrechargeCellType    = -1;
	int                 LMDPL_RegPrechargeCellType = -1;
	int                 LMDPL_ClockControlCellType = -1;
	int                 LMDPL_Reg_sr_CellType      = -1;
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

	int			 LMDPL_PowerUpResetSignalIndex = -1;
	int			 LMDPL_PreCharge1SignalIndex = -1;
	int			 LMDPL_PreCharge2SignalIndex = -1;
	int			 LMDPL_MiddleResetSignalIndex = -1;
};

struct FileBufferStruct {
	char* Buffer;
	int   Size;
	int   Index;
};