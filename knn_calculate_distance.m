% Description: calculate the Euclidean distance between any two
% points
%
% Inputs:
% p: an array containing the coordinates of the first point
% q: an array containing the coordinates of the second point
% 
% Outputs:
% d: a numeric value holding the straight-line distance
% between the two points
% 
% Notes: you can find the equation for Euclidean distance in the
% lecture slides.
% 
function d = knn_calculate_distance(p, q)

    d = 0;
    
    % we are geting the distance between two points 
    % imaginning it as a right triangle getting the sides of the triangle
    % and applyig pythagoras 

    d=sqrt(sum((p - q) .^ 2));
    
end