% Description: use an existing k-NN model to classify some testing examples 
%
% Inputs:
% m: a struct containing details of the k-NN model we want to use
% for classification 
% test_examples: a numeric array containing the testing examples we want to
% classify
% 
% Outputs:
% predictions: a categorical array containing the predicted
% labels (i.e., with the same ordering as test_examples)
%
% Notes:
% Assumes that the model m has been created with a call to knn_fit()
% 
function predictions = knn_predict(m, test_examples)

    % Guidance (first task):
    % 1. initialise an empty categorical array to hold the predictions
    % 2. loop over every example in the testing_examples array
    % and... 
    %   a. find its nearest neighbour in the data inside the
    %   model
    %   b. take the label associated with that nearest neighbour as
    %   your prediction
    %   c. add the new prediction onto the end of your categorical
    %   array (from step 1)
    
    % Guidance (second task):
    % adjust your code to take account of the k value set inside the model
    % m. Adjust step a from above so that all k nearest neighbours are
    % found. Adjust step b from above to take the the most common class
    % label across all k nearest neighbours as your prediction

    % initialazing empty categorical array to hold predictions
    predictions = categorical;
    

    % looping throug every example in test 
    for i = 1:1:size(test_examples,1)
        % creating temp array that will hold distances calculated 
        d = [];
    % looping throug every example in test 
        for z = 1:1:size(m.train_examples,1)
            % calculating distances betweeen train examples and test
            % examples
            d(end+1)= knn_calculate_distance(m.train_examples(z,:), test_examples(i,:));
        end
        % sorting an array creating earlier and getting an index which
        % specifies how elements where rearanged to get the output
        [b, sortIndex] = sort(d);
        % adding at the end of the predictions array, the most frequent
        % element for trainlabels by the sortIndex from 1 to 3 (m.NumNeighbors) in this case 
        predictions(end+1) = mode(m.train_labels(sortIndex(1:m.NumNeighbors)));
    end
    

end