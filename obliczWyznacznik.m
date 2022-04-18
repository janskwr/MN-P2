% (C) Jan Skwarek
function wyznacznik = obliczWyznacznik(A)
    % korzystamy z wczesniejszej funkcji aby uzyskac rozklad UL macierzy A
    [~, lowerA] = rozkladCroutaUL(A);
    % sprawdzamy wymiary macierzy A
    [rows, ~] = size(A);
    wyznacznik = 1;
    % mnozymy kolejne wartosci znajdujace sie na przekatnej macierzy
    % dolnotrojkatnej L
    for i = 1:rows
        wyznacznik = wyznacznik * lowerA(i, i); 
    end
end
