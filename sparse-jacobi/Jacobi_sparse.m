function [x] = Jacobi_sparse(G_values, G_colind, G_rowptr, c, tol)
  [m n] = size(G_rowptr);
  f = n - 1;
  prev_x = zeros(1, f);
  while 1
    x = csr_multiplication(G_values, G_colind, G_rowptr, prev_x) + c;
    err = norm(x - prev_x);
    if ( err < tol)
      return;
    endif
    
    prev_x = x;
  endwhile
endfunction