% (C) Jan Skwarek
function invMatrix = wyznaczMacierzOdwrotna(A)
    % korzystamy z wczesniejszej funkcji aby uzyskac rozklad UL macierzy A
    [upperA, lowerA] = rozkladCroutaUL(A);
    % sprawdzamy wymiary macierzy A
    [rows, ~] = size(A);
    % tworzymy macierz jednostkowa potrzebna do wyznaczenia macierzy
    % odwrotnej
    identityMatrix = eye(rows);
    % UY = I
    Y = upperA\identityMatrix;
    % Lx = Y, gdzie x to macierz odwrotna do macierzy wejsciowej A
    invMatrix = lowerA\Y;
end
