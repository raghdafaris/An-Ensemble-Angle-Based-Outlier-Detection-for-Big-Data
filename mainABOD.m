clc
clear all
close all

%% Load Dataset
% Choose a dataset by uncommenting the relevant line. The 'arrhythmia.mat' 
% dataset is currently being used, which contains the feature matrix `X` 
% and labels `y`.

% load('wbc.mat')
load('arrhythmia.mat')
% load('speech.mat')
% load('satimage-2.mat')
% load('optdigits.mat')
% load('mnist.mat')
% load('musk.mat')
% load('outlier-100.mat')

% Combine the feature matrix X and labels y into one matrix `Data`.
X(:,end+1) = y; % Append labels `y` as the last column of `X`.
Data = X;      % Store the complete data in `Data`.

%% Parameters for Bagging
% per: percentage of data to be sampled for each bag
% NBag: number of bags (subsets of data) to generate
% num_vec: number of random vectors for bucketing (in ABOD function)

per = 0.2;   % 20% of data used for each bag
NBag = 10;   % Number of bags
num_vec = 20; % Number of random vectors for bucketing

%% Perform Bagging
% This function generates `NBag` bags of data with `per` percentage of 
% samples in each bag. It returns a cell array `Bags_arr` containing these
% bags (subsets of the original data).
[Bags_arr] = Bagging(Data, per, NBag);
save('Bags_arr', 'Bags_arr'); % Save the generated bags to file.

%% Process Each Bag
for B = 1:NBag
    disp(['Processing Bag ', num2str(B)]); % Display current bag number.
    
    % Extract the Bth bag from the bagging array.
    XB = Bags_arr{B}; 
    
    % Separate features, labels, and indices.
    XData = XB(:,1:end-2);  % Features (all columns except last two)
    label = XB(:,end-1);    % Labels (second last column)
    index = XB(:,end);      % Indices (last column)
    
    len_data = size(XData, 1); % Number of data points
    dim = size(XData, 2);      % Dimensionality (number of features)

    %% Bucketing: Random Vector Projection
    % Generate random vectors to project data for ABOD.
    vectors = round(2 * rand(num_vec, dim) - 1); % Generate random projection vectors.
    
    % Compute bucket scaling factor.
    a = max(XData(:)) / num_vec;
    
    % Assign data points to buckets based on projection.
    out = zeros(len_data, num_vec); % Initialize the bucketed output array.
    for i = 1:len_data
        D = XData(i, :); % Current data point.
        for jj = 1:num_vec
            % Project the data point onto the random vector and assign to bucket.
            out(i, jj) = floor((D * vectors(jj, :)') / (norm(vectors(jj, :)) * a));
        end
    end
    
    %% Apply Angle-Based Outlier Detection (ABOD)
    % Calculate variance of angles for each data point to detect outliers.
    [var_ang] = ABOD(out, len_data);
    
    % Append labels and indices to the ABOD results.
    var_ang = var_ang'; % Transpose for easier manipulation.
    var_ang(:, end+1) = label; % Append labels.
    var_ang(:, end+1) = index; % Append indices.

    %% Save Results for Each Dataset
    ABOD_arrhythmia{B} = var_ang; % Store ABOD results for the current bag.
    save('ABOD_arrhythmia', 'ABOD_arrhythmia'); % Save the ABOD results.
end
