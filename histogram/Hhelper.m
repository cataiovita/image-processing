function [H] = Hhelper(H, delta, Cmax, R1, G1, B1)
  
  if delta == 0
   H = 0;
  else
    if Cmax == R1
      H = 60 * (mod((G1 - B1) ./ delta, 6)); 
  endif
   
    if Cmax == G1
      H =  60 * (double((B1 - R1) ./ delta + 2));
   endif
    
    if Cmax == B1
      H =  60 * (double((R1 - G1) ./ delta + 4));
   endif
  endif
    
    H = double(H / 360);
endfunction