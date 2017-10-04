file = '201709261200_tower_IR_16mm_00000_120002574.tif';
rm_cm = matrix_spatial_rectification(file, 1);
% rm_cm14 = rm_cm/2^2;
img =  image(rm_cm, 'CDataMapping', 'scaled');
colorbar
colormap gray
axis on

% %%Normalize to save as tiff
% rm_cm=rm_cm-min(rm_cm(:)); % shift data such that the smallest element of A is 0
% rm_cm=rm_cm/max(rm_cm(:)); % normalize the shifted data to 1 

%% Convert to 16 bit TIFF
rm_cm16 = uint16(rm_cm*2^2);
imwrite(rm_cm16, 'output_tiff_uint16.tif', 'Resolution', 1000, 'Compression', 'none');

%% Cut to FRF coordinates (50, 400) to (300, 700)
rm_cm_cut = rm_cm(500:3000,4000:7000);
interp = fillmissing(rm_cm_cut, 'previous',1);
image(rm_cm, 'CDataMapping', 'scaled');
colorbar
colormap gray
axis on 