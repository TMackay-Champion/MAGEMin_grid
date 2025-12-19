### This set of scripts performs Gibbs energy minimisation with MAGEMin over a user-defined pressure–temperature (P–T) grid and extracts selected output variables into a CSV results file.

To create a grid, alter the inputs in script "create_grid.jl" and then run script using Julia.

The *query* variable contains the information about what variables you want to extract from the minimization. It must be structured (:phase, :variable).
E.g., query = [(:amp, :Si), (:plag, :wt), (:amp, :Ts), (:g, :alm), (:g, :gr), (:amp, :XFe3),(:cpx, :xFeM2)]

Possible variables include ion apfu, endmember fraction, vol%, wt%, melt anhydrous oxide%, sites (e.g., xFeM2 for cpx), XFe3+, amphibole vectors (Ts, Ed, Gln), Xjd (cpx), XFe (epidote), Xpa (muscovite). Further details can be found in /src/Fn_MAGEMin_read.jl
