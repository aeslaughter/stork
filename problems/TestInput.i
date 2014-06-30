[Mesh]
    type = GeneratedMesh

    dim = 3
    xmin = -10
    ymin = -10
    zmin = -2.5
    xmax = 10
    ymin = 10
    zmin = 2.5

    nx = 20
    ny = 20
    nz = 20
[]

[Variables]
  [./Temperature]
    order = FIRST
    family = LAGRANGE
    initial_condition = 500
  [../]
[]

[AuxVariables]
  active = ''
  [./HeatGeneration]
    order = CONSTANT
    family = MONOMIAL
    initial_condition = 0
  [../]
[]

[Functions]
  active = ''
  [./HeatGenerationFunction]
    type = PiecewiseLinear
    data_file = test.csv
    format = columns
    axis = 2
  [../]
[]

[Kernels]
  active = 'HeatConduction'
  [./HeatConduction]
    type = MatPropDiffusion
    variable = Temperature
    diffusivity = ThermalConductivity
  [../]

  [./RadiationHeatSource]
    type = RadiationHeatSource
    variable = Temperature
    PrimarySource = HeatGeneration
  [../]
[]

[AuxKernels]
  active = ''
  [./HeatGenerationRate]
    type = FunctionAux
    variable = HeatGeneration
    function = HeatGenerationFunction
  [../]
[]

[Materials]
  [./TopStructure]
    type = SahoteMaterial
    block = 0
    temperature = Temperature
    material_type = 316SS
  [../]
[]

[BCs]
  [./Air]
    type = CRUDCoolantNeumannBC
    variable = Temperature
    boundary = 'top bottom'
    T_coolant = 300
    h_convection_coolant = 50
  [../]

  [./Heat]
    type = DirichletBC
    variable = Temperature
    boundary = 'bottom'
    value = 500
  [../]
[]

[Preconditioning]
  [./smp]
    type = SMP
    full = true
  [../]
[]

[Executioner]
  type = Steady

  solve_type = PJFNK
  petsc_options_iname = '-pc_type -pc_hypre_type'
  petsc_options_value = 'hypre boomeramg'

  l_max_its = 100
  l_tol = 1e-5
  nl_rel_step_tol = 1e-50
  nl_rel_tol = 1e-6
  nl_abs_tol = 1e-11

#  [./Adaptivity]
#    steps = 1
#    refine_fraction = 0.4
#    coarsen_fraction = 0.02
#    max_h_level = 3
#    error_estimator = KellyErrorEstimator
#  [../]

[]

[Outputs]
  file_base = Sahote
  exodus = true
  perf_log = true
  all_var_norms = true
[]


