function [cost] = compute_cost_pc(points, centroids)
  [n m] = size(points);
  [NC l] = size(centroids);
  cost = zeros(n, 1);
   for i = 1 : n
      nextpoint = 10^3;
      prev_point = 10^3;
      k = 1;
      for j = 1 : NC
         # calculez distanta fiecarui punct pentru fiecare centroid
           nextpoint = norm(points(i, :) - centroids(j, :));
         # sar peste fiecare previous, ma mut la alt centroid
         if nextpoint < prev_point
            prev_point = nextpoint;
            # salvez in k pozitia de iteratie(fostul index al punctului)
            cost(i) = prev_point;
         endif
      endfor
      # creez vectorul de indexi in care am pozitiile punctelor in centroizi
    endfor
    cost = sum(cost(:, 1));
endfunction