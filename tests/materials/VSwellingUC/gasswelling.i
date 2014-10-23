# Tests material model SolidSwellingUC for the calculation of swelling due to 
#  gaseous fission products
#
# The test is a single element unit cube with a fission rate of 1e20. The simulation is
#  run for 60 1e6 timesteps. The calculated volume should be the same as the Buck volume
#  EXCEPT in zone 1. The swelling should remain the same after zone 1 is crossed.
#
# The following is a comparison of BUCK to a excel hand calc:
#            
# time      zone      Vol (Buck)  Vol (Calc)  diff [%]
# 1.00E+07  4.00E+00  1.0169E+00  1.016934666 0.000622827
# 2.00E+07  3.00E+00  1.0739E+00  1.073859885 0.006063634
# 3.00E+07  3.00E+00  1.1594E+00  1.159255013 0.015698591
# 4.00E+07  3.00E+00  1.2573E+00  1.257005378 0.026063661
# 5.00E+07  1.00E+00  1.3312E+00  
# 6.00E+07  1.00E+00  1.3312E+00 


[GlobalParams]
  density = 12267.0
[]

[Mesh]
  file = cube.e
  displacements = 'disp_x disp_y disp_z'
[]

[Variables]
  [./disp_x]
    order = FIRST
    family = LAGRANGE
  [../]
  [./disp_y]
    order = FIRST
    family = LAGRANGE
  [../]
  [./disp_z]
    order = FIRST
    family = LAGRANGE
  [../]
  [./temp]
    order = FIRST
    family = LAGRANGE
    initial_condition = 1200.0
  [../]
[]

[Kernels]
  [./heat]
    type = HeatConduction
    variable = temp
  [../]
  [./heat_ie]
    type = HeatConductionTimeDerivative
    variable = temp
  [../]
[]

[AuxVariables]
  [./fission_rate]
    order = FIRST
    family = LAGRANGE
  [../]
  [./burnup]
    order = FIRST
    family = LAGRANGE
  [../]
[]

[SolidMechanics]
  [./solid]
    disp_x = disp_x
    disp_y = disp_y
    disp_z = disp_z
  [../]
[]

[AuxKernels]
  [./fsnrt]
    type = FissionRateAux
    block = 1
    variable = fission_rate
    value = 1e20
  [../]
  [./burnup]
    type = BurnupAux
    variable = burnup
    block = 1
    fission_rate = fission_rate
  [../]
[]

[BCs]
  [./bottom_fix_y]
    type = DirichletBC
    variable = disp_y
    boundary = 4
    value = 0.0
  [../]
  [./fix_z]
    type = DirichletBC
    variable = disp_z
    boundary = '5'
    value = 0.0
  [../]
  [./fix_x]
    type = DirichletBC
    variable = disp_x
    boundary = '1'
    value = 0.0
  [../]
[]

[Materials]
  [./mechUC]
    type = Elastic
    block = 1
    disp_x = disp_x
    disp_y = disp_y
    disp_z = disp_z
    youngs_modulus = 2.e11
    poissons_ratio = .3
    thermal_expansion = 0
  [../]
  [./VSwellingUC]
    type = VSwellingUC
    block = 1
    burnup = burnup
    temp = temp
    calculate_gas_swelling = true
    solid_factor = 0
  [../]
  [./thermal]
    type = HeatConductionMaterial
    block = 1
    specific_heat = 1.0
    thermal_conductivity = 100.
  [../]
  [./density]
    type = Density
    block = 1
    disp_x = disp_x
    disp_y = disp_y
    disp_z = disp_z
  [../]
  [./zone_mat]
    type = ZonalUC
    block = 1
    temp = temp
    fission_rate = fission_rate
    burnup = burnup
    outputs = all
    nitrogen_fraction = 0.5
    frac_rel_zone1 = 0.7
    frac_rel_zone3 = 0.15
    frac_rel_zone4 = 0.1
    burnup_threshold = 0.001
  [../]
[]


[Executioner]

  type = Transient

  solve_type = PJFNK

  petsc_options = '-snes_ksp_ew'
  petsc_options_iname = '-ksp_gmres_restart'
  petsc_options_value = '101'

  line_search = 'none'

  l_max_its = 100
  nl_max_its = 100
  nl_rel_tol = 1e-4
  nl_abs_tol = 1e-4
  l_tol = 1e-5
  start_time = 0.0
  num_steps = 60
  dt = 1e6

[]


[Postprocessors]
  [./burnup]
    type = ElementAverageValue
    block = 1
    variable = burnup
  [../]
  [./volume]
    type = VolumePostprocessor
    use_displaced_mesh = true
  [../]
  [./zone]
    type = ElementAverageValue
    block = 1
    variable = zone
  [../]
  [./T2]
    type = ElementAverageValue
    block = 1
    variable = T2
  [../]
[]


[Outputs]
  file_base = gasswelling_out
  output_initial = false
  csv = false
  interval = 10
  [./exodus]
    type = Exodus
    elemental_as_nodal = true
  [../]
  [./console]
    type = Console
    perf_log = true
    linear_residuals = true
  [../]
[]
