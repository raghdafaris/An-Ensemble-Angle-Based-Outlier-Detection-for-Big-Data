function [var_ang] = ABOD(out, len_data)
    % ABOD function calculates variance of angles between data points.
    % Inputs:
    %   out - Projected data points after random vector projection.
    %   len_data - Number of data points.
    % Outputs:
    %   var_ang - Variance of angles for each data point, used to detect outliers.
    
    var_ang = zeros(1, len_data); % Initialize variance array for each point.
    
    for w = 1:len_data
        p = 1:len_data; % List of data points.
        p(w) = [];      % Exclude the current point.
        
        h = 1;          % Counter for angle calculations.
        ang1 = [];      % Store angles.
        
        for i = p(1:end-1)
            q = p;      % Copy `p` to `q`.
            q(q == i) = []; % Remove the selected point.
            
            for j = q
                % Compute vectors between points.
                AB = (out(i, :) - out(w, :)); % Vector from point `w` to point `i`.
                AC = (out(j, :) - out(w, :)); % Vector from point `w` to point `j`.
                
                % Compute angle using dot product and norms.
                norm_factor = sqrt(sum(AB.^2)) * sqrt(sum(AC.^2));
                ang1(h) = acosd(dot(AB, AC) / norm_factor); % Angle in degrees.
                h = h + 1;
            end
        end
        
        %% Handle NaN and calculate variance of angles
        TF = isnan(ang1);    % Identify NaN values (caused by division by zero).
        ZeroCount = length(find(TF == 0)); % Count non-NaN angles.
        
        if ZeroCount ~= length(ang1)
            % If not all angles are NaN, calculate variance of valid angles.
            B2 = ang1(~isnan(ang1)); 
            var_ang(w) = var(B2); % Variance of valid angles.
        else
            var_ang(w) = var(ang1); % Variance of all angles (if no NaNs).
        end
    end
end
