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

function cpselect (image1, image2, points1, points2)

  if size(points1) != size(points2)
    error("Razlicit broj tacaka korespondencije")
  endif
  
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
  
  handle = figure;
  imshow(cat(2, image1, image2));
  hold on;
 
  for i=1:size(points1,1);
    p1 = points1(i,:);
    p2 = points2(i,:)*scale;
    x1 = p1(1); y1 = p1(2);
    x2 = w1+p2(1); y2 = p2(2);
    text(x1, y1, sprintf(' %d', i), 'color', 'green');
    plot(x1, y1, 'g+', 'LineWidth', 4);
    text(x2, y2, sprintf(' %d', i), 'color', 'red');
    plot(x2, y2, 'rx', 'LineWidth', 4);
  endfor
 
endfunction
