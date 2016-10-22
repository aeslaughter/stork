[Mesh]
  type = GeneratedMesh
  dim = 2
  xmin = -1
  xmax = 1
  ymin = -1
  ymax = 1.2
  nx = 20
  ny = 20
[]

[Variables]
  [./u]
    order = FIRST
    family = LAGRANGE

    [./InitialCondition]
      type = ConstantIC
      value = 0
    [../]
  [../]
[]

[Kernels]
  [./ie]
    type = TimeDerivative
    variable = u
  [../]

  [./diff]
    type = MaterialDiffusion
    variable = u
    diffusivity_name = diffusivity
  [../]

  [./sink]
    type = MaterialSinkKernel
    variable = u
    diffusivity_name = diffusivity
    sink_strength_name = sink_strength
  [../]

  [./event_inserter_source]
    type = EventInserterSource
    variable = u
    inserter = inserter
    gaussian_user_object = gaussian_uo
  [../]
[]

[BCs]
  [./Periodic]
    [./all]
      variable = u
      auto_direction = 'x y'
    [../]
  [../]
[]

[Materials]
  [./simple]
    type = GenericConstantMaterial
    block = 0
    prop_names = 'diffusivity sink_strength'
    prop_values = '2.0 0.05'
  [../]
[]

[UserObjects]
  [./inserter_circle_average]
    type = CircleAverageMaterialProperty
    mat_prop = diffusivity
    periodic_variable = u
    inserter = inserter
    radius = 0.2
  [../]
  [./circle_average]
    type = CircleAverageMaterialProperty
    mat_prop = diffusivity
    periodic_variable = u
  [../]
  [./random_point_uo]
    type = RandomPointUserObject
    seed = 1
  [../]
  [./gaussian_uo]
    type = GaussianUserObject
    sigma = 0.05
    use_random_points = true
    random_point_user_object = random_point_uo
    periodic_variable = u
    scale = 3
  [../]
  [./circle_max_original_element_size_uo]
    type = CircleMaxOriginalElementSize
    periodic_variable = u
  [../]
  [./inserter]
    type = EventInserter
    insert_initial = true
    random_timing = false
    mean = 1.2
    random_point_user_object = random_point_uo
    seed = 3
    verbose = true
    track_old_events = true
    removal_method = sigma_element_size_ratio
    removal_sigma_element_size_ratio = 2.0
    radius = 3.0
    gaussian_user_object = gaussian_uo
    circle_average_material_property_user_object = circle_average
    inserter_circle_average_material_property_user_object = inserter_circle_average
    circle_max_original_element_size_user_object = circle_max_original_element_size_uo
  [../]
[]

[Adaptivity]
  initial_marker = event_marker
  initial_steps = 10
  marker = event_marker
  cycles_per_step = 10
  max_h_level = 0
  recompute_markers_during_cycles = true
  [./Markers]
    [./event_marker]
      type = EventMarker
      inserter = inserter
      gaussian_user_object = gaussian_uo
      marker_radius = 6.0
      coarsen_events = true
      verbose = true
      periodic_variable = u
      event_sigma_mesh_ratio = 2.0
    [../]
  [../]
[]

[Executioner]
  type = Transient
  scheme = 'implicit-euler'

  solve_type = 'NEWTON'

  start_time = 0.0
  end_time = 50.0

  verbose = true

  petsc_options_iname = '-pc_type -pc_hypre_type'
  petsc_options_value = 'hypre boomeramg'

  nl_abs_tol = 1.0e-12

  [./TimeStepper]
    type = EventTimeStepper
    dt = 0.01
    event_inserter = inserter
    growth_factor = 2.0
  [../]
[]

[Preconditioning]
  [./smp]
    type = SMP
    full = true
  [../]
[]

[Postprocessors]
  [./dt]
    type = TimestepSize
  [../]
  [./average]
    type = ElementAverageValue
    variable = u
  [../]
  [./num_elems]
    type = NumElems
  [../]
[]

[Outputs]
  exodus = true
  csv = true
  execute_on = 'initial timestep_end'
  [./console]
    type = Console
    print_mesh_changed_info = true
  [../]
[]