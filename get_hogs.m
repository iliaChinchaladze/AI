% Description: convert an image to grayscale and extract HOG
% features from patches of size 16*16 pixels
%
% Inputs:
% im: an image
% 
% Outputs:
% h: an array containing all the HOG features for the image
% 
% Notes: just a simple wrapper function for the built-in
% extractHOGFeatures() function that makes sure the conversion to
% grayscale happens first, and that the 'CellSize' input is set
%
function h = get_hogs(im)

    h = [];

    % add your code and comments on the lines below:
    
    im = my_im2gray(im);
    CELLSIZE = [16 16];
    [h] = extractHOGFeatures(im, 'CellSize', CELLSIZE, ...
    'BlockSize', [floor(size(im,1)/CELLSIZE(1)) floor(size(im,2)/CELLSIZE(2))], ...
    'UseSignedOrientation', true);
    
end