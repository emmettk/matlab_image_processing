% file = '201709261200_tower_IR_16mm_00000_120002574.tif';
function rectify_matrix_save_tiff(file, outputfile)
%% Read in a tiff at "file", rectify the matrix, save rectified matrix as "outputfile"
rm_cm = matrix_spatial_rectification(file, 1);
% rm_cm14 = rm_cm/2^2;
% img =  image(rm_cm, 'CDataMapping', 'scaled');
% colorbar
% colormap gray
% axis on

% %%Normalize to save as tiff
% rm_cm=rm_cm-min(rm_cm(:)); % shift data such that the smallest element of A is 0
% rm_cm=rm_cm/max(rm_cm(:)); % normalize the shifted data to 1 

%%% Several options for converting to 16 bit, cutting, interpolating, etc.
%%% Uncomment and save desired combination
%% Convert to 16 bit TIFF
rm_cm16 = uint16(rm_cm*2^2);
% imwrite(rm_cm16, 'output_tiff_uint16.tif', 'Resolution', 1000, 'Compression', 'none');

%% Cut to FRF coordinates (50, 400) to (300, 700)
rm_cm_cut = rm_cm16(500:3000,4000:7000);


%% Interpolate
% interp = fillmissing(rm_cm_cut, 'previous',1);

%% Display figure
% image(rm_cm, 'CDataMapping', 'scaled');
% colorbar
% colormap gray
% axis on 

%% Save figure as tiff
imwrite(rm_cm_cut, outputfile, 'Resolution', 1000, 'Compression', 'none');