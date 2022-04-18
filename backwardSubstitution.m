function result = backwardSubstitution(U, b)
    [n, ~] = size(U);
    result(n, 1) = b(n) / U(n, n);
    for i = n - 1:-1:1
        result(i, 1) = (b(i) - U(i, i + 1:n) * result(i + 1:n, 1)) ./ U(i, i);
    end
