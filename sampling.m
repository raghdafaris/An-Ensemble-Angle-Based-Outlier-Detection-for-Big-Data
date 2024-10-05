function [sample] = sampling(XB, samSize)
    % Sampling function to randomly select a portion of the data.
    % Inputs:
    %   XB - Input dataset (features and labels).
    %   samSize - Percentage of data to sample.
    % Outputs:
    %   sample - Subset of data sampled from the original set.
    
    Data1 = XB(randperm(size(XB, 1)), :); % Shuffle the data.
    m = floor(samSize * size(XB, 1));    % Determine the number of samples to take.
    sample = Data1(1:m, :);              % Select the top `m` rows as the sample.
end
