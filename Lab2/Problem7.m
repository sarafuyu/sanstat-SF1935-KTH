%% Multipel linjär regression
% Läs in datafilen
data = readmatrix('birth.dat');

% Hämta variablerna
birth_weight = data(:, 3);
mothers_height = data(:, 16);
mothers_weight = data(:, 15);
smoking = data(:, 24);
categorical_var = mothers_weight; % Modifiera detta för att extrahera kategoriseringen från Problem 4

% Enkel linjär regression: Födelsevikt beroende av moderns längd
X_simple = [ones(size(mothers_height)), mothers_height];
simple_model = X_simple \ birth_weight;

% Multipel linjär regression: Födelsevikt beroende av moderns längd, moderns vikt, rökvanor och kategorisk variabel
X_multiple = [ones(size(mothers_height)), mothers_height, mothers_weight, smoking];
multiple_model = X_multiple \ birth_weight;

% Konfidensintervall för den multipel regressionsmodellen
alpha = 0.05; % 95% konfidensintervall
n = length(birth_weight);
p = size(X_multiple, 2);
[~, int, r, ~, ~] = regress(birth_weight, X_multiple, alpha);

for i=1:4
    fprintf('konfidensintervall %.d: från %.2f till %.2f\n', i, int(1,1), int(1,2));
end

% Residualer
% residuals = birth_weight - X_multiple * multiple_model;

% Normplot för residualerna
normplot(r);
title('Normplot för residualerna från multipel linjär regression');