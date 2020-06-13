function [values, colind, rowptr] = matrix_to_csr(A)
  [n n] = size(A);
  nz = 1;
  f = 0;
  first = 0;
  
  for i=1:n
    first = 0;
   for k=1:n    
      if (A(i, k) != 0)
        values(nz) = A(i, k);
        colind(nz) = k;
        
        if first == 0
          f++;
          rowptr(f) = nz;
          first++; 
        endif
        
        nz++;
      endif
    endfor
  endfor
  f++;
  rowptr(f) = nz; 
    rowptr
endfunction