CDF      
      
len_string     !   len_line   Q   four      	time_step          len_name   !   num_dim       	num_nodes         num_elem      
num_el_blk        num_node_sets         num_side_sets         num_el_in_blk1        num_nod_per_el1       num_side_ss1      num_side_ss2      num_side_ss3      num_side_ss4      num_side_ss5      num_side_ss6      num_nod_ns1       num_nod_ns2       num_nod_ns3       num_nod_ns4       num_nod_ns5       num_nod_ns6       num_nod_var       num_info  {         api_version       @�
=   version       @�
=   floating_point_word_size            	file_size               int64_status             title         out.e      maximum_name_length                 '   
time_whole                            ��   	eb_status                             
l   eb_prop1               name      ID              
p   	ns_status         	                    
t   ns_prop1      	         name      ID              
�   	ss_status         
                    
�   ss_prop1      
         name      ID              
�   coordx                      @      
�   coordy                      @         coordz                      @      T   eb_names                       $      �   ns_names      	                 �      �   ss_names      
                 �      �   
coor_names                         d      H   node_num_map                           �   connect1                  	elem_type         HEX8                 �   elem_num_map                          �   elem_ss1                          �   side_ss1                          �   elem_ss2                          �   side_ss2                          �   elem_ss3                              side_ss3                             elem_ss4                             side_ss4                             elem_ss5                             side_ss5                             elem_ss6                             side_ss6                             node_ns1                              node_ns2                          0   node_ns3                          @   node_ns4                          P   node_ns5                          `   node_ns6                          p   vals_nod_var1                          @      ��   vals_nod_var2                          @      ��   name_nod_var                       D      �   info_records                      w�      �                                                                              ?�      ��      ��      ?�      ?�      ��      ��      ?�      ?�      ?�      ?�      ?�      ��      ��      ��      ��      ?�      ?�      ��      ��      ?�      ?�      ��      ��                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             arho                             temp                               ####################@�@     @�@     @�@     @�@     @�@     @�@                  # Created by MOOSE #                                                             ####################                                                             ### Command Line Arguments ###                                                   -i                                                                               vdw_test.i                                                                                                                                                        ### Version Info ###                                                             Framework Information:                                                           MOOSE version:           svn revision 30248                                      PETSc Version:           3.4.3                                                   Current Time:            Wed Oct 29 11:12:08 2014                                Executable Timestamp:    Wed Oct 29 11:09:52 2014                                                                                                                                                                                                  ### Input File ###                                                                                                                                                []                                                                                 block                          = INVALID                                         coord_type                     = XYZ                                             fe_cache                       = 0                                               kernel_coverage_check          = 1                                               name                           = 'MOOSE Problem'                                 type                           = FEProblem                                       use_legacy_uo_aux_computation  = INVALID                                         use_legacy_uo_initialization   = INVALID                                         element_order                  = AUTO                                            order                          = AUTO                                            side_order                     = AUTO                                            active_bcs                     = INVALID                                         active_kernels                 = INVALID                                         inactive_bcs                   = INVALID                                         inactive_kernels               = INVALID                                         start                          = 0                                               dimNearNullSpace               = 0                                               dimNullSpace                   = 0                                               long_name                      =                                                 solve                          = 1                                               use_nonlinear                  = 1                                             []                                                                                                                                                                [AuxKernels]                                                                                                                                                        [./bubble_arho_aux]                                                                type                         = BubbleAtomicDensityAuxUC                          arho_UO                      = arho_uo                                           block                        = INVALID                                           boundary                     = INVALID                                           execute_on                   = residual                                          long_name                    = AuxKernels/bubble_arho_aux                        radius                       = 10                                                seed                         = 0                                                 temp                         = temp                                              use_displaced_mesh           = 0                                                 variable                     = arho                                            [../]                                                                          []                                                                                                                                                                [AuxVariables]                                                                                                                                                      [./arho]                                                                           block                        = INVALID                                           family                       = LAGRANGE                                          initial_condition            = 0                                                 order                        = FIRST                                             initial_from_file_timestep   = 2                                                 initial_from_file_var        = INVALID                                         [../]                                                                          []                                                                                                                                                                [BCs]                                                                                                                                                               [./heatup]                                                                         boundary                     = 1                                                 type                         = FunctionDirichletBC                               use_displaced_mesh           = 0                                                 variable                     = temp                                              function                     = temp_ramp                                         long_name                    = BCs/heatup                                        seed                         = 0                                               [../]                                                                          []                                                                                                                                                                [Executioner]                                                                      type                           = Transient                                       l_abs_step_tol                 = -1                                              l_max_its                      = 100                                             l_tol                          = 1e-05                                           line_search                    = none                                            nl_abs_step_tol                = 1e-50                                           nl_abs_tol                     = 1e-10                                           nl_max_funcs                   = 10000                                           nl_max_its                     = 100                                             nl_rel_step_tol                = 1e-50                                           nl_rel_tol                     = 1e-08                                           no_fe_reinit                   = 0                                               petsc_options                  = -snes_ksp_ew                                    petsc_options_iname            = -ksp_gmres_restart                              petsc_options_value            = 101                                             solve_type                     = PJFNK                                           abort_on_solve_fail            = 0                                               dt                             = 1                                               dtmax                          = 1e+30                                           dtmin                          = 2e-14                                           end_time                       = 100                                             long_name                      = Executioner                                     n_startup_steps                = 0                                               num_steps                      = 4294967295                                      picard_abs_tol                 = 1e-50                                           picard_max_its                 = 1                                               picard_rel_tol                 = 1e-08                                           predictor_scale                = INVALID                                         reset_dt                       = 0                                               restart_file_base              =                                                 scheme                         = implicit-euler                                  splitting                      = INVALID                                         ss_check_tol                   = 1e-08                                           ss_tmin                        = 0                                               start_time                     = 0                                               time_period_ends               = INVALID                                         time_period_starts             = INVALID                                         time_periods                   = INVALID                                         timestep_tolerance             = 2e-14                                           trans_ss_check                 = 0                                               use_multiapp_dt                = 0                                               verbose                        = 0                                             []                                                                                                                                                                [Executioner]                                                                      _fe_problem                    = 0x7f8f45013e00                                []                                                                                                                                                                [Functions]                                                                                                                                                         [./temp_ramp]                                                                      type                         = PiecewiseLinear                                   axis                         = INVALID                                           data_file                    = INVALID                                           format                       = rows                                              long_name                    = Functions/temp_ramp                               scale_factor                 = 1                                                 x                            = '0 100'                                           xy_data                      = INVALID                                           y                            = '1000 2000'                                     [../]                                                                          []                                                                                                                                                                [Kernels]                                                                                                                                                           [./heat]                                                                           type                         = HeatConduction                                    block                        = INVALID                                           diag_save_in                 = INVALID                                           diffusion_coefficient_dT_name = thermal_conductivity_dT                          diffusion_coefficient_name   = thermal_conductivity                              long_name                    = Kernels/heat                                      save_in                      = INVALID                                           seed                         = 0                                                 use_displaced_mesh           = 1                                                 variable                     = temp                                            [../]                                                                                                                                                             [./heat_ie]                                                                        type                         = HeatConductionTimeDerivative                      block                        = INVALID                                           diag_save_in                 = INVALID                                           long_name                    = Kernels/heat_ie                                   lumping                      = 0                                                 save_in                      = INVALID                                           seed                         = 0                                                 use_displaced_mesh           = 1                                                 variable                     = temp                                            [../]                                                                          []                                                                                                                                                                [Materials]                                                                                                                                                         [./density]                                                                        type                         = Density                                           block                        = 1                                                 boundary                     = INVALID                                           density                      = 10                                                disp_r                       = INVALID                                           disp_x                       = INVALID                                           disp_y                       = INVALID                                           disp_z                       = INVALID                                           long_name                    = Materials/density                                 output_properties            = INVALID                                           outputs                      = none                                              use_displaced_mesh           = 0                                               [../]                                                                                                                                                             [./thermal]                                                                        type                         = HeatConductionMaterial                            block                        = 1                                                 boundary                     = INVALID                                           long_name                    = Materials/thermal                                 output_properties            = INVALID                                           outputs                      = none                                              specific_heat                = 1                                                 specific_heat_temperature_function =                                             temp                         = INVALID                                           thermal_conductivity         = 100                                               thermal_conductivity_temperature_function =                                      use_displaced_mesh           = 0                                               [../]                                                                          []                                                                                                                                                                [Mesh]                                                                             displacements                  = INVALID                                         block_id                       = INVALID                                         block_name                     = INVALID                                         boundary_id                    = INVALID                                         boundary_name                  = INVALID                                         construct_side_list_from_node_list = 0                                           ghosted_boundaries             = INVALID                                         ghosted_boundaries_inflation   = INVALID                                         patch_size                     = 40                                              second_order                   = 0                                               type                           = FileMesh                                        uniform_refine                 = 0                                               centroid_partitioner_direction = INVALID                                         dim                            = 3                                               distribution                   = DEFAULT                                         file                           = cube.e                                          long_name                      = Mesh                                            nemesis                        = 0                                               partitioner                    = default                                         patch_update_strategy          = never                                           skip_partitioning              = 0                                             []                                                                                                                                                                [Outputs]                                                                          checkpoint                     = 0                                               color                          = 1                                               console                        = 0                                               csv                            = 0                                               exodus                         = 0                                               file_base                      = out                                             gmv                            = 0                                               gnuplot                        = 0                                               hide                           = INVALID                                         interval                       = 10                                              nemesis                        = 0                                               output_final                   = 0                                               output_if_base_contains        = INVALID                                         output_initial                 = 1                                               output_intermediate            = 1                                               show                           = INVALID                                         solution_history               = 0                                               sync_times                     =                                                 tecplot                        = 0                                               vtk                            = 0                                               xda                            = 0                                               xdr                            = 0                                                                                                                                [./console]                                                                        type                         = Console                                           all_variable_norms           = 0                                                 append_displaced             = 0                                                 append_restart               = 0                                                 end_time                     = INVALID                                           file_base                    = out                                               fit_mode                     = ENVIRONMENT                                       hide                         = INVALID                                           interval                     = 10                                                linear_residual_dt_divisor   = 1000                                              linear_residual_end_time     = INVALID                                           linear_residual_start_time   = INVALID                                           linear_residuals             = 0                                                 long_name                    = Outputs/console                                   max_rows                     = 15                                                nonlinear_residual_dt_divisor = 1000                                             nonlinear_residual_end_time  = INVALID                                           nonlinear_residual_start_time = INVALID                                          nonlinear_residuals          = 1                                                 outlier_multiplier           = '0.8 2'                                           outlier_variable_norms       = 1                                                 output_failed                = 1                                                 output_file                  = 0                                                 output_final                 = 0                                                 output_if_base_contains      = INVALID                                           output_initial               = 1                                                 output_input                 = 0                                                 output_intermediate          = 1                                                 output_postprocessors        = 1                                                 output_scalar_variables      = 1                                                 output_screen                = 1                                                 output_system_information    = 1                                                 padding                      = 4                                                 perf_header                  = INVALID                                           perf_log                     = 0                                                 scientific_time              = 0                                                 sequence                     = INVALID                                           setup_log                    = INVALID                                           setup_log_early              = 0                                                 show                         = INVALID                                           show_multiapp_name           = 0                                                 solve_log                    = INVALID                                           start_time                   = INVALID                                           sync_only                    = 0                                                 sync_times                   =                                                   time_precision               = INVALID                                           time_tolerance               = 1e-14                                             use_displaced                = 0                                                 verbose                      = 0                                               [../]                                                                                                                                                             [./exodus]                                                                         type                         = Exodus                                            append_displaced             = 0                                                 append_oversample            = 0                                                 elemental_as_nodal           = 1                                                 end_time                     = INVALID                                           file                         = INVALID                                           file_base                    = out                                               hide                         = INVALID                                           interval                     = 10                                                linear_residual_dt_divisor   = 1000                                              linear_residual_end_time     = INVALID                                           linear_residual_start_time   = INVALID                                           linear_residuals             = 0                                                 long_name                    = Outputs/exodus                                    nonlinear_residual_dt_divisor = 1000                                             nonlinear_residual_end_time  = INVALID                                           nonlinear_residual_start_time = INVALID                                          nonlinear_residuals          = 0                                                 output_elemental_variables   = 1                                                 output_failed                = 0                                                 output_final                 = 0                                                 output_if_base_contains      = INVALID                                           output_initial               = 1                                                 output_input                 = 1                                                 output_intermediate          = 1                                                 output_material_properties   = 0                                                 output_nodal_variables       = 1                                                 output_postprocessors        = 1                                                 output_scalar_variables      = 1                                                 oversample                   = 0                                                 padding                      = 3                                                 position                     = INVALID                                           refinements                  = 0                                                 scalar_as_nodal              = 0                                                 sequence                     = INVALID                                           show                         = INVALID                                           show_material_properties     = INVALID                                           start_time                   = INVALID                                           sync_only                    = 0                                                 sync_times                   =                                                   time_tolerance               = 1e-14                                             use_displaced                = 0                                               [../]                                                                          []                                                                                                                                                                [UserObjects]                                                                                                                                                       [./arho_uo]                                                                        type                         = BubbleAtomicDensityUO                             execute_on                   = timestep                                          gamma                        = 1                                                 long_name                    = UserObjects/arho_uo                               model                        = VDW                                               use_displaced_mesh           = 0                                               [../]                                                                          []                                                                                                                                                                [Variables]                                                                                                                                                         [./temp]                                                                           block                        = INVALID                                           eigen                        = 0                                                 family                       = LAGRANGE                                          initial_condition            = 1000                                              order                        = FIRST                                             scaling                      = 1                                                 initial_from_file_timestep   = 2                                                 initial_from_file_var        = INVALID                                         [../]                                                                          []                                                                                                                                                        @�@     @�@     @�@     @�@     @�@     @�@     @�@     @�@     @$      E���$�E�@%�E�@%�E���$�E���$�E�@%�E�@%�E���$�@�0    @�.    @�.    @�0    @�0    @�.    @�.    @�0    @4      E�A�	���E�B���-�E�B���-�E�A�	���E�A�	���E�B���-�E�B���-�E�A�	���@�������@�������@�������@�������@�������@�������@�������@�������@>      E�~���$E��j]z{E��j]z{E�~���$E�~���$E��j]z{E��j]z{E�~���$@�P    �@�N    �@�N    �@�P    �@�P    �@�N    �@�N    �@�P    �@D      E�����WE���'���E���'���E�����WE�����WE���'���E���'���E�����W@�������@�������@�������@�������@�������@�������@�������@�������@I      E�$9�'�E�%���E�%���E�$9�'�E�$9�'�E�%���E�%���E�$9�'�@�p   �@�n   �@�n   �@�p   �@�p   �@�n   �@�n   �@�p   �@N      E��D���[E��TE��UE��D���[E��D���[E��UE��TE��D���[@�������@�������@�������@�������@�������@�������@�������@�������@Q�     E���	�x�E��(Nr�E��(Nr�E���	�x�E���	�x�E��(Nr�E��(Nr�E���	�x�@������G@������G@������F@������G@������G@������F@������G@������G@T      E��	T�E��W?K�E��W?K�E��	T�E��	T�E��W?K�E��W?K�E��	T�@�     �@�    �@�    �@�     �@�     �@�    �@�    �@�     �@V�     E���>�E�����E�����E���>�E���>�E�����E�����E���>�@��    �@��    �@��    �@��    �@��    �@��    �@��    �@��    �@Y      E����E����H��E����H��E����E����E����H��E����H��E����@�?����@�=���� @�=���� @�?����@�?����@�=����@�=����@�?����