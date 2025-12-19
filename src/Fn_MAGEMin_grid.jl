# This file contains functions to run a grid of calculations in MAGEMin. 
# It must be paired with the MAGEMin_read.jl script for variable extraction.
# Written by T. Mackay-Champion, University of Bristol + Oxford, 2025



# Load modules
using MAGEMin_C
using CSV
using DataFrames
include("Fn_MAGEMin_read.jl")
using .MAGEMinUtils


# Main function to run grid calculations
function run_grid(maxP, minP, nP_steps, maxT, minT, nT_steps,
        Xoxides, X, sys, db,
        query,
        outfile)

    # Create grid
    Tvec, Pvec = makegrid(maxP, minP, nP_steps, maxT, minT, nT_steps)

    # Initialize MAGEMin
    data = Initialize_MAGEMin(db, verbose=-1);

    # Initialize empty array to store results
    results = zeros(Float64, length(Tvec), length(query))

    # Loop over grid points
    println("Running grid calculations...")
    for i in 1:length(Tvec)

        # Run calculation
        T = Tvec[i]; P = Pvec[i]
        out_lT  = single_point_minimization(P, T, data, X=X, Xoxides=Xoxides, sys_in=sys, name_solvus=true);
        
        # Extract desired data
        d = run_query(out_lT, query);
        if any(ismissing, d)
            idx = findall(ismissing, d)
            error("Variable $(query[idx]) is not available")
        else
            results[i, :] = d
        end

    end

    # Save file
    data_variables = ["$(a)_$(b)" for (a,b) in query]
    df = DataFrame(T = Tvec, P = Pvec)
    df2 = DataFrame(results, Symbol.(data_variables))
    df = hcat(df, df2)
    CSV.write(outfile, df)
    println("Results saved to $(outfile)")
end


# Creates a grid of P-T conditions
function makegrid(maxP, minP, nP_steps, maxT, minT, nT_steps)
    P = range(minP, maxP; length = nP_steps)
    T = range(minT, maxT; length = nT_steps)

    Tvec = repeat(T, inner = nP_steps)
    Pvec = repeat(P, outer = nT_steps)

    return Tvec, Pvec
end