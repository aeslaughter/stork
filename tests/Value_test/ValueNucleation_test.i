# This input file is designed to test ValueNucleation kernel, which will is designed
# to be used for performing an L2 projection.

[Mesh]
  type = GeneratedMesh
  dim = 2
  nx = 25
  ny = 25
  nz = 0
  xmin = 0
  xmax = 100
  ymin = 0
  ymax = 100
  zmin = 0
  zmax = 0
  elem_type = QUAD4
 []

[Variables]
  [./diffused]
    order = FIRST
    family = LAGRANGE
    [./InitialCondition]
      type = SmoothCircleIC
      int_width = 1.5
      invalue = 0.6
      outvalue = 0.1
      radius = 25.0
      x1 = 50
      y1 = 50
      z1 = 0
    [../]
  [../]
[]

[Kernels]
  [./ValueNucleation_test]
    type = ValueNucleation
    variable = diffused
    center_point = '50 50 0'
    radius = 10.0
    start_time = 0.0011
    end_time = 0.02
  [../]
[]

[BCs]
  [./Periodic]
    [./all]
     auto_direction = 'x y'
    [../]
  [../]
[]

[Executioner]
  type = Transient

  #Preconditioned JFNK (default)
  solve_type = 'PJFNK'


  dt = 0.001
  end_time = 0.003
[]

[Outputs]
  file_base = testValueNucleation
  output_initial = true
  exodus = true
  print_linear_residuals = true
  print_perf_log = true
[]
