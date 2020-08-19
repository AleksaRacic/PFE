function H = rotate(theta)
    theta = theta/180*pi;
    H = eye(3);

    H = [cos(theta), sin(theta), 0; -sin(theta), cos(theta), 0; 0, 0, 1];


end
