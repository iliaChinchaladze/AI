% Description: calculate average brightness from an image by converting it
% to grayscale (black and white), summing up the brightness values at every
% pixel, and dividing by the total number of pixels
%
% Inputs: im: an image
% 
% Outputs: b: a double precisions measure of average brightness per pixel
% 
% Notes: the sum() function (which is handy for using in your solution)
% doesn't mind what data types you pass it, it will always hand you back a
% double precision answer. (So you don't need to worry about doing and
% recasting in your solution)
%
function b = get_brightness(im)

    b = 0;

    % converting into grey scale using function created earlier
    % beacause greyscale is 1d array and its easier to add up and find the
    % average
    im = my_im2gray(im);
    
    % getting total brightness of each pixel 
    total = im(1:1:end);
    
    % geting average value of brightness
    b = mean(total);
    
    % another way of doing it 
    %pixels = numel(im(1:1:end))
    %allBrigt = sum(im(1:1:end))
    %b = rdivide(allBrigt, pixels);

end