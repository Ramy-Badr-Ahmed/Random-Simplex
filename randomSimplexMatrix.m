function y = randomSimplexMatrix(n,m)
    
    % Generate m x n matrix of random numbers between 0 and 1
    C = rand(m, n); 
    
    % Transform elements of C to ensure each row sums to 1
    p = -log(C);
    S = sum(p, 2);

    % Sum each row to 1
    y = p ./ S;  
    
    % Test each row sums to 1
    row_sums = sum(y, 2);
    assert(all(abs(row_sums - 1) < 1e-10), 'Error: Rows do not sum to 1.');
end