CDF      
      
len_string     !   len_line   Q   four      	time_step          len_name   !   num_dim       	num_nodes      $   num_elem      
num_el_blk        num_node_sets         num_side_sets         num_el_in_blk1        num_nod_per_el1       num_side_ss1      num_side_ss2      num_side_ss3      num_side_ss4      num_nod_ns1       num_nod_ns2       num_nod_ns3       num_nod_ns4       num_nod_var       num_elem_var      num_info   �         api_version       @��H   version       @��H   floating_point_word_size            	file_size               title         ErrorFracMaxH_test.e       maximum_name_length                 "   
time_whole                            U    	eb_status                             	l   eb_prop1               name      ID              	p   	ns_status         	                    	t   ns_prop1      	         name      ID              	�   	ss_status         
                    	�   ss_prop1      
         name      ID              	�   coordx                            	�   coordy                            
�   eb_names                       $      �   ns_names      	                 �         ss_names      
                 �      �   
coor_names                         D          connect1                  	elem_type         QUAD4        �      d   elem_num_map                    d      �   elem_ss1                          X   side_ss1                          l   elem_ss2                          �   side_ss2                          �   elem_ss3                          �   side_ss3                          �   elem_ss4                          �   side_ss4                          �   node_ns1                          �   node_ns2                             node_ns3                          (   node_ns4                          @   vals_nod_var1                                U(   name_nod_var                       $      X   name_elem_var                          D      |   vals_elem_var1eb1                          �      VH   vals_elem_var2eb1                          �      W   elem_var_tab                             �   info_records                      DX      �                                                                 @$      @$              @4      @4      @>      @>      @D      @D      @I      @I      @$              @4      @>      @D      @I      @$              @4      @>      @D      @I      @$              @4      @>      @D      @I      @$              @4      @>      @D      @I                      @$      @$              @$              @$              @$              @$      @4      @4      @4      @4      @4      @4      @>      @>      @>      @>      @>      @>      @D      @D      @D      @D      @D      @D      @I      @I      @I      @I      @I      @I                                          bottom                           left                             right                            top                              bottom                           left                             right                            top                                                                                                                                            	   
      	         
                                          
         
                                                                                                                                                       !            "   !         #   "         $   #                           	   
                                                                                                               
                                                                     	                                        $          !   "   #   $concentration                       EFMHM Rf��)s?�Yf��ȥ?��Cl���?��r�GJI ա��c?����5�P?����Ǚ<?�뒈~      ####################?�Yf��ȥ?��Cl���?��r���?ա��c?����5�P?����Ǚ<?�뒈~?�r�# Created by MOOSE #�ve���?쇝(~|�?�[B�Y`Z?�1�W�U?��Q�M ?� �0
�?�U@�L\;?ԋ8####################p�D�8�?�g��o2?��e��?슢��T�?����z�?֌F5-�!               ### Command Line Arguments ###                                                   -e                                                                               -i                                                                               tests/markers_test/ErrorFracMaxH_test.i                                                                                                                           ### Version Info ###                                                             Framework Information:                                                           SVN Revision:            15467                                                   PETSc Version:           3.1.0                                                   Current Time:            Wed Dec 19 17:48:16 2012                                Executable Timestamp:    Wed Dec 19 17:14:06 2012                                                                                                                                                                                                  ### Input File ###                                                                                                                                                []                                                                                 initial_from_file_timestep     = 2                                               initial_from_file_var          =                                                 block                          =                                                 coord_type                     =                                                 fe_cache                       = 0                                               name                           = 'MOOSE Problem'                                 type                           = FEProblem                                       order                          = AUTO                                            active_bcs                     =                                                 active_kernels                 =                                                 inactive_bcs                   =                                                 inactive_kernels               =                                                 start                          = 0                                             []                                                                                                                                                                [Adaptivity]                                                                       initial_steps                  = 0                                               marker                         = EFMHM                                           steps                          = 0                                                                                                                                [./Indicators]                                                                                                                                                      [./GJI]                                                                            block                      =                                                     type                       = GradientJumpIndicator                               scale_by_flux_faces        = 0                                                   variable                   = concentration                                     [../]                                                                          [../]                                                                                                                                                             [./Markers]                                                                                                                                                         [./EFMHM]                                                                          block                      =                                                     type                       = ErrorFractionMaxHMarker                             coarsen                    = 0.01                                                indicator                  = GJI                                                 max_h_level                = 2                                                   refine                     = 0.8                                               [../]                                                                          [../]                                                                          []                                                                                                                                                                [BCs]                                                                                                                                                               [./c_BC]                                                                           type                         = NeumannBC                                         boundary                     = '0 1 2 3'                                         diag_save_in                 =                                                   save_in                      =                                                   value                        = 0                                                 variable                     = concentration                                   [../]                                                                          []                                                                                                                                                                [Executioner]                                                                      l_abs_step_tol                 = -1                                              l_max_its                      = 10000                                           l_tol                          = 1e-05                                           nl_abs_step_tol                = 1e-50                                           nl_abs_tol                     = 1e-50                                           nl_max_funcs                   = 10000                                           nl_max_its                     = 50                                              nl_rel_step_tol                = 1e-50                                           nl_rel_tol                     = 1e-08                                           no_fe_reinit                   = 0                                               petsc_options                  = -snes_mf_operator                               petsc_options_iname            = '-pc_type -pc_hypre_type'                       petsc_options_value            = 'hypre boomeramg'                               scheme                         = crank-nicolson                                  type                           = Transient                                       _fe_problem                    = 0xfc2b90                                        abort_on_solve_fail            = 0                                               dt                             = 0.01                                            dtmax                          = 1e+30                                           dtmin                          = 0                                               end_time                       = 1e+30                                           growth_factor                  = 2                                               n_startup_steps                = 0                                               num_steps                      = 4                                               predictor_scale                =                                                 restart_file_base              =                                                 ss_check_tol                   = 1e-08                                           ss_tmin                        = 0                                               start_time                     = 0                                               sync_times                     = -1                                              time_dt                        =                                                 time_period_ends               =                                                 time_period_starts             =                                                 time_periods                   =                                                 time_t                         =                                                 trans_ss_check                 = 0                                               use_AB2                        = 0                                               use_littlef                    = 0                                             []                                                                                                                                                                [Kernels]                                                                                                                                                           [./dcdt]                                                                           type                         = TimeDerivative                                    block                        =                                                   diag_save_in                 =                                                   lumping                      = 0                                                 save_in                      =                                                   variable                     = concentration                                   [../]                                                                                                                                                             [./diff]                                                                           type                         = Diffusion                                         block                        =                                                   diag_save_in                 =                                                   save_in                      =                                                   variable                     = concentration                                   [../]                                                                          []                                                                                                                                                                [Mesh]                                                                             displacements                  =                                                 uniform_refine                 = 0                                               ghosted_boundaries             =                                                 ghosted_boundaries_inflation   =                                                 patch_size                     = 40                                              skip_partitioning              = 0                                               type                           = GeneratedMesh                                   block_id                       =                                                 block_name                     =                                                 boundary_id                    =                                                 boundary_name                  =                                                 centroid_partitioner_direction =                                                 construct_side_list_from_node_list = 0                                           partitioner                    =                                                 second_order                   = 0                                               dim                            = 2                                               elem_type                      = QUAD4                                           file                           =                                                 nemesis                        = 0                                               nx                             = 5                                               ny                             = 5                                               nz                             = 0                                               xmax                           = 50                                              xmin                           = 0                                               ymax                           = 50                                              ymin                           = 0                                               zmax                           = 0                                               zmin                           = 0                                             []                                                                                                                                                                [Output]                                                                           elemental_as_nodal             = 0                                               exodus                         = 1                                               exodus_inputfile_output        = 1                                               file_base                      = ErrorFracMaxH_test                              gmv                            = 0                                               gnuplot_format                 = ps                                              interval                       = 1                                               iteration_plot_start_time      = 1.79769e+308                                    max_pps_rows_screen            = 15                                              nemesis                        = 0                                               num_restart_files              = 0                                               output_displaced               = 0                                               output_es_info                 = 1                                               output_initial                 = 1                                               output_solution_history        = 0                                               output_variables               =                                                 perf_log                       = 1                                               postprocessor_csv              = 0                                               postprocessor_gnuplot          = 0                                               postprocessor_screen           = 1                                               print_linear_residuals         = 0                                               screen_interval                = 1                                               show_setup_log_early           = 0                                               tecplot                        = 0                                               tecplot_binary                 = 0                                               xda                            = 0                                             []                                                                                                                                                                [Variables]                                                                                                                                                         [./concentration]                                                                  block                        =                                                   family                       = LAGRANGE                                          initial_condition            = 0                                                 order                        = FIRST                                             scaling                      = 1                                                 initial_from_file_timestep   = 2                                                 initial_from_file_var        =                                                                                                                                    [./InitialCondition]                                                               type                       = RandomIC                                            block                      =                                                     max                        = 1                                                   min                        = 0                                                   seed                       = 0                                                   variable                   = concentration                                     [../]                                                                          [../]                                                                          []                                                                                       ?���E���?�
Ε��?�u�N��?�ټ�c?�#b�{<�?�jo�j�?����\�?�sYLk��?�l4�z<?�Rf��)s?�Yf��ȥ?��Cl���?��r���?ա��c?����5�P?����Ǚ<?�뒈~?�r�}U�?ᰶ�`��?�)�EV�@?�ve���?쇝(~|�?�[B�Y`Z?�1�W�U?��Q�M ?� �0
�?�U@�L\;?ԋ8�\?�/Iض�A?��x }\?�p�D�8�?�g��o2?��e��?슢��T�?����z�?֌F5-�!                                                                                                                                                                                                                                                                                                                                                                                                                ?�z�G�{?���	8^?�%�lD�?�p�-�@�?��-��>?�%��k�?�v�b^H�?�����?�pŚ�`�?�/�y�G?�S�I��?�l��5'A?��]���?�L�%�V?՜��Z`?���4~c>?�ʪ�6~ ?�Q��G?�����?�_!��?�AH-(m?�x��ff?��
K?�a�{f�4?�-G�D��?���2A�?�A���?�i?�A��?Ԑ®�1?�.��5�|?�ȇ\��g?�rL�iPO?�g��D|?��P��?�4�<(5?��c-�?֍�ގ]@       @       @       @       @       @       @       @       @       @       @       @       @       @       @       @       @       @       @       @       @       @       @       @       @       ?ڲ��/�0?���3�?��؟+?��ӹ$~?�>��rJ?�u�=��,?�E��x��?�lD�*�?�U�'@"?�&|���?�>G	x�~?�1���sb?�Nh���?�<��?�+p�?�D���?�v;��u�?�څfp?�)5�n�?󥌲��?�������?�u���V?�,앑6�?��,�xr?��ɺ