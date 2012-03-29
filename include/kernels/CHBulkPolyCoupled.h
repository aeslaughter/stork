/*************************************************************************
*
*  Welcome to HYRAX!
*  Andrea M. Jokisaari
*  CASL/MOOSE
*
*  12 March 2012
*
*************************************************************************/

#ifndef CHBULKPOLYCOUPLED_H
#define CHBULKPOLYCOUPLED_H

#include "CHBulk.h"

// Forward Declaration
class CHBulkPolyCoupled;

template<>
InputParameters validParams<CHBulkPolyCoupled>();

/**
 * * CHBulkPolyCoupled couples the bulk Cahn-Hilliard equation term with conserved variable c
 * to multiple order parameters tracked using multiple Alan-Cahn equations.  It uses the
 * PFMobilityLandau materials class.
 */

class CHBulkPolyCoupled : public CHBulk
{
public:
  CHBulkPolyCoupled(const std::string & name, InputParameters parameters);

protected:
  virtual RealGradient computeGradDFDCons(PFFunctionType type, Real c, RealGradient grad_c);
  
  
private:

  MaterialProperty<Real> & _a1;  ///< Landau polynomial parameters (see Guo, 2008)
  MaterialProperty<Real> & _a2;
  MaterialProperty<Real> & _c1;  ///< position-ish of 1st energy well in c-space (terminal solid solubility)

  int _n_OP_variables;
  
  std::vector<VariableValue *>  _coupled_OP_variables;  ///< Allen-Cahn equation variable (order parameter, probably)
  std::vector<VariableGradient *>  _coupled_OP_grads;  ///< gradient of AC variable

};

#endif //CHBULKPOLYCOUPLED_H
