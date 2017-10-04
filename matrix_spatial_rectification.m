function rect_matrix = matrix_spatial_rectification(file, res)
%file = '201709261200_tower_IR_16mm_00000_120002574.tif';
% Read in a TIFF, turn the resulting matrix into a rectified matrix
% Currently set up just with tower
tower = load('PixelPositionsTower.mat');
Xrect = tower.pixelPos.r10171230.X;
Yrect = tower.pixelPos.r10171230.Y;
tiff = imread(file);
% tiff = tiff16/2^2;
% maxVal = 2^14;
%% Round to cm resolution (2) or 10 cm resolution (1) or m resolution (0)
res = 1;
Xrect_rounded = round(Xrect, res);
maxX = round(ceil(max(max(Xrect_rounded))), 0)*10^res;
minX = round(floor(min(min(Xrect_rounded))), 0)*10^res;

Yrect_rounded = round(Yrect, res);
maxY = round(ceil(max(max(Yrect_rounded))), 0)*10^res;
minY = round(floor(min(min(Yrect_rounded))), 0)*10^res;

% Xdim = (ceil(maxX) - floor(minX))*10^res;
% Ydim = (ceil(maxY) - floor(minY))*10^res;

%%Make a new matrix of size (minX, minY), (maxX, maxY) to put tiff pixels
%Initialize as a matrix of NaN
% rect_matrix(1:Xdim, 1:Ydim) = maxVal;
% rect_matrix = [];
rect_matrix(minX:maxX, minY:maxY) = NaN;
for row = 1:size(tiff, 1)
    for column = 1:size(tiff, 2)
        x = Xrect_rounded(row,column);
        y = Yrect_rounded(row,column);
        rect_matrix(round(x*10^res,0),round(y*10^res,0)) = tiff(row,column);
    end
end

