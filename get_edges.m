% Description: generate estimates of the fraction of vertical and
% horizontal edge pixels in an image by calling imgradientxy to compute
% local gradients in each direction and thresholding the magnitudes in the
% two resulting matrices
%
% Inputs: im: an image
% 
% Outputs: edges: array containing the fraction of all gradient magnitudes
% above the threshold in the horizontal direction (inside edges(1)) and the
% fraction of all gradient magnitudes above the threshold in the vertical
% direction (inside edges(2))
% 
function edges = get_edges(im)

    edges = [0 0];
    
    % converting image to a greyscale using my function
    im = my_im2gray(im);

    % getting x and y magnitudes using my function 
    %[Gx, Gy] = imgradientxy(im, 'Prewitt');
    [Gx, Gy] = my_imgradientxy(im);

    % getting absolute value of Gy and Gx
    Gx = abs(Gx);
    Gy = abs(Gy);

    % creating binary array of 1s and 0s 1 if it is greater than or equal
    % to 45 and 0 if its is smaller than 45
    Gx = Gx >= 45;
    Gy = Gy >= 45;
    
    % get sum of ones in Gx and divide it on total number of elements in Gx
    % do the same for Gy
    a = (sum(Gx(:) == 1)/numel(Gx));
    b = (sum(Gy(:) == 1)/numel(Gy));
    
    % output a and b
    edges = [a,b];
end