#Michael Boateng   
#Date: 2024-05-20
#PowerModels Analytics Project

#Tranmission level digaram of Ghana's power grid
#16 buses

using PowerModelsAnalytics
import PowerModels
import Ipopt

PowerModels.silence()

ENV["GRDIR"]=""
import Plots
Plots.gr()
Plots.GRBackend()
case14 = PowerModels.parse_file(joinpath(dirname(pathof(PowerModels)), "..", "C:\\Users\\mboat\\PowerModelsWildfire.jl\\data\\case16_2.m"))

graph = plot_network(case14;
    node_size_limits=[10, 15],
    edge_width_limits=[2, 3],
    label_nodes=true,
    fontsize=10,
    plot_size=(600,600),
    plot_dpi=100);


#Michael Boateng
#Date: 2024-05-20
#PowerModels Distribution Project | IEEE 37 Bus System

using PowerModelsAnalytics
import PowerModels
import PowerModelsDistribution
import Ipopt

PowerModels.silence()
ENV["GRDIR"]=""
import Plots
Plots.gr()
Plots.GRBackend()
case_distribution = PowerModelsDistribution.parse_file("C:\\Users\\mboat\\OneDrive - Georgia Institute of Technology\\Desktop\\OpenDSS\\Distrib\\IEEETestCases\\37Bus\\ieee37.dss");

graph = plot_network(case_distribution; aggregate_extra_nodes=true,
    node_size_limits=[10, 15],
    edge_width_limits=[2, 3],
    label_nodes=true,
    fontsize=10,
    plot_size=(600,600),
    plot_dpi=100);

#Solving AC-OPF and DC-OPF on IEEE CASE 37 
#Open DSS parse_file

#Solving AC-OPF
using PowerModelsDistribution
using Ipopt
result = solve_mc_opf("C:\\Users\\mboat\\OneDrive - Georgia Institute of Technology\\Desktop\\OpenDSS\\Distrib\\IEEETestCases\\37Bus\\ieee37.dss", ACPUPowerModel, Ipopt.Optimizer)

#Solving DC-OPF
using PowerModelsDistribution
using Ipopt

result = solve_mc_opf("C:\\Users\\mboat\\OneDrive - Georgia Institute of Technology\\Desktop\\OpenDSS\\Distrib\\IEEETestCases\\37Bus\\ieee37.dss", DCPUPowerModel, Ipopt.Optimizer)

#=

The DC Optimal Power Flow (DCOPF) model in PowerModelsDistribution.jl simplifies the full AC power flow model by only considering active power, ignoring reactive power, voltage magnitudes, and phase angles.
Looking at my DSS file, it defines loads with both active (kW) and reactive (kVAR) power. In the DCOPF model, the reactive power values are ignored.
The DCOPF model also doesn't consider transformer tap ratios and phase shifts. If my DSS file includes transformers with these parameters, they won't be factored into the DCOPF analysis.
I don't need to edit my DSS file to use it with the DCOPF model, but I should be aware that some information will be ignored. For a more accurate analysis that includes all parameters, I might need to use an AC power flow model instead.

#=