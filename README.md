*** Written by T. Mackay-Champion, University of Bristol + Oxford. Nov. 2025.

To create a grid, alter the inputs in script "create_grid.jl" and then run script.

The *query* variable contains the information about what variables you want to extract from the minimization. It must be structured (:phase, :variable).
E.g., query = [(:amp, :Si), (:plag, :wt), (:amp, :Ts), (:g, :alm), (:g, :gr), (:amp, :XFe3),(:cpx, :xFeM2)]

Possible variables include ion apfu, endmember fraction, vol%, wt%, melt anhydrous oxide%, sites (e.g., xFeM2 for cpx), XFe3+, amphibole vectors (Ts, Ed, Gln), Xjd (cpx), XFe (epidote), Xpa (muscovite).