function [Bags_arr] = Bagging(Data, per, NBag)
    % Bagging function to generate multiple subsets of the data.
    % Inputs:
    %   Data - The original dataset, including features and labels.
    %   per - Percentage of data to sample for each bag.
    %   NBag - Number of bags (subsets) to generate.
    % Outputs:
    %   Bags_arr - Cell array containing `NBag` bags of sampled data.
    
    index = (1:size(Data, 1));  % Create an index vector for data points.
    Data(:, end+1) = index;     % Append indices as the last column in `Data`.

    for i = 1:NBag
        % Randomly shuffle the rows of the dataset.
        Data1 = Data(randperm(size(Data, 1)), :);
        
        % Select a fraction of the data (as defined by `per`).
        m = floor(per * size(Data, 1));
        train_data = Data1(1:m, :);  % Select the top `m` rows for the bag.
        
        Bags_arr{i} = train_data;    % Store the bag in the cell array.
    end
end
