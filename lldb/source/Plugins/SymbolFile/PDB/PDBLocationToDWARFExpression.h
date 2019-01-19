//===-- PDBLocationToDWARFExpression.h --------------------------*- C++ -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#ifndef lldb_Plugins_SymbolFile_PDB_PDBLocationToDWARFExpression_h_
#define lldb_Plugins_SymbolFile_PDB_PDBLocationToDWARFExpression_h_

#include "lldb/Core/Module.h"

namespace lldb_private {
class DWARFExpression;
}

namespace llvm {
namespace pdb {
class PDBSymbolData;
}
} // namespace llvm

//------------------------------------------------------------------------------
/// Converts a location information from a PDB symbol to a DWARF expression
///
/// @param[in] module
///     The module \a symbol belongs to.
///
/// @param[in] symbol
///     The symbol with a location information to convert.
///
/// @param[out] is_constant
///     Set to \b true if the result expression is a constant value data,
///     and \b false if it is a DWARF bytecode.
///
/// @return
///     The DWARF expression corresponding to the location data of \a symbol.
//------------------------------------------------------------------------------
lldb_private::DWARFExpression
ConvertPDBLocationToDWARFExpression(lldb::ModuleSP module,
                                    const llvm::pdb::PDBSymbolData &symbol,
                                    bool &is_constant);
#endif
