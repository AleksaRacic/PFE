## Copyright (C) 2016 
## 
## This program is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.

## Author:  <milan@euclid>

function [points1, points2] = cpselect (image1, image2, numPoints=4)

  [h1 w1 c1] = size(image1);
  [h2 w2 c2] = size(image2);
  
  scale = h1/double(h2);
  
  if (scale != 1)
    image2 = imresize(image2, scale);
  endif
  
  if c1 != c2
    if c1 == 1
      image1 = cat(3, image1, cat(3, image1, image1));
    elseif c2 == 1
      image2 = cat(3, image2, cat(3, image2, image2));
    else
      error 'non matching number of channels';
    endif
  endif

  points1 = [];
  points2 = [];
  
  handle = figure;
  imshow(cat(2, image1, image2));
  hold on;
  numSelected = 0;
  
  while 1;%(numSelected < numPoints)
    title(sprintf("Odaberi jos %d tacaka", numPoints-numSelected));
    [x y button] = ginput(1);
    
    if (button == 1 && x <= w1 && size(points1, 1) < numPoints)
      points1 = [points1; x y];
      text(x, y, sprintf(' %d', size(points1,1)), 'color', 'green');
      plot(x, y, 'g+', 'LineWidth', 4);
    elseif (button == 1 && size(points2,1) < numPoints)
      points2 = [points2; (x-w1)/scale (y)/scale];
      text(x, y, sprintf(' %d', size(points2,1)), 'color', 'red');
      plot(x, y, 'rx', 'LineWidth', 4);
    elseif (button == 3)
      % TODO: update
    else
      break;
    endif

    numSelected = min(size(points1,1), size(points2,1));
  endwhile
  
  title('gotovo')
  close(handle)
endfunction
