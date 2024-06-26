# Ghanaian Transmission Grid [Simplified 16 nodes]
![GTG_1](https://github.com/MichaelBoateng/PowerModels-Analytics-Distribution-Project/assets/47555566/4aeec225-d78e-4127-9da1-f1545513dee4)

![GTG_2](https://github.com/MichaelBoateng/PowerModels-Analytics-Distribution-Project/assets/47555566/f8f11e2f-a55f-4464-8b16-063fece38072)

![GTG_3](https://github.com/MichaelBoateng/PowerModels-Analytics-Distribution-Project/assets/47555566/9188fc3f-383c-43ec-9bb5-353ba09aa835)

This Julia script, `julia_2.jl`, is part of a PowerModels Analytics project developed by Michael Boateng. The project is focused on analyzing Ghana's power grid at the transmission level, specifically a 16-bus system.

The script begins by importing necessary packages, including `PowerModelsAnalytics`, `PowerModels`, and `Ipopt`. It also sets up the plotting backend using the `Plots` package and the GR framework.

The main part of the script involves parsing a data file (`case16_2.m`) that contains the specifications of the 16-bus power grid. This data file is located in the `PowerModelsWildfire.jl/data` directory.

Once the data is parsed, the script generates a network plot of the power grid using the `plot_network` function from the `PowerModelsAnalytics` package. The plot includes labels for the nodes (buses), and the size of the nodes and edges are controlled by specified limits. The plot is generated at a resolution of 100 dpi and a size of 600x600 pixels.

This script serves as a foundation for power grid analysis, providing a visual representation of the grid structure. Further analysis and optimization can be built upon this foundation.
