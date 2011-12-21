/*************************************************************************
*
*  Welcome to HYRAX!
*  Andrea M. Jokisaari
*  CASL/MOOSE
*
*  14 December 2011
*  
*************************************************************************/

#ifndef AUXNUCLEATIONPROBABILITY_H
#define AUXNUCLEATIONPROBABILITY_H

#include "AuxKernel.h"

class AuxNucleationProbability;

template<>
InputParameters validParams<AuxNucleationProbability>();

/**
 *  AuxNucleationProbability handles the nucleation probability (P_nm) calculation in the concurrent
 *  nucleation and growth algorithm first proposed by J.P. Simmons (2000).  
 *  Returns the nucleation probability over the domain.
 */

class AuxNucleationProbability : public AuxKernel
{
public:
  AuxNucleationProbability(const std::string & name, InputParameters params);

protected:
  /**
   * computeValue()
   * @return returns the nucleation probability for each element, p_nm = 1 - exp(-1*j_star*dt) 
   */ 
 
  virtual Real computeValue();

private:
  VariableValue & _coupled_nuc_rate;  ///< nucleation rate for the nucleation probability calculation
};

#endif //AUXNUCLEATIONPROBABILITY_H
