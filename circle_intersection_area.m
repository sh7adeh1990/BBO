
%% 
%Shehadeh, H. A., Idris, M. Y. I., Jebril, I. H., & Mustafa, H. M. (2026, May). Bombardier Beetle Optimizer: A Novel Bio-Inspired Algorithm for Global Optimization. 
%In 2026 2nd International Conference on Computational Intelligence Approaches and Applications (ICCIAA) (pp. 1-8). IEEE.‏
%% https://ieeexplore.ieee.org/abstract/document/11543921

function area = circle_intersection_area(r1, r2, d)
    % Function to compute the area of intersection between two circles
    % r1 - radius of first circle
    % r2 - radius of second circle
    % d  - distance between centers
    
    % No overlap
    
    if d >= r1 + r2
        area = 0;
        return;
    end
    
    % One circle completely inside the other
    if d <= abs(r1 - r2)
        area = pi * min(r1, r2)^2;
        return;
    end
    
    % Partial overlap
    alpha = 2 * acos((d^2 + r1^2 - r2^2) / (2 * d * r1));
    beta  = 2 * acos((d^2 + r2^2 - r1^2) / (2 * d * r2));
    
    area1 = 0.5 * r1^2 * (alpha - sin(alpha));
    area2 = 0.5 * r2^2 * (beta - sin(beta));
    
    area = (area1 + area2);
end

% Another implementation is as follows 

%function area = circle_intersection_area(r, R, d)


% No overlap
%if d >= r + R
   % area= 0;

% One circle completely inside the other
%elseif d <= abs(R - r)
   % area = pi * min(r, R)^2;

% Partial overlap
%else
 %   area = r^2 * acos((d^2 + r^2 - R^2) / (2*d*r)) + ...
     %   R^2 * acos((d^2 + R^2 - r^2) / (2*d*R)) - ...
      %  0.5 * sqrt((-d + r + R) * ...
                 %  ( d + r - R) * ...
                 %  ( d - r + R) * ...
                 %  ( d + r + R));
%end

%end
