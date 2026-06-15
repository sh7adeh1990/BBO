%% 
%Shehadeh, H. A., Idris, M. Y. I., Jebril, I. H., & Mustafa, H. M. (2026, May). Bombardier Beetle Optimizer: A Novel Bio-Inspired Algorithm for Global Optimization. 
%In 2026 2nd International Conference on Computational Intelligence Approaches and Applications (ICCIAA) (pp. 1-8). IEEE.‏
%% https://ieeexplore.ieee.org/abstract/document/11543921


function L = insect_lift(CL, rho, A, v)
    % Newton's explanation of insect lift
    % CL  - lift coefficient
    % rho - air density (kg/m^3)
    % A   - wing area (m^2)
    % v   - wing velocity (m/s)
    
    % Lift force based on Newton's aerodynamic principle
    L = CL * 0.5 * rho * A * v^2;
end