function H = scale(s)

    H = eye(3);
    H=[1/s,0,0; 0,1/s,0; 0, 0, 1];

end
