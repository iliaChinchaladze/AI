% Description: reproduce the imgradientxy() function behaviour (using
% 'Prewitt') for yourself.
%
% Inputs: im: an image
% 
% Outputs: Gx an array of horizontal local gradient estimates in double
% precision Gy an array of vertical local gradient estimates in double
% precision
% 
% Notes: you might want to start by calling imfilter() to do the
% convolutions for you, before then trying to replace them for yourself, or
% you might prefer to jump straight into the convolutions. (Note if you do
% use it that imfilter() will return the same data types you pass it, and
% so you'll lose information if you pass it uint8s.) A full implementation
% should add padding around the image (by copying the closest pixel
% values)
function [Gx, Gy] = my_imgradientxy(im)
    % creating emply matrix that will hold our answer later
    Gx = [];
    Gy = [];
    % adds one element (zeros) of padding to each dimension of image
    % then each zero is replicated by element in a side
    b = padarray(im,[1 1],0,'replicate');
    % making original size including padding converting it to double
    % precition
    original = double(b);
    % creating a variable that will hold filter for us
    H = -fspecial('prewitt');
    % getting size of an image including padding
    s = size(original);
    % makes replicated values zeros
    r = zeros(s);
    
    % looping throug x and y axies to apply filter to each pixel
    % by multypling it by H returns Gx 
    for i = 2:s(1)-1
       for j = 2:s(2) -1
          temp = original(i-1:i+1,j-1:j+1) .* H';
          r(i,j) = sum(temp(:));
       end
    end
    % removing outer layer of zeros and making it equal to Gy
    Gx = r(2:end-1, 2:end-1);

    % looping throug x and y axies to apply filter to each pixel
    % by multypling it by H' returns Gy. adding single coutation returns transpose matrix 
    for i = 2:s(1) -1
       for j = 2:s(2) -1
          temp = original(i-1:i+1,j-1:j+1) .* H;
          r(i,j) = sum(temp(:));
       end
     end
    % removing outer layer of zeros and making it equal to Gy
    Gy = r(2:end-1, 2:end-1);
    
    