% Description: reproduce the im2gray() function behaviour for
% yourself (including some simple Inputs/Outputs comments, below)
%
% Inputs:
% im: an image
% 
% Outputs: 
% im_g: a greyscale image consisting of uint8 values
% 
% Notes: the function should return uint8 values (matching what is passed
% in) but you'll get rounding errors if you perform the conversion
% calculation with uint8 values, so some recasting is needed here
%
function im_g = my_im2gray(im)
    %create empth table where greyscale will be putted
    im_g = [];
    % as it is rgb picture get red green and blue values
    % as rgb is 3 dimensional picture and each dimension is red green and
    % blue
    red = im(:,:,1);
    green = im(:,:,2);
    blue = im(:,:,3);

    % convert picture into greyscale using each layer multiplied 
    % by pre-defined coefficients
   
    greyscale = 0.2989*red + 0.5870*green + 0.1140*blue;
    % put greyscale image as an output
    im_g = greyscale;
end