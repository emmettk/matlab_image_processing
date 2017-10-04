
function tiff_spatial_rectification(file, outputname)
% Read in a TIFF, save it rectified
% if(location == "tower")
    %%Tower
tower = load('PixelPositionsTower.mat');
Xrect = tower.pixelPos.r10171230.X;
Yrect = tower.pixelPos.r10171230.Y;
% end
% if(location == "pier")
%     %%Pier
%     pier = load('PixelPositionsPier.mat');
%     Xrect = pier.pixelPosPier.r10171230.X;
%     Yrect = pier.pixelPosPier.r10171230.Y;
% end
%%Image
% file = '201709261200_tower_IR_16mm_00000_120002574.tif';
tiff = imread(file);

% rect = surface(Xrect, Yrect, tiff); 
% shading flat
% grid off
% print("tiff01.tif", "-dtiffn")


%crop image
%% crop original image, which is in pixel coordinates
%% This is specific to the Tower!!
xrange = [200, 728];
yrange = [1, 1024];

Xrect2 = Xrect(xrange(1):xrange(2), yrange(1):yrange(2));
Yrect2 = Yrect(xrange(1):xrange(2), yrange(1):yrange(2));
tiff2 = tiff(xrange(1):xrange(2), yrange(1):yrange(2));
rect2 = surface(Xrect2, Yrect2, tiff2); 
shading flat
colormap gray
grid off
axis off
print("tiff_temp.tif", "-dtiff", '-r500');
close('all')
output = imread('tiff_temp.tif');
outputbw = rgb2gray(output);
% outputname = file(1:length(file)-4)+'_rectified.tif'
imwrite(outputbw, outputname);

