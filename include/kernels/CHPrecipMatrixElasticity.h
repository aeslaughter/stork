/*************************************************************************
*
*  Welcome to HYRAX!
*  Andrea M. Jokisaari
*  CASL/MOOSE
*
*  14 February 2014
*
*************************************************************************/

#ifndef CHPRECIPMATRIXELASTICITY_H
#define CHPRECIPMATRIXELASTICITY_H

#include "SplitCHCRes.h"
#include "ElasticityTensorR4.h"
#include "RankTwoTensor.h"

class CHPrecipMatrixElasticity;

template<>
InputParameters validParams<CHPrecipMatrixElasticity>();

class CHPrecipMatrixElasticity : public SplitCHCRes
{
public:

  CHPrecipMatrixElasticity(const std::string & name, InputParameters parameters);

protected:

  virtual Real computeDFDC(PFFunctionType type);
  virtual Real computeQpOffDiagJacobian(unsigned int jvar);

  // system elasticity tensor, varies in space
  MaterialProperty<ElasticityTensorR4> & _elasticity_tensor;
  MaterialProperty<std::vector<ElasticityTensorR4> > & _dn_elasticity_tensor;

  MaterialProperty<RankTwoTensor> & _elastic_strain;
  MaterialProperty<RankTwoTensor> & _dc_misfit_strain;
  MaterialProperty<std::vector<RankTwoTensor> > & _dn_misfit_strain;
  MaterialProperty<std::vector<RankTwoTensor> > & _dcdn_misfit_strain;

  Real _scaling_factor;

  unsigned int _n_OP_vars;
  std::vector<unsigned int> _n_var;
  std::vector<VariableValue *> _OP;

  unsigned int _w_var;
  unsigned int _T_var;

private:

};

#endif //ACPRECIPMATRIXELASTICITY_H