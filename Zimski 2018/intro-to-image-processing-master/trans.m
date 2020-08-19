function H = trans(tx, ty)
    H = zeros(3,3);



    H = double(H);
    H=[1, 0, -tx; 0, 1, -ty; 0, 0, 1];

endfunction
