% Description: given a greyscale image, extract HOG features from patches
% of size 16*16 pixels using 9-bin histograms, and return all the bin
% totals in a single large array
%
% Inputs: im: an image
% 
% Outputs: h an array containing all the resulting bin totals (all
% individual histograms concatenated together)
% 
% Notes: perhaps start with calls to the built-in imgradient_xy() and
% imgradient() functions for computing the maximum rate of increase
% information (you can switch over to your my_*() equivalents once finished
% and check for equivalent results); we suggest a nested for loop over
% image patches; careful with your indices - the function should accept any
% greyscale image and width/height isn't guaranteed to be a multiple of 16
% (practice at the Command Window first is strongly recommended); note it
% doesn't matter whether you loop down columns and then across rows or vice
% versa; there's a tip in the function body below for making the histograms
% (you can take any approach you like but note we do expect you to code
% this process up for yourself - if you start off by using a built-in
% function to help you, then you need to replace it with your own code at a
% later stage; 

% the zeros() function (met in the Matlab Fundamentals) is a
% nice way to initialise an empty 9-bin histogram; you saw how to
% concatenate arrays using []-notation in the Matlab Fundamentals (check
% back or have a play around at the Command Window if unsure);

% for the final standardisation step,
% you need to treat your final h array as
% definining the coordinates of a point in a feature space and calculate
% its Euclidean distance from the origin; you may have code from your k-NN
% work that you can reuse? - or you can check the k-NN lecture slides for
% the Euclidean distance equation, but notice it simplifies if one of the
% points has all-zeros for its coordinates (as the origin does); once you
% have the distance you simply divide all values in your h array by it (the
% new distance from the origin is then equal to 1)
% 
function h = my_extractHOGFeatures(im)

    h = [];

    % One possible approach to computing histogram bin scores from
    % orientations (but you can use any approach you like as long as you
    % code it for yourself and don't just call another built-in function):
    
    % Start by constructing an array holding the exact centres (not edges)
    % of each bin. Remember the 9 bins span the range -180 to +180 degrees
    % but the first and last bins aren't centred on 0 or 180 degrees
    % (perhaps sketch how the histogram bins cover the full range to get an
    % accurate picture in your mind first). This is a one-time job you can
    % do up at the top of this function. Then whenever you have a new value
    % (direction) that you want to assign to the correct bin, you can
    % simply subtract that value from your array and compute the absolute
    % size of the resulting values to get the distances to each
    % centre-point (using a call to abs()); calling min() on these
    % distances then allows you to find the index of the closest bin

    % truning image into grayscale
    im = my_im2gray(im);

    % get rows and colums of grey im
    [rows, columns] = size(im);
        
    blockSizeR = 16; % Rows in block.
    blockSizeC = 16; % Columns in block.
   
    
    % looping through rows and colums of each patch
    for row = 1 : blockSizeR : rows
      for col = 1 : blockSizeC : columns
          % Determine starting and ending rows.
          row1 = row;
          % -1 to get to 16th pixel (1+16-1)
          row2 = row1 + blockSizeR -1;
          row2 =min(rows, row2); % Don't let it go outside the image.
          % Determine starting and ending columns.
          col1 = col;
          col2 = col1 + blockSizeC -1;
          col2 = min(columns, col2); % Don't let it go outside the image.
          % Extract out the block into a single subimage.
          oneBlock = im(row1:row2, col1:col2);
          % creating 9bin array of zeros
          bin9 = zeros([1,9]);
          % test bin with exact centerse
          testbin9 = [-180,-140,-100,-60,-20,20,60,100,160];
          % getting magnitude and direction of 16x16 image patch
          [Gmag, Gdir] = imgradient(oneBlock);

          % get size of one block's colums and rows
          [Grows, Gcolumns] = size(oneBlock);
          % loop to go throug each element of direction
          for aa = 1:1:Grows
              for bb = 1:1:Gcolumns
                % loop to go throug each element in testbin9 and compare
                % values to choose bin index
                temp =  [];
                for z = 1:9                    
                    % in temp file add value of differance between Gdir and
                    % each element of testbin
                    temp(:,end+1) = abs(testbin9(1,z)-Gdir(aa,bb));
                end  
                % get the smallest value in temp file and its index
                [closest,index] = min(temp);
                % using index put gmag value in 9bin zeros
                bin9(1,index) = bin9(1,index)+Gmag(aa,bb);
              end  
          end          
          % add bin9 array to h horizontally
          h = horzcat(h,bin9);
          %h = h/1000.0;
          %h = rescale(h,0,1);

      end
      
    end