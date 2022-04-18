% (C) Jan Skwarek
function X = rozwiazUkladRownanUL(A, B)
    % korzystamy z wczesniejszej funkcji aby uzyskac rozklad UL macierzy A
    [upperA, lowerA] = rozkladCroutaUL(A);
    % rozwiazuje rownanie UY = B
    Y = upperA\B;
    % rozwiazuje rownanie LX = Y
    X = lowerA\Y;
end
