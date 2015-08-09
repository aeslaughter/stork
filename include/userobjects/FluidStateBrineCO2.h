/****************************************************************/
/* MOOSE - Multiphysics Object Oriented Simulation Environment  */
/*                                                              */
/*          All contents are licensed under LGPL V2.1           */
/*             See LICENSE for full restrictions                */
/****************************************************************/

#ifndef FLUIDSTATEBRINECO2_H
#define FLUIDSTATEBRINECO2_H

#include "FluidProperties.h"
#include "FluidPropertiesBrine.h"
#include "FluidPropertiesCO2.h"
#include "FluidState.h"
#include "RelativePermeability.h"
#include "CapillaryPressure.h"

class FluidStateBrineCO2;


template<>
InputParameters validParams<FluidState>();

class FluidStateBrineCO2 : public FluidState
{
 public:
  FluidStateBrineCO2(const InputParameters & parameters);

  /**
   * Number of fluid phases
   *
   * @return number of fluid phases
   */
  virtual unsigned int numPhases() const;

  /**
   * Number of components
   *
   * @return number of components
   */
  virtual unsigned int numComponents() const;

 /**
   * Is the simulation isothermal?
   *
   * @return boolean isIsothermal
   */
  virtual bool isIsothermal() const;

  /**
   *  Temperature for isothermal simulations
   *
   * @return temperature (C)
   */
  virtual Real temperature() const;

  /**
   * List of primary variable names
   */
  virtual std::vector<std::string> variableNames() const;

  /**
   * List of primary variable names
   */
  virtual std::vector<std::string> variableTypes() const;

  /**
    * List of phase index for each variable
   */
  virtual std::vector<unsigned int> variablePhase() const;

  /**
   * Fluid density using FluidPropertiesBrine and FluidPropertiesCO2 UserObjects.
   *
   * @param pressure phase pressure (Pa)
   * @param temperature temperature (C)
   * @param phase_index phase index
   * @return fluid density (kg/m^3)
   */
  Real density(Real pressure, Real temperature, unsigned int phase_index) const;

  /**
   * Fluid viscosity must be over-written in all derived classes.
   *
   * @param pressure pressure (Pa)
   * @param temperature temperature (C)
   * @param phase_index phase index
   * @return liquid viscosity (Pa.s)
   */
  virtual Real viscosity(Real pressure, Real temperature, unsigned int phase_index) const;

  /**
   * Mass fractions for each component in each phase.
   * 2D vector - one row for each component, one column
   * for each phsae.
   *
   * @return mass fracions (-)
   */
  virtual std::vector<std::vector<Real> > massFractions(Real pressure, Real temperature) const;

  /**
   * Relative permeabilities of each phase
   *
   * @param saturation liquid saturation
   * @return relative permeabilities for each phase (-)
   */
  virtual std::vector<Real> relativePermeability(Real liquid_saturation) const;

  /**
   * Pressure of liquid phase
   *
   * @param pressure gas pressure (Pa)
   * @param saturation liquid saturation (-)
   * @return pressure liquid phase pressure (Pa)
   */
  virtual std::vector<Real> pressure(Real gas_pressure, Real liquid_saturation) const;

  /**
   * Derivative of capillary pressure for each phase with respect to the
   * liquid saturation
   *
   * @param saturation liquid saturation (-)
   * @return derivative of capillary pressure (Pa)
   */
  virtual std::vector<Real> dCapillaryPressure(Real liquid_saturation) const;

  /**
   * Saturation of gas phase
   *
   * @param saturation liquid saturation (-)
   * @return saturation gas phase saturation (-)
   */
  virtual std::vector<Real> saturation(Real liquid_saturation) const;

  /**
   * Derivative of fluid  density with respect to fluid pressure.
   *
   * @param pressure fluid pressure (Pa)
   * @param temperature fluid temperature (C)
   * @param xmass vector of component mass fractions (kg/kg)
   * @return fluid density vector (element for each phase) (kg/m^3)
   */
  virtual std::vector<Real> dDensity_dP(Real pressure, Real temperature) const;

  /**
   * General formulation for Henry's constant for gas solubility in
   * water. Eq. (3) from Guidelines on the Henry's constant and vapour
   * liquid distribution constant for gases in H20 and D20 at high
   * temperatures, IAPWS (2004).
   *
   * @param temperature water temperature (C)
   * @return Kh Henry's constant (MPa)
   */
  virtual Real henry(Real temperature) const;

  /**
   * Loop over all nodes and calculate the required thermophysical
   * properties.
   */
  virtual void execute();

  /**
   * Return pressure for each phase at each node.
   *
   * @param node_num node number
   * @param phase_index index of phase
   * @return phase pressure at the node (Pa)
   */
  virtual Real getPressure(unsigned int node_num, unsigned int phase_index) const;
  /**
   * Return saturation for each phase at each node.
   *
   * @param node_num node number
   * @param phase_index index of phase
   * @return phase saturation at the node (-)
   */
  virtual Real getSaturation(unsigned int node_num, unsigned int phase_index) const;

  /**
   * Return density for each phase at each node.
   *
   * @param node_num node number
   * @param phase_index index of phase
   * @return phase density at the node (kg/m^3)
   */
  virtual Real getDensity(unsigned int node_num, unsigned int phase_index) const;

  /**
   * Return viscosity for each phase at each node.
   *
   * @param node_num node number
   * @param phase_index index of phase
   * @return phase viscosity at the node (Pa/s)
   */
  virtual Real getViscosity(unsigned int node_num, unsigned int phase_index) const;

  /**
   * Return relative permeability for each phase at each node.
   *
   * @param node_num node number
   * @param phase_index index of phase
   * @return relative permeability at the node (-)
   */
  virtual Real getRelativePermeability(unsigned int node_num, unsigned int phase_index) const;

  /**
   * Return mass fraction for each component in each phase at each node.
   *
   * @param node_num node number
   * @param phase_index index of phase
   * @param component_index index of the component
   * @return component mass fraction at the node (-)
   */
  virtual Real getMassFraction(unsigned int node_num, unsigned int phase_index, unsigned int component_index) const;

 protected:

  /**
   * This is the member reference that will hold the User Object
   * value for brine properties.
   */
  const FluidPropertiesBrine & _brine_property;

  /**
   * This is the member reference that will hold the User Object
   * value for CO2 properties.
   */
  const FluidPropertiesCO2 & _co2_property;

  /**
   * This is the member reference that will hold the User Object
   * value for relative permeabilities.
   */
  const RelativePermeability & _relative_permeability;

  /**
   * This is the member reference that will hold the User Object
   * value for capillary pressure.
   */
  const CapillaryPressure & _capillary_pressure;

  /// Primary pressure variable
  VariableValue & _pressure;
  /// Primary temperature variable
  VariableValue & _temperature;
  /// Primary saturation variable
  VariableValue & _saturation;

  bool _is_isothermal;

  /// Fluid state properties class to hold thermophysical properties at
  /// each node
  std::vector<FluidStateProperties> _fsp;

};

#endif // FLUIDSTATEBRINECO2_H