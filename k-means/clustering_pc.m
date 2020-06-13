function [centroids] = clustering_pc(points, NC)
  [n m] = size(points);
  centroids = zeros(NC, m);
  centroidsf = zeros(m * NC, 1);
  coord = points(1, :);
  cluster = zeros(n / NC, NC);
  
  cluster(:, 1) = [0 : NC : n - 1]';
  cluster(1, 1) = 1; 
  j = 1;
  k = 1; 
  divide = n / NC;
  for j = 0 : (m - 1)
    for i= 0: (NC - 1)
      points(j * n + i + 1 : NC : (j + 1) * n)';
      centroidsf(k, :) = (sum(points(j * n + i + 1 : NC : (j + 1) * n))) / divide;
      NC;
      k++;
    endfor
  endfor
    
  for i=0 : (m - 1)
    centroids(:, i + 1) = centroidsf(i * NC + 1 : NC*(i + 1), 1);
  endfor
   
  # FUNCTIE 2
  j = 1;
  prev_point = 10 ^ 3;
  index = zeros(n, 1);
 
  old_centroid = centroids;
  for i = 1: 20
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
              k = j;
           endif
        endfor
        # creez vectorul de indexi in care am pozitiile punctelor in centroizi
        index(i) = k;
      endfor
      index;

      new_index = 0;
      for i=1:NC
        # caut prin interior sa gasesc fiecare indice din point si gasesc noul
        # indice din cluster 
        new_index = find(index == i);
        [sizz hot] = size(find(index == i));
        new_index;
        # daca se afla mai mult de 1 element in centroid, fac media punctelor
        if sizz > 1
            centroids(i, :) = mean(points(new_index, :));
        else if sizz == 1
            centroids(i, :) = points(new_index, :);
        else if sizz == 0
            i;
            centroids(i, :) = 0;
        endif
        endif
        endif
      
        # daca nu, las punctul singur in centroid 
     endfor
      old_centroid;
      old_centroid = centroids;
   endfor
endfunction  
