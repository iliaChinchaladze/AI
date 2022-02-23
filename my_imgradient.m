% Description: uses horizontal and vertical local gradient estimates (from
% a call to imgradientxy() or your own my_imgradientxy() implementation) to
% compute maximum rate of increase information at each pixel
%
% Inputs: 
% Gx an array of horizontal local gradient estimates in double precision 
% Gy an array of vertical local gradient estimates in double precision
% 
% Outputs:
% Gmag an array of magnitudes for the maximum rate of increase in local
% gradient
% Gdir an array of directions for the maximum rate of increase in local
% gradient (in units of degrees)
% 
% Notes: the magnitude information is easy to compute with Pythagoras'
% theorem (more in the lecture slides) and remember that calling atan2()
% (rather than the basic atan() inverse tangent function) avoids you having
% to make manual corrections to the direction information (more in the
% lecture slides again) but it will return an answer in radians; you can
% use the following relationship to convert back to degrees: π radians =
% 180 degrees; and matlab lets you write pi to get the nearest value of π
% in double precision 
% 
function [Gmag, Gdir] = my_imgradient(im)

    Gmag = [];
    Gdir = [];

    % have changed function input to image and called my function
    % my_gradient to get horizontal and vertical gradients
    [Gx,Gy] = my_imgradientxy(im);
    % calculating gradiant magnitude by pythagoras
    Gmag = sqrt(power(Gx,2)+power(Gy,2));
    % calculating gradiant magnitude using atan2 function and converting it
    % to degrees
    Gdir = rad2deg(atan2(-Gy, Gx));
    
end