%% 
%Shehadeh, H. A., Idris, M. Y. I., Jebril, I. H., & Mustafa, H. M. (2026, May). Bombardier Beetle Optimizer: A Novel Bio-Inspired Algorithm for Global Optimization. 
%In 2026 2nd International Conference on Computational Intelligence Approaches and Applications (ICCIAA) (pp. 1-8). IEEE.‏
%% https://ieeexplore.ieee.org/abstract/document/11543921
clc
clear
close all
%%

Fun_name='F1'; % number of test functions: 'F1' to 'F23'

Bombardier_Beetle=30;                      % population members 
Max_iterations=1000;                  % maximum number of iteration
[lowerbound,upperbound,dimension,fitness]=fun_info(Fun_name); % Object function information
[Best_score,Best_pos,BBO_curve]=BBO(Bombardier_Beetle,Max_iterations,lowerbound,upperbound,dimension,fitness);  

%%
display(['The best optimal value of the objective funciton that is found by BBO  for ' [num2str(Fun_name)],'  is : ', num2str(Best_score)]);
%%

        