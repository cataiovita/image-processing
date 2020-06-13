function [A, b] = generate_probabilities_system(rows)
  countline = 1;
  elems = 1;
  dim = (rows * (rows + 1)) / 2;
  corner = ((rows * rows - rows) / 2) + 1;
  n = 1;
 
  A = zeros(dim, dim);
  b = zeros(dim, 1);
  plast = zeros(1, dim);
  pcurrent = zeros(1, dim);
  pleft = zeros(1, dim);
  pright = zeros(1, dim);
    
  while (countline <= rows)   
    right = elems + countline - 1;
    left = elems;
    while (n <= countline)
      
      if elems == 1 || elems == dim || elems == corner
        pcurrent(elems) = 4;
      else if countline == rows
        pcurrent(elems) = 5;
      else if elems == right || elems == left
        pcurrent(elems) = 5;
      else
        pcurrent(elems) = 6;
      endif
      endif
      endif
    
      if elems == 1
        pcurrent(elems + countline) = -1;
        pcurrent(elems + countline + 1) = -1;
      endif
     
      if elems == right && elems + countline <= dim && elems != 1
        pcurrent(elems + countline) = -1;
        pcurrent(elems - countline) = -1;
        pcurrent(elems + countline + 1) = -1;
        pcurrent(elems - 1) = -1;
      
      else if elems == left && elems + countline <= dim && elems != 1
        pcurrent(elems + countline) = -1;
        pcurrent(elems + 1) = -1;
        pcurrent(elems + countline + 1) = -1;
        pcurrent(elems - countline + 1) = -1;
 
      else if countline == rows 
        if elems != left
          pcurrent(elems - countline) = -1;
          pcurrent(elems - 1) = -1;
        else
          pcurrent(elems - countline + 1) = -1;
        endif
        
        if elems != dim
          pcurrent(elems + 1) = -1;
        endif
        
        if elems != dim && elems != left
          pcurrent(elems - countline + 1) = -1;
        endif
        
      else if elems != 1
        pcurrent(elems + countline) = -1;
        pcurrent(elems - countline) = -1;
        pcurrent(elems + countline + 1) = -1;
        pcurrent(elems - countline + 1) = -1;
        pcurrent(elems - 1) = -1;
        pcurrent(elems + 1) = -1;
      endif
      endif
      endif
      endif    
      
      A(elems, :) = pcurrent;
 
      if rows == countline
        for i=elems:dim
          b(i) = 1;
        endfor
      endif
  
      elems++;
      plast = pcurrent;
      pcurrent = zeros(1, dim);
      n++;
    endwhile
  countline++;
  n = 1;
  endwhile
endfunction