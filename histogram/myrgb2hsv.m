function [hsvimage] = myrgb2hsv(rgbimage)
  
  R = double(rgbimage(:, :, 1));
  G = double(rgbimage(:, :, 2));
  B = double(rgbimage(:, :, 3));
 
  R1 = zeros(size(R));
  G1 = zeros(size(G));
  B1 = zeros(size(B));

  H = zeros(size(R1));
  S = zeros(size(G1));
  V = zeros(size(B1));
 
  R1 = R / double(255);
  G1 = G / double(255);
  B1 = B / double(255);
  
  Cmax = double(max(max(R1, G1), B1));
  Cmin = double(min(min(R1, G1), B1));
 
  delta = double(Cmax - Cmin);

  if Cmax == 0
    S = 0;
  else
    S = (delta ./ Cmax);
  endif
  
  V = Cmax;
  [m n] = size(delta);
  
  for i = 1 : m
    for j = 1 : n
      H(i, j) = Hhelper(H(i, j), delta(i, j), Cmax(i, j), R1(i, j), G1(i, j), B1(i, j));
    endfor
  endfor
  
  hsvimage = zeros(size(rgbimage));
  hsvimage(:, :, 1) = H;
  hsvimage(:, :, 2) = S;
  hsvimage(:, :, 3) = V;

 endfunction