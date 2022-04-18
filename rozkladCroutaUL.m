% (C) Jan Skwarek
function [U, L] = rozkladCroutaUL(A)
    % sprawdzamy wymiary macierzy A
    [rows, columns] = size(A);
    % przypadek w ktorym macierz A nie jest kwadratowa - rozklad UL takiej
    % macierzy nie istnieje - wyrzucamy blad
    if rows ~= columns
        error("Macierz nie jest kwadratowa!")
    end
    % standardowa implementacja algorytmu rozkladu Crouta, zmienione sa
    % tylko nieco indeksy aby uzyskac rozklad UL zamiast rozkladu LU
    for i = rows:-1:1
        % uzupelniamy ostatni rzad macierzy L
        L(rows, i) = A(rows, i);
        % w rozkladzie Crouta macierz gornotrojkatna ma jedynki na glownej
        % przekatnej
        U(i, i) = 1;
    end
    for j = rows - 1:-1:1
        if L(rows, rows) == 0 || abs(L(rows, rows)) < 1e-5
            % wartosc w ostatnim wierszu w ostatniej kolumnie nie moze byc
            % rowna zero - dzielenie przez zero - jeden z wiodacych minorow
            % glownych ale patrzac od prawego dolnego rogu macierzy moze
            % byc rowny zero
            error("Dzielenie przez zero!" + ...
                " Jeden z wiodacych minorow glownych, ale liczonych od" + ...
                " prawego dolnego rogu macierzy wejsciowej jest rowny zero!" + ...
                " Rozkład UL nie istnieje.")
        end
        % uzupelniamy ostatnia kolumne macierzy U
        U(j, rows) = A(j, rows) / L(rows, rows);
    end
    for i = rows - 1:-1:1
        for j = rows - 1:-1:i
            % uzupelniamy kolejne kolumny macierzy L
            L(j, i) = A(j, i) - dot(L(rows:-1:j + 1, i), U(j, rows:-1:j + 1));
        end
        for j = i - 1:-1:1
            % sprawdzamy czy na glownej przekatnej macierzy L pojawilo sie
            % zero. Jezeli tak, to przerywamy program i wyrzucamy blad -
            % rozklad UL nie istnieje - jeden z wiodacych minorow glownych
            % ale patrzac od prawego dolnego rogu macierzy wejsciowej A
            % jest rowny zero
            if L(i, i) == 0 || abs(L(i, i)) < 1e-5
                error("det(L) bliski zeru. Dzielenie przez zero!" + ...
                    " Jeden z wiodacych minorow glownych, ale liczonych" + ...
                    " od prawego dolnego rogu macierzy wejsciowej jest rowny zero!" + ...
                    " Rozkład UL nie istnieje.")
            end
            % uzupelniamy kolejne kolumny macierzy U
            U(j, i) = (A(j, i) - dot(L(rows:-1:i + 1, i), U(j, rows:-1:i + 1))) / L(i, i);
        end
    end
end
