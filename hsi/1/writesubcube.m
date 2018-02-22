function writesubcube(subcube, y, x, filename)
    fid = fopen(filename, 'w');
    % write height, width, channel
    fwrite(fid, size(subcube), 'uint32' ); 
    % write pixel position 
    fwrite(fid, [x, y], 'uint32');
    % write UINT8 data
    fwrite(fid, subcube, 'uint8');
    fclose(fid);
end
