function result = forwardSubstitution(L, b)
    [n, ~] = size(L);
    result(1, 1) = b(1) / L(1, 1);
    for i = 2:n
        result(i, 1) = (b(i) - L(i, 1:i - 1) * result(1:i - 1, 1)) ./ L(i, i);
    end
