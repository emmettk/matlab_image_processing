%% Display and/or save a 10 bit rggb tiff in color
%% Also gives the option to save original 10 bit tiff as ASCII file

%Import 10 bit image
%tif10 = imread('201709261000_pier_EO_08mm_00000_100002482.tif');
%tif10 = imread('201709261000_tower_EO_12mm_00000_100002591.tif');
%tif10 = imread('201710151500_pier_EO_08mm_00000.TIF');
%tif10 = imread('201710051000_pier_EO_08mm_000000.TIF');
tif10 = imread('201710051000_tower_EO_12mm_00000.TIF');
tif16 = tif10*2^6;
bayer = demosaic(tif16, 'rggb');
%imshow(bayer)
imwrite(bayer, '201710051000_tower_EO_12mm_00000_color.TIF', 'Resolution', 1000, 'Compression', 'none');

%Write tiff to an ascii file
dlmwrite('201710051000_tower_EO_12mm_00000_ASCII.out', tif10);
