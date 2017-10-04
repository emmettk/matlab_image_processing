%% Display a 10 bit rggb tiff in color

%Import 10 bit image
tif10 = imread('201709261000_pier_EO_08mm_00000_100002482.tif');
%tif10 = imread('201709261000_tower_EO_12mm_00000_100002591.tif');
tif16 = tif10*2^6;
bayer = demosaic(tif16, 'rggb');
imshow(bayer)
