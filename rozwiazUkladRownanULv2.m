function result = rozwiazUkladRownanULv2(A, b)
    [upperA, lowerA] = rozkladCroutaUL(A);
    y = backwardSubstitution(upperA, b);
    result = forwardSubstitution(lowerA, y);
end
