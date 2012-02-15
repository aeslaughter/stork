[Mesh]
  type = GeneratedMesh
  dim = 2
  nx = 20
  ny = 20
  nz = 0
  xmin = 0
  xmax = 20
  ymin = 0
  ymax = 20
  zmin = 0
  zmax = 0
  elem_type = QUAD4
  uniform_refine = 1
[]

[Variables]
#  active = 'concentration n1 dispx dispy'

  [./concentration]
    order = THIRD
    family = HERMITE
    [./InitialCondition]
      type = SmoothCircleIC
      var_name = concentration
      invalue = 0.6
      outvalue = 0.1
      radius = 2.0
      int_width = 1.5
      x1 = 10
      y1 = 10
    [../]
  [../]

  [./n1]
    order = FIRST
    family = LAGRANGE
    [./InitialCondition]
      type = SmoothCircleIC
      var_name = n1
      invalue = 1.6
      outvalue = 0.0
      radius = 2.0
      int_width = 1.5
      x1 = 10
      y1 = 10
    [../]
  [../]

  [./dispx]
    order = FIRST
    family = LAGRANGE
  [../]

  [./dispy]
    order = FIRST
    family = LAGRANGE
  [../]
[]

[Kernels]
#  active = 'dcdt dn1dt CHSolid CHInterface ACSolid ACInterface'

  [./dcdt]
    type = TimeDerivative
    variable = concentration
  [../]

  [./dn1dt]
    type = TimeDerivative
    variable = n1
  [../]

  [./CHSolid]
    type = CHBulkCoupled
    variable = concentration
    mob_name = M
    coupled_var = n1
    first_landau = A1
    second_landau = A2
    first_well = C1
  [../]

  [./CHInterface]
    type = CHInterface
    variable = concentration
    kappa_name = kappa_c
    mob_name = M
    grad_mob_name = grad_M
  [../]

  [./ACSolid]
    type = ACBulkCoupled
    variable = n1
    mob_name = L
    coupled_var = concentration
    second_landau = A2
    third_landau = A3
    fourth_landau = A4
    second_well = C2
  [../]

  [./ACInterface]
    type = ACInterface
    variable = n1
    mob_name = L
    kappa_name = kappa_n
  [../]

  [./ACTransformElasticDF]
    type = ACTransformElasticDF
    variable = n1
    var_names = ''
    n_vars = 0
    OP_number = 0
  [../]

  [./stress_div_disp_x]
    type = StressDivergence
    variable = dispx
    component = 0
  [../]

  [./stress_div_disp_y]
    type = StressDivergence
    variable = dispy
    component = 1
  [../]
[]

[BCs]
active = 'Periodic'
  [./Periodic]
    [./left_right]
      primary = 0
      secondary = 2
      translation = '0 20 0'
    [../]

    [./top_bottom]
      primary = 1
      secondary = 3
      translation = '-20 0 0'
    [../]

#    [./front_back]
#      primary = 1
#      secondary = 3
#      translation = '0 50 0'
#    [../]

  [../]
[]

[Materials]
  [./constant]
    type = PFMobilityLandau
    block = 0
    mob_CH = 0.4
    mob_AC = 0.4
    kappa_CH = 1.5
    kappa_AC = 1.5
    A1 = 18.5
    A2 = -8.5
    A3 = 11.5
    A4 = 4.5
    C1 = 0.006
    C2 = 0.59
  [../]

  [./test_material]
    type = LinearSingleCrystalPrecipitateMaterial
    block = 0
    disp_x = dispx
    disp_y = dispy
    C_matrix = '155.4 68.03 64.60 155.4 64.6 172.51 36.31 36.31 44.09'
    C_precipitate = '155.4 68.03 64.60 155.4 64.6 172.51 36.31 36.31 44.09'
    e_precipitate = '0.00551 0.0564 0.0570 0.0 0.0 0.0'
    n_variants = 1
    variable_names = 'n1'
    all_21 = false
  [../]
[]

[Executioner]
  type = Transient
  scheme = 'crank-nicolson'
  petsc_options = '-snes_mf_operator -ksp_monitor'

  petsc_options_iname = '-pc_type -pc_hypre_type -ksp_gmres_restart'
  petsc_options_value = 'hypre boomeramg 101'

  l_max_its = 30
  nl_max_its = 150

  start_time = 0.0
  num_steps = 1
  dt = 0.000003
[]

[Output]
  file_base = test_solid_mech
  output_initial = true
  interval = 1
  exodus = true
  perf_log = true
[]