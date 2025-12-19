# Load modules
include("src/Fn_MAGEMin_grid.jl")

# Grid information
# This will create a regular grid over P-T
const maxP = 15 # kbar
const minP = 5
const nP_steps = 4 # Number of steps between minP and maxP
const maxT = 800 # °C
const minT = 400
const nT_steps = 5

# MAGEMin INPUTS
const Xoxides = ["SiO2"; "Al2O3"; "CaO"; "MgO"; "FeO"; "Fe2O3"; "K2O"; "Na2O"; "TiO2"; "Cr2O3"; "H2O"];
const X = [48.43; 15.19; 11.57; 10.13; 6.65; 1.64; 0.59; 1.87; 0.68; 0.0; 3.0]
const db = "ig" 
const sys = "wt" 
# Data you wish to extract
# The query needs to be structured as below, with (:phase, :variable)
# The list of possible variables can be found in the README file.
const query = [(:amp, :Si), (:plag, :wt), (:amp, :Ts), 
                (:g, :alm), (:g, :gr), (:amp, :XFe3),(:cpx, :xFeM2)]

# Outfile name (must be a CSV file)
const outfile = "test_results.csv"


# Code will run
run_grid(maxP, minP, nP_steps, maxT, minT, nT_steps,
        Xoxides, X, sys, db,
        query,
        outfile)