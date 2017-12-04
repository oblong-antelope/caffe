function subcube = getsubcube(cube, r, c, width)
    ch = size(cube, 3);
    subcube = uint8( zeros(width, width, ch));
    ridx = 1:width;
    cidx = 1:width;
    
    halfw = floor(width/2);
    in_ridx = (r-halfw):(r-halfw+width-1);
    in_cidx = (c-halfw):(c-halfw+width-1);
    
    %when out of bounds
    if (r-halfw < 1)
        in_ridx = 1:(r-halfw+width-1); 
        ridx = width-length(in_ridx)+1: width;
    end
    if (c-halfw < 1)
        in_cidx = 1:(c-halfw+width-1); 
        cidx = width-length(in_cidx)+1: width;
    end
    if( (r-halfw+width-1) > size(cube, 1))
        in_ridx = (r-halfw): size(cube,1);
        ridx = 1: length(in_ridx);
    end
    if( (c-halfw+width-1) > size(cube, 2))
        in_cidx = (c-halfw): size(cube,2);
        cidx = 1: length(in_cidx);
    end
    
    subcube(ridx, cidx, :) = cube(in_ridx, in_cidx, :);
end