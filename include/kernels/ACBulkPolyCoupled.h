/*************************************************************************
*
*  Welcome to HYRAX!
*  Andrea M. Jokisaari
*  CASL/MOOSE
*
*  8 March 2012
*
*************************************************************************/

#ifndef ACBULKPOLYCOUPLED_H
#define ACBULKPOLYCOUPLED_H

#include "ACBulkCoupled.h"

// Forward Declaration
class ACBulkPolyCoupled;

template<>
InputParameters validParams<ACBulkPolyCoupled>();

/**
 * ACBulkPolyCoupled couples the bulk Allen-Cahn equation term with order parameter eta
 * to the conserved field variable term from the Cahn-Hilliard equation.  It also couples
 * with multiple order parameters.  It uses the PFMobilityLandau materials class.
 */

class ACBulkPolyCoupled : public ACBulkCoupled
{
public:
  ACBulkPolyCoupled(const std::string & name, InputParameters parameters);

protected:
  virtual Real computeDFDOP(PFFunctionType type);

  unsigned int _n_OP_vars;
  unsigned int _OP_number;

  MaterialProperty<Real> & _a5;
  MaterialProperty<Real> & _a6;
  MaterialProperty<Real> & _a7;

  std::vector<VariableValue *> _coupled_OP_vars;

private:

};


#endif //ACBULKPOLYCOUPLED_H