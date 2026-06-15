
%Shehadeh, H. A., Idris, M. Y. I., Jebril, I. H., & Mustafa, H. M. (2026, May). Bombardier Beetle Optimizer: A Novel Bio-Inspired Algorithm for Global Optimization. 
%In 2026 2nd International Conference on Computational Intelligence Approaches and Applications (ICCIAA) (pp. 1-8). IEEE.‏
%% https://ieeexplore.ieee.org/abstract/document/11543921


function[Best_score,Best_pos,BBO_curve]=BBO(Bombardier_Beetle,Max_iterations,lowerbound,upperbound,dimension,fitness)
lowerbound=ones(1,dimension).*(lowerbound);                              % Lower limit for variables
upperbound=ones(1,dimension).*(upperbound);                              % Upper limit for variables

%% 1). Initialization Phase, Equation (1)
for i=1:dimension
    X(:,i) = lowerbound(i)+rand(Bombardier_Beetle,1).*(upperbound(i) - lowerbound(i));                          % Initial population
end

for i =1:Bombardier_Beetle
    L=X(i,:);
    fit(i)=fitness(L);
end
%%

for t=1:Max_iterations  % algorithm iteration
    
    %%  update: BEST proposed solution
    [Fbest , blocation]=min(fit);
    
    if t==1
        xbest=X(blocation,:);                                           % Optimal location
        fbest=Fbest;                                           % The optimization objective function
    elseif Fbest<fbest
        fbest=Fbest;
        xbest=X(blocation,:);
    end
    %%
    %%
    for i=1:Bombardier_Beetle
        %% 2) Defense mechanism of Bombardier Beetle (exploration Phase) 
        predator_position=find(fit<fit(i)); % Equation (4)
        if size(predator_position,2)==0
            selected_predator=xbest;
        else
            if rand <0.5
                selected_predator=xbest;
            else
                k=randperm(size(predator_position,2),1);
                selected_predator=X(predator_position(k));
            end
        end
        %
        %I=round(1+rand);
        %I=3.14*rand(1,1).*rand(1,1).;
        %ChemicalReactions = 100 * rand(1,1).*rand(1,1).;
        r1 = rand(1,1);
        r2 = rand(1,1);
        d  = rand(1,1);
        A = circle_intersection_area(r1, r2, d);
        
        spray =  chaos(7,1,1) * 2.7^(100^(t/Max_iterations))  ; %Equation (5)
        
        X_new_P1= (X(i,:)  + (selected_predator * A *  100 * rand(1,1).*rand(1,1).*X(i,:)) ) / spray;%%Equation (3)
        X_new_P1 = max(X_new_P1,lowerbound);X_new_P1 = min(X_new_P1,upperbound);
        
        % update position 
        L=X_new_P1;
        fit_new_P1=fitness(L);
        if fit_new_P1<fit(i)
            X(i,:) = X_new_P1;
            fit(i) = fit_new_P1;
        end
        %% END of The Defense mechanism
        
        %%
        %% 3) Newton s Explanation of Insect Lift, the Escape Phase of Algorithm (exploitation)
        CL  = rand(1,1);      % Typical insect wing lift coefficient
        rho = rand(1,1);    % Air density at sea level (kg/m^3)
        A   = rand(1,1);   % Wing area in m^2
        v   = rand(1,1);       % Wing velocity (m/s)
        f = insect_lift(CL, rho, A, v); % fly away Equation (6)
       
        X_new_P2=X(i,:)+f*((upperbound-lowerbound)/t);
        X_new_P2 = max(X_new_P2,lowerbound./t);X_new_P2 = min(X_new_P2,upperbound./t);
        % update position 
        L=X_new_P2;
        fit_new_P2=fitness(L);
        if fit_new_P2<fit(i)
            X(i,:) = X_new_P2;
            fit(i) = fit_new_P2;
        end
        %% END of the Escape Phase of Algorithm 
        %%
    end
    %%
    
    best_so_far(t)=fbest;
    average(t) = mean (fit);
    
end
Best_score=fbest;
Best_pos=xbest;
BBO_curve=best_so_far;
end

