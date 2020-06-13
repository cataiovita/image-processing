function [sol] = rgbHistogram(path_to_image, count_bins)
  # vectorul histograma
  sol = zeros(1, count_bins * 3);
  # matricea de intervale;
  intervals = zeros(count_bins, count_bins);
  # matricea imagine pe care o parcurg;
  img = imread(path_to_image); 
  # iterez prin fiecare matrice r-g-b;
  l = 0;
  for j = 1 : 3
    param = histc(img(:, :, j), [0 : 256 / count_bins : 256])';
    for i = 0 : (count_bins - 1)
      sol(:, l * count_bins + i + 1) = sum((param(:, i + 1)));
    endfor 
   l++; 
 endfor
 sol
endfunction