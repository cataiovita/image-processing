function [sol] = hsvHistogram(path_to_image, count_bins)
  img = imread(path_to_image);
  
  newimage = myrgb2hsv(img);
  
  sol = zeros(1, count_bins * 3);
  l = 0;
  for j = 1 : 3
    param = histc(newimage(:, :, j), linspace(0, 1.01, count_bins + 1))';
    for i = 0 : (count_bins - 1)
      sol(:, l * count_bins + i + 1) = sum((param(:, i + 1)));
    endfor 
   l++; 
  endfor
endfunction

  